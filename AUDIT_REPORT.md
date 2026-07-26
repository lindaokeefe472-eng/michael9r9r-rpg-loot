# RPG Loot 项目缺陷审计报告(2026-07-26)

> 审计范围:mcfunction 代码质量与耦合、战利品表/JSON、i18n 与文档一致性、测试与构建流程。
> 方法:4 路并行静态审计 + 交叉引用全量扫描 + 对 `scratch/e2e_server_test` 实测服务器的版本取证。
> 结论先行:**项目真实目标版本是 Minecraft 26.2(数据格式 107.1),而非文档宣称的 1.21.4**;最大系统性风险是"复数镜像目录分叉"与"半接线功能"(一处断链导致整个子系统静默失效)。

---

## A. 本次已修复(v26.3.0 工作区)

### A1. 目录解耦(单一事实源)
| # | 修复 | 影响 |
| :- | :--- | :--- |
| 1 | 删除全部复数旧命名镜像:`rpgloot/functions`、`loot_tables`、`advancements`、`structures`、`tags/entity_types`、`minecraft/loot_tables`、`minecraft/tags/functions`、空目录 `predicates`(共 ~290 文件) | 镜像已分叉(function 2 文件、loot_table 57 文件停留在 v26.2.15/16 时代),1.21+ 游戏根本不读复数目录;删除后彻底消灭"改一处忘一处"这一类缺陷 |
| 2 | `recipes/` → `recipe/` 重命名 | **修复整个合成系统**:8 张藏宝图、重铸符文、附魔金苹果的配方此前在目标版本从未被加载,成就 `unlock_maps` 授予的配方 ID 全部悬空 |
| 3 | `pack.mcmeta`:`pack_format 61 + 范围 1..999` → `107 + 107..999` | 终止虚假"Universal Compatible"声明(内容语法为 26.2 专用,低版本必然报错) |
| 4 | 删除 `zified_piglin.json` 拼写错误(→ `zombified_piglin.json`) | 该覆写表因文件名拼错从未生效 |

### A2. 断线功能接线(游戏内实际失效的系统)
| # | 修复 | 此前症状 |
| :- | :--- | :--- |
| 5 | `tick`:补上 `rpgloot_opt`(1=设置菜单/12=属性面板/13=随机副本)与 `rpgloot_dbg`、`stats` 的 trigger 分发+清零;指南书 `set 0` 改 `set 1` | 指南书里"打开设置菜单/查看属性/生成副本"三个点击项全部无响应;非 OP 玩家完全无法进入设置 |
| 6 | `loaded`:注册缺失的 `event_timer` objective | 世界随机事件计时器每秒报错,事件系统从不自动触发 |
| 7 | `loaded`:初始化缺失常量 `rpgloot10`/`rpgloot14000 constants` | Pain Elemental 失魂上限判定与 Brutal Nights 时间判定条件永假 |
| 8 | `5seconds`:补 `time query daytime` → `timeofday` 数据源 | Brutal Nights 读取的 `timeofday` 从未被写入 |
| 9 | `1second`:给 Pain Elemental 80 格内的火球打 `painelemental.ghastball` tag | 检测该 tag 的失魂召唤机制从未触发(没人打这个 tag) |
| 10 | `tick` 惰性默认值改为 `unless matches 0..` | 旧逻辑 `unless matches 1..` 每 tick 把玩家设的 0(关闭)强制改回:**"关闭 RPG 刷怪"开关形同虚设**、进化概率调到 0 会瞬间变回 100 |
| 11 | 四个品阶分发器 fallback 排除链从 8 类补全为 17 类(按各自分支自动生成) | drowned/blaze/ghast 等 9 种怪会同时命中专属分支和 fallback:**一只怪进化出两只 Boss** |
| 12 | `5tics` 转化列表补 enderman、silverfish | 分发器有 enderman 分支但转化列表漏了它:末影人永远不进化 |
| 13 | `options.mcfunction` 发光设置显示的分数持有者 `glow_setting` → `rpgloot` | 菜单里发光设置的当前值永远显示为空 |
| 14 | `loot_beams`/指南书:"Unique Sacrifice" → 实际机制名 "Sacrifice" | 照指南书改名献祭远古残骸永远不生效 |
| 15 | `loaded` 不再清除 `rpgloot_welcomed` tag | 每次 `/reload` 全服玩家重收欢迎消息+指南书 |

