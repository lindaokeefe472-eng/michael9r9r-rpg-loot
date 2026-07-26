# RPG Loot 维护手册 (MAINTENANCE)

> 目标读者:维护者与贡献者。系统架构与契约见 [SPEC.md](SPEC.md),缺陷底账见 [AUDIT_REPORT.md](AUDIT_REPORT.md),玩法向开发教程见 [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md)。

---

## 1. 铁律(改代码前必读)

1. **只有单数目录**:`data/**/function|loot_table|advancement|recipe|structure|tags/...` 全部使用 1.21+ 单数命名。复数镜像已于 v26.3.0 删除,**任何工具或提交不得重建**(历史上镜像分叉曾导致两个版本的修复丢失)。
2. **版本号只有一个来源**:根目录 `VERSION` 文件。打包(`tools/package.py`)读它;发布时 README 下载名、git tag、Release 标题必须与它一致。
3. **目标游戏版本 = Minecraft 26.2+**(数据包 format 107,资源包 format 88)。文档或代码中出现"1.21.4/pack_format 61"一律视为待清理的历史残留。命令语法基线:`click_event`/`hover_event` 蛇形、SNBT 组件 CustomName、数据组件物品格式。
4. **i18n 同 commit 同步**:任何新增/修改的玩家可见文本,必须用 `translate`+`fallback` 组件,并在同一 commit 更新 `resourcepack/assets/rpgloot/lang/en_us.json` 与 `zh_cn.json` 两个文件。
5. **物品识别用 `custom_data`,不用名字**:检测神器一律 `{"minecraft:custom_data":{<key>:1}}`。铁砧改名触发类机制(Ancient Excavator、Sacrifice 等)是唯一例外——改这些字符串时必须同步改指南书文本与 `loot_beams`。
6. **禁止提交 zip/二进制**:构建产物只存在于 `build/`(已 gitignore),发布走 GitHub Release。
7. **schedule 链自续**:`5tics/1second/5seconds/10seconds` 每个函数末尾的 `schedule ... replace` 不可删除,链断了只有 reload 能救。
8. **新 scoreboard objective 必须在 `loaded.mcfunction` 注册**,新 trigger 还要在 `tick.mcfunction` enable + 分发 + 清零(参考现有 `rpgloot_opt` 的写法)。

## 2. 日常工作流

### 2.1 修改后自检
```bash
python tests/deep_verification.py    # JSON 语法 + 函数/战利品表交叉引用,必须 0 错误
```
CI(GitHub Actions)对每个 push/PR 跑同样的检查并出打包产物。

### 2.2 本地 E2E(发版前)
需要一台 26.2 服务器(仓库外自备,或用 `scratch/e2e_server_test/`):
```bash
python tests/e2e_ci_test.py                       # 开机加载 + 击杀掉落冒烟测试
python tests/verify_trigger_click_response.py     # 菜单 trigger 点击链路
```
注意:这两个脚本仍含本机 java 路径,换机器需改;E2E 前先关掉无关 Java 进程(脚本会 taskkill java)。
验收标准(GEMINI.md §4):服务器日志 0 JSON 解析错误、0 函数加载错误、0 NBT 缺失错误。

### 2.3 发布 SOP(多版本)
1. 更新 `VERSION`(语义:`26.<MC次版本>.<迭代>`,与 MC 版本 26.x 对应)。
2. `python tests/deep_verification.py` 通过。
3. 逐个已映射目标跑运行时验证(**26.2 必须全绿,这是主目标**):
   ```bash
   python tools/verify_target.py --target 26.2
   python tools/verify_target.py --target 1.21.4
   ```
4. `python tools/package.py --all` → `build/` 产出各版本 zip(未经运行时验证的目标带 EXPERIMENTAL 标注,Release 说明里要注明)。
5. 更新 `README.md` 下载表与 Release 链接、`WIKI.md` 版本头。
6. `git tag v<VERSION>` 并推送;zip 作为 GitHub Release 附件上传。
7. 严禁发布脚本里出现 `git add .`。

### 2.4 多版本适配规则
- **源码树永远只写 26.2 原生语法**;旧版本差异一律通过 `tools/transforms.py` 在构建期变换,禁止在 data/ 里写任何版本分支或复数目录。
- 目标矩阵在 `tools/targets.json`;新增/修改变换必须同步 `FORBIDDEN_AFTER` 残留验证,并用 `tools/verify_target.py` 在真实服务器上回归(server.jar 路径配在 `tools/servers.json`,jar 不入库)。
- 改动以下内容时,旧目标极易被波及,提交前务必重跑 1.21.4 验证:文本组件事件(click/hover)、summon NBT、书本类 give 命令、loot 物品清单(新版本独有物品要加进 transforms 的剥离清单)。

## 3. 运行时注册表(修改前先查这里)