### A3. 版本语法修复(在 26.2 上静默失效的旧 NBT)
| # | 修复 | 此前症状 |
| :- | :--- | :--- |
| 16 | `guide.mcfunction`、`admin/generate_menu`:`clickEvent` → `click_event`(`change_page` 用 `page`、`run_command` 用 `command`) | 指南书内页跳转与管理菜单点击全部无效(仓库内新旧两代语法混用,任何版本必有一半是坏的) |
| 17 | `enemy_effects`:废弃的 AEC `Particle/Potion/Effects` NBT → 直接 `effect give`;对玩家 `data merge {Fire:20}`(非法操作)→ `damage ... minecraft:on_fire` | 幽灵/蜘蛛/瘟疫虫群光环只剩空药水云零效果;Flare 点燃机制必定失败 |
| 18 | `bosses/carlosfire`:27 处火球 `direction/power`(1.20.3 已移除)→ `Motion` | Carlos 火球不按设计方向飞行 |
| 19 | `bosses/carlos` 去掉与 `1second` 重复的闪电三叉戟行 | 闪电三叉戟每秒劈两道(双倍触发) |

### A4. i18n 与元数据
| # | 修复 |
| :- | :--- |
| 20 | `en_us.json` 补齐 13 个在用缺失 key(`rpgloot.msg.stat.*` 11 条 + `stats_suffix` + `chieftain_slain` + `structure_revealed`)——英文玩家 `/stats` 面板不再显示原始 key |
| 21 | `advancement/root.json` 背景纹理改为 1.21.2+ 的纹理 ID 格式(修复紫黑棋盘格背景) |

### A5. 战利品表逻辑
| # | 修复 |
| :- | :--- |
| 22 | 28 张实体覆写表 veteran 池条件 `rpgloot.boss`(所有品阶都带)→ `rpgloot.veteran`:高阶怪走原版表路径时掉落不再被最低档稀释 |
| 23 | `wither_skeleton.json` 补回原版骨头与 **2.5% 凋灵骷髅头颅**(killed_by_player + 抢夺加成)掉落——修复被覆写表切断的凋灵/信标进度线 |
| 24 | `simple_dungeon.json` 唱片 entry 三连复制粘贴错误(cat×3)→ cat + otherside |

### A6. 工程与流程
| # | 修复 |
| :- | :--- |
| 25 | 删除危险脚本:`tests/sync_dual_folders.py`(同步方向旧→新,运行会**回滚已修复代码**)、`tests/fix_syntax_errors.py`(重跑会覆盖 v26.2.16 修复)、`tests/fix_missing_structures.py`、`tests/check_dual_folders.py`、`tests/check_load_tag.py`(一次性脚本混入测试目录) |
| 26 | 新增 `VERSION` 文件(单一版本来源)+ `tools/package.py`(参数化打包,替代硬编码 v26.3.0 的未提交脚本) |
| 27 | 重写 `.github/workflows/ci.yml`:改为可真实通过的静态验证门禁(deep_verification + 打包产物上传);原 CI 依赖本机硬编码路径与 gitignore 掉的 server.jar,**从未可能通过**,且打包版本还停在 v26.2.12 |
| 28 | `tests/deep_verification.py` 硬编码绝对路径 → 相对路径(可在 CI 运行) |
| 29 | 文档:重写 `SPEC.md`(迁移备忘录 → 系统规格,含运行时契约与扩展点)、新增 `MAINTENANCE.md`、修正 `GEMINI.md` 双目录同步规则、README/WIKI/DEVELOPER_GUIDE 版本与命令勘误 |

**修复后验证**:`tests/deep_verification.py` 通过 —— 290 函数 / 190 JSON / 135 战利品表,0 语法错误、0 悬空引用。

---

## B. 遗留缺陷 Backlog(按优先级)

### 高优先级(影响玩家体验/正确性)
| # | 位置 | 问题 | 建议 |
| :- | :--- | :--- | :--- |
| B-1 | `function/` 约 46 个文件 ~180 处 | 玩家可见文本硬编码且**中英倒挂**:`locate/menu`(44 处)、`debug`(21)、`options`(16)、`show_recipes`(18)、`welcome_player` 等是硬编码中文(英文玩家看中文);`summon/raid_*`、`settlements/summon_*`、`sacrifices/` 的 Boss 名与播报是硬编码英文(中文玩家看英文)。**zh_cn 里 60 个备好的译文(`rpgloot.boss.*`、`rpgloot.locate.*` 等)因此闲置** | 分批接线 `translate`+`fallback`;优先 locate/menu、options、welcome_player、summon/raid_*(key 已存在,纯接线工作) |
| B-2 | `events/eventhandler` + `5seconds` | `currentevent` 只在下次成功 roll 时重置:事件一旦开始平均持续 ~100 分钟,且 `eventoff` 不停止已激活事件 | 加事件时长计数器;`eventoff` 时置 `currentevent 0` |
| B-3 | 全局 | Boss 死亡后 bossbar 永久残留(全包无 `bossbar remove`/清空逻辑) | `tick` 中对不存在的 boss tag 执行 `bossbar set players`(空) |
| B-4 | `options/uninstall` | 卸载不彻底:漏删 `lostsoulcount`、trigger objectives、bossbar;且数据包仍加载时 tick 下一刻重建一切 | 补全清理清单;提示玩家先 `datapack disable` |
| B-5 | `try_transform_mob` | 逐怪即时进化通道绕过 `bosslimitset` 上限(只有 5 秒周期通道检查上限) | 转化前加 `boss_count_check` 同款计数守卫 |
| B-6 | `summon_unique` / raid 增援等不带 `death_loot_table` 的怪 | 若 26.2 确已忽略 `death_loot_table`(DEVELOPER_GUIDE 断言),97 个 summon 的该字段全是死数据,唯一生效路径是实体覆写表 | 实测确认后二选一:全部删除该字段,或确认其生效则可简化 28 张覆写表 |

### 中优先级(性能/健壮性)
| # | 位置 | 问题 | 建议 |
| :- | :--- | :--- | :--- |
| B-7 | `tick` | 每 tick 10 次无限制 `@e[tag=...]` 全实体扫描(bossbar 维护)+ 每 tick 重建 objectives/enable | bossbar 逻辑挂到 boss 存在性守卫后;objectives add 移回 loaded,tick 只留 enable |
| B-8 | `item_effects`(每秒) | ~30 条 `@e[type=item,nbt=...]`/`@a[nbt={Inventory:...}]` 深度 NBT 匹配是全包最大性能热点 | 改名类检测改为 `custom_data` 标记;背包检测事件化(advancement `inventory_changed`) |
| B-9 | `dungeon_spawns`(每 5t) | 28 条无限制 `@e[tag=...]` 常态空转 | 先 `execute if entity` 短路 |
| B-10 | `5tics` | `@e[type=#rpgloot:arrows]` × 全实体嵌套选择器(平方级),且 `maelstromarrow` 无人打 tag(items/ 断链,机制已死) | 与 B-12 一并处理 |
| B-11 | `structures/random_*.mcfunction` ×7 | 每文件 ~200 行硬编码 setblock 坐标(共 ~1400 行,全包 1/3);roll 1..100 只映射 1..67(33% 空手而归);未加载区块 setblock 静默失败 | 迁移到 `place template` + 宏函数;rng 改 `random value 1..67` |
| B-12 | `items/`、`enemies/` 整个目录 + 65 个无调用方函数 | 死代码:三种特殊箭矢(ember/heal/maelstrom)、4 个 ghastball、14 个 locate 单体、brutal nights 开关入口、`attack`/`motion`/`stats`(旧)/`boss_particles` 等 | 逐项决策"重新接线 or 删除";特殊箭矢显然是被重构断链的完整功能,建议接回 |
| B-13 | `item_effects_player` vs `set_bonuses` | 同一装备两套检测路径(equipment 组件 vs Inventory Slot 100b-103b),效果叠加语义不明 | 收敛为单一检测函数 |
| B-14 | `make_boss` vs `make_boss_this_mob` | 品阶概率表 55/31/11/2/1 双份维护 | 抽公共分发函数 |
| B-15 | loot_table 全域 ~190 处 | `enchant_with_levels` 残留 1.20 时代 `"treasure": true` 死字段;`set_attributes` 残留废弃 `"name"` 字段 | 脚本一次性清理 |