### 3.1 关键 scoreboard(存活且有读写方)
| objective | 持有者 | 语义 | 写方 → 读方 |
| :--- | :--- | :--- | :--- |
| `mobset` | `mob_setting` | RPG 刷怪开关 (0/1) | options/mobon,moboff → 5tics/check_boss_setting |
| `boss_chance` | `rpgloot` | 进化概率 % (0-100) | options/±1 → try_transform/determine_boss |
| `bosslimitset` | `rpgloot` | Boss 总数上限 | options/±1limit → boss_count_check |
| `eventset`,`event_timer`,`currentevent` | `rpgloot`,`currenteventp` | 世界事件开关/计时/当前事件 (1-4) | options,1second,determine_event → 5seconds |
| `glowset` | `rpgloot` | Boss 发光开关 | options/glowon,glowoff → 5seconds |
| `pilset`,`pilset1*` | `pillager_settlements` 等 | 据点系统 | settlements/* |
| `rpgloot.rng` | `rpgloot` | 全局 RNG 结果 (1-100) | rng/1-100 → 各判定 |
| `constants` | `rpgloot0/10/14000` | 比较用常量(loaded 初始化) | loaded → 各判定 |
| `timer`,`timer10s`,`timer10sdays` | `rpgloot` | tick/10s/5s 计数链 | tick,5seconds |
| `timeofday` | `rpgloot` | 当日时间(5seconds 刷新) | 5seconds → brutal_night_timecheck |
| `bosscount`,`lostsoulcount` | `rpgloot` | 实体计数缓存 | boss_count_check,pain_elemental_summon_check |
| trigger:`rpg_help`,`guide`,`rpg_recipes`,`stats`,`rpgloot_opt`,`rpgloot_dbg` | 玩家 | 聊天菜单入口(`rpgloot_opt`:1=设置 12=属性 13=随机副本) | tick enable/分发/清零 |
| `Armor`…`Luck`,`DPS`,`multiply` | 玩家 | 属性面板缓存 | stats.mcfunction |

已知**死 objective**(勿新增使用,待清理,见 AUDIT B-17):`dealt`、`lyupic`、`assassinpic`、`atk_cool`、`count`、`rpgloot.boss_var`、`admingencount`、`structuregeneration`、`FB_x1..z2`、`broot`(入口未接线)。

### 3.2 关键 entity tag
| tag | 语义 |
| :--- | :--- |
| `rpgloot.valid_mob` | 已完成进化判定(防重复) |
| `rpgloot.boss` | 一切品阶怪/Boss(计数、发光、清理基准) |
| `rpgloot.veteran/elite/champion/legendary/unique` | 品阶细分,掉落路由条件 |
| `carlos` `wraith` `vassal` `blunderbore` `rpgloot.painelemental` | 具名 Boss(与同名 bossbar 一一对应,tick 维护血条) |
| `rpgloot.spider/plagueswarm/flare/spore/lostsoul` | 特殊敌人机制(enemy_effects/召唤上限) |
| `painelemental.ghastball` `lightningTrident` `maelstromarrow` | 弹射物机制(ghastball 由 1second 自动打标) |
| `global.ignore` | 第三方兼容:带此 tag 的实体不参与本包逻辑 |
| `rpgloot_welcomed` | 玩家已收过欢迎信息(跨 reload 持久) |

命名规范:**新增 tag/objective 一律 `rpgloot.` 前缀 + 小写点分**;表中无前缀/驼峰的是历史遗留,重构时逐步归一。

## 4. 常见维护任务速查

| 任务 | 步骤(详见 SPEC §5 / DEVELOPER_GUIDE) |
| :--- | :--- |
| 新神器 | 品质池 JSON 定义(`set_name` 用 translate+fallback、`set_custom_data` 标记)→ `item_effects*` 加检测行 → 两个语言文件加 key |
| 新品阶怪变体 | `summon/<tier>_<mob>.mcfunction` → 对应品阶分发器加分支 **并把该 type 加进 fallback 排除链** → `5tics` 转化列表加该 type |
| 新具名 Boss | summon 函数 + `bosses/` AI + 专属 loot 表 + bossbar(`loaded` 创建、`tick` 血条维护)+ 死亡清理 |
| 新世界事件 | `events/determine_event` 加权重分支 → `events/event_<n>` 实现 → `5seconds` 按 `currentevent` 分发处加行 |
| 新设置项 | `options.mcfunction` 菜单行 → `options/<n>on|off` → `tick` 惰性默认值(**用 `unless matches 0..`,保住玩家设的 0**)→ SPEC §3.5 登记 |
| 调掉率 | tier `_loot.json` 的池权重 / chest 表的 100/40/10/1 权重;调完跑 `scratch/simulate_all_loot_rates.py` 对比 |

## 5. 排错锦囊

- **/reload 后功能异常**:先看服务器日志里 `rpgloot` 的函数加载错误;90% 是新旧语法混用(`clickEvent`、`generic.*`、物品 `tag` NBT)。
- **菜单点击没反应**:确认对应 trigger 在 `tick.mcfunction` 有 enable+分发+清零三件套;书/菜单里的 `trigger X set N` 的 N 必须 ≥1。
- **怪不掉专属装备**:检查怪身上的 tier tag 与 28 张实体覆写表的条件 tag 是否一致;`death_loot_table` 与覆写表双轨并存,见 AUDIT B-6。
- **设置改了又弹回**:tick 的惰性默认值必须是 `unless matches 0..` 形式(`1..` 会吞掉"关闭"状态)。
- **改了文本游戏里没变**:资源包 zip 未重新打包/未重载;`translate` key 是否两个语言文件都加了。

## 6. 目录与脚本处置约定

- `tests/` 只放**可重复**测试;一次性修复脚本直接进 `scratch/`(git 忽略),永不复用——历史上两个混入 tests/ 的修复脚本重跑会回滚新代码,已删除。
- `scratch/` 只增不改,不参与构建;其中 `simulate_all_loot_rates.py`、`audit_*` 系列可按需提炼进 `tools/`。
- git:功能走 `feature/*`、修复走 `fix/*` 分支;禁 `git add .`;禁提交 zip;每次发布打 tag。