### 低优先级(卫生)
| # | 问题 | 建议 |
| :- | :--- | :--- |
| B-16 | 命名不一致:计分板持有者混乱(`mob_setting mobset` vs `rpgloot glowset`)、tag 风格三种并存(`carlos` 无前缀 / `lightningTrident` 驼峰 / `rpgloot.painelemental` 点分) | 新代码一律 `rpgloot.` 前缀小写;存量按 MAINTENANCE.md 附表逐步归一 |
| B-17 | 15+ 个死 objective(`dealt`、`lyupic`、`atk_cool`、`FB_*` 等定义无读方) | 随 B-12 一并清理 |
| B-18 | git 仓库 211MB:历史提交过 ≥8 个 zip blob,从未 gc | `git gc --aggressive`;可协调时 `git filter-repo` 清历史;发布物走 GitHub Release |
| B-19 | `scratch/` 201MB 含两套完整 MC 服务器 | 保留一套 E2E 服务器,归档其余;`simulate_all_loot_rates.py`/`audit_*` 系列值得提炼进 tools/ |
| B-20 | 根目录 5 个历史 zip(未跟踪) | 删除(产物应只在 build/ 与 GitHub Release) |
| B-21 | advancement 触发过宽:`craft_map`/`reforge_item`/`summon_dungeon` 实为"持有物品"即达成,与文案不符 | criteria 改 `impossible` + 在真实事件点 `advancement grant` |
| B-22 | WIKI.md 生成瑕疵(地下城表格行重复 2-4 次)与"杀蝙蝠必掉传说"等不存在功能的宣传 | 修生成脚本;删除虚假宣传条目 |
| B-23 | git 无 PR 流程、tag 覆盖不全(仅 2 个)、曾有发布脚本内嵌 `git add .` | 按 GEMINI.md §5 执行;发布脚本禁止 `git add .` |

---

## C. 各维度审计详情索引

- **代码质量与耦合**(290 mcfunction):调度骨架(tick/schedule 分层)合理;三类系统性风险——半接线功能(A2 已修 7 处,B-12 存量 65 个死函数)、三代版本语法混杂(A3 已修)、以物品改名字符串+散落常量为跨模块契约(B-8)。
- **战利品表**(135 表):**零复制粘贴耦合**,258 个具名物品每个只定义一次,两级引用(tier 表 → 品质池)是全项目解耦最好的部分;缺陷集中在覆写表与原版行为的偏差(A5 已修 3 处;B-6 双轨路由、M3 类原版机制丢失——28 张实体表无 `killed_by_player`/looting 条件,刷怪塔可白嫖,属设计决策待确认)。
- **i18n**:275 个在用 key,zh 覆盖 100%、en 修复后 100%;真正的债是 B-1(46 文件硬编码中英倒挂)。
- **工程流程**:CI 从未可通过(A6 已修)、版本号五处五说法(A6 部分修复,README 待每次发布同步)、git 历史 211MB(B-18)。

## C2. 追加:真实服务器验证阶段(同日)

静态审计后,用真实服务器跑 E2E 又暴露并修复了 3 个静态检查抓不到的缺陷:
1. **配方仍是 1.20 老格式**:`recipe/` 改名让配方第一次被真正加载,随即暴露 ingredient `{"item": "..."}` 应为纯字符串(1.21.2+)、result `item` 键应为 `id`(1.20.5+)——10 个配方全部修复。
2. **26.2 移除了 `time query daytime`**:新时钟 API 只有 `time query (time|<timeline>|gametime)`;改为 `time query time` + 模 24000 归一化(通过服务器控制台逐个探测确认)。
3. E2E 断言链本身的问题(指向已删除的复数目录、开场全局杀 java 进程、硬编码路径)已一并修复。

**最终验证状态**:26.2 服务器 E2E 全绿(零加载错误 + 52 个 objective 实机注册确认 + trigger 点击链路通过);1.21.4 构建在官方 1.21.4 服务器上加载零错误。多版本发布管线(targets.json + transforms + verify_target)已落地,详见 SPEC §6。

## D. 版本取证备注

`scratch/e2e_server_test/server.jar` 的 `version.json`:id **26.2**,数据版本 4903,协议 776,数据包格式 **107.1**,资源包格式 **88**,build 2026-06-16,stable。之前文档中的"MC 1.21.4 / pack_format 61"是 1.19→1.21.4 迁移期的中间态描述,与当前代码语法(`click_event`、SNBT CustomName、copper 物品)不符;copper_sword 等物品在 ≤1.21.8 非法,这也决定了兼容下限只能是实测过的 26.2。
