# RPG Loot 数据包 — 系统规格文档 (SPEC)

> **本文档是项目的单一事实源规格**:描述系统架构、模块边界、运行时契约与扩展点。
> 历史性的 1.19→1.21.4 迁移规格已归档至本文末尾附录。
>
> **适用版本**:数据包 v26.3.x · Minecraft Java **26.2+**(数据包 `pack_format: 107`,资源包 format 88)
> 注:Mojang 自 2026 年起采用 `年.序号` 版本号(26.2 数据版本 4903、协议 776)。历史文档中的"1.21.4 / pack_format 61"为迁移中间态,已过时;本包命令语法(`click_event`、SNBT CustomName 等)以 26.2 实测为准(E2E 服务器即 26.2)。
> **配套文档**:[DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md)(操作手册)· [MAINTENANCE.md](MAINTENANCE.md)(维护流程)· [AUDIT_REPORT.md](AUDIT_REPORT.md)(缺陷审计)

---

## 1. 系统概述

RPG Loot 为原版 Minecraft 附加一套 RPG 化战利品系统,由 **数据包**(逻辑与掉落)和可选的 **资源包**(简体中文翻译)组成。核心玩法系统:

| 系统 | 说明 | 主要代码位置 |
| :--- | :--- | :--- |
| 怪物品阶进化 | 自然刷新的敌对生物按概率进化为 5 档品阶怪 | `function/5tics` → `try_transform_mob` → `make_boss*` |
| 品阶战利品 | 品阶怪死亡掉落对应品质装备/消耗品 | `loot_table/<tier>_loot.json` → 品质物品池 |
| 独特 Boss | 具名 Boss(Carlos、Wraith、Vassal 等)与 bossbar | `function/bosses/`、`function/summon/` |
| 神器效果 | 特殊物品的主/被动技能(按 `custom_data` 标记检测) | `function/item_effects*`、`function/items/` |
| 套装加成 | 穿戴成套装备触发增益 | `function/set_bonuses` |
| 世界事件 | 周期性随机全局事件(亡灵潮、爬行者之夜等) | `function/events/` |
| 结构/据点 | 自定义结构生成、掠夺者据点、献祭祭坛 | `function/structures/`、`settlements/`、`sacrifices/` |
| 藏宝图与定位 | 结构定位、地图物品 | `function/locate/`、`maps/` |
| 游戏内配置 | 聊天栏点击式设置/调试菜单 | `function/options/`、`debug` |

---

## 2. 目录结构与单一事实源

```text
<repo>/
├── pack.mcmeta                  # 数据包元数据 (pack_format 107, MC 26.2+)
├── VERSION                      # 发布版本号单一来源 (tools/package.py 读取)
├── data/
│   ├── minecraft/               # 原版覆写命名空间
│   │   ├── loot_table/
│   │   │   ├── entities/        # 28 种原版怪物掉落覆写(按 rpgloot tag 重定向)
│   │   │   └── chests/          # 宝箱注入(含 trial_chambers)
│   │   └── tags/function/       # load/tick 注册
│   ├── rpgloot/
│   │   ├── function/            # 全部 mcfunction 逻辑
│   │   │   ├── bosses/ enemies/ events/ items/ locate/ maps/
│   │   │   ├── options/ rng/ sacrifices/ settlements/ structures/
│   │   │   ├── summon/          # 99 个品阶/Boss 生成函数(每怪一文件)
│   │   │   └── admin/ debug/
│   │   ├── loot_table/          # tier 掉落表 + 品质物品池 + boss 专属表
│   │   ├── advancement/         # 成就与配方解锁
│   │   ├── recipe/              # 合成配方(藏宝图、重铸符文等)
│   │   ├── structure/           # NBT 结构模板
│   │   ├── tags/entity_type/    # 实体类型标签 (arrows、normal_and_nether_mobs 等)
│   │   └── worldgen/            # 结构生成注册
├── resourcepack/                # 中文资源包 (en_us.json / zh_cn.json)
├── tests/                       # 可重复测试 (deep_verification / e2e)
├── tools/                       # 构建工具 (package.py)
├── scratch/                     # 历史一次性脚本(git 忽略,不参与构建)
└── build/                       # 打包产物 (git 忽略)
```

**目录命名规则(强制)**:一律使用 1.21+ **单数**命名(`function/`、`loot_table/`、`advancement/`、`recipe/`、`tags/function/`)。历史上曾同时维护复数旧命名镜像(`functions/` 等),导致两次实际分叉事故(v26.2.16 修复只进了单数侧、v26.2.17 i18n 重构漏掉复数侧 57 个文件),且 `recipes/` 从未迁移单数导致合成系统在目标版本整体失效——**v26.3.0 起复数镜像已全部删除,禁止重建**。

---

## 3. 运行时架构

### 3.1 入口与调度

```
minecraft:load  ─→ rpgloot:loaded     # 一次性:创建全部 scoreboard、启动 schedule 链
minecraft:tick  ─→ rpgloot:tick      # 每 tick:trigger 菜单分发、bossbar 维护、计时器自增
schedule 链 (loaded 中启动,各函数末尾自续):
  rpgloot:5tics      # 每 5 tick:新刷怪物即时转化、敌方效果、特殊弹射物
  rpgloot:1second    # 每 1s:物品效果、Carlos AI、世界事件计时
  rpgloot:5seconds   # 每 5s:Boss 兜底刷新、据点检查、暴虐之夜、发光
  rpgloot:10seconds  # 每 10s:低频物品效果 (tomeofchaos)
```

**契约**:
- 每个 schedule 函数**必须**以 `schedule function rpgloot:<self> <t> replace` 自续;链条一旦因异常中断不会自愈(`loaded` 仅在 reload/世界加载时重建)。
- `tick` 中的 objective 创建与 `scoreboard players enable` 是自愈冗余,保证 trigger 菜单在任何状态下可用。

### 3.2 怪物品阶进化管线

```
自然刷怪 ──5tics──→ try_transform_mob (打 rpgloot.valid_mob 标记, 只处理一次)
                        │ mobset 开启 且 rng(1-100) ≤ boss_chance
                        ↓
                  make_boss_this_mob ──按 rng 权重──→ summon/<tier>_<mob>
周期兜底(每 5s): check_boss_setting → determine_boss → boss_count_check(上限 bosslimitset)
                        → make_boss → 同上权重分配

品阶权重: veteran 55% | elite 31% | champion 11% | legendary 2% | unique 1%
```

进化实现方式:在原怪位置 `summon` 一只带完整 NBT(名字/属性/效果/`Tags:["rpgloot.boss","rpgloot.<tier>"]`/`death_loot_table`)的新怪。**每个 `summon/<tier>_<mob>.mcfunction` 是独立的全量 NBT 定义**——修改品阶模板(如统一调血量)需要批量改动同 tier 的所有文件,这是当前架构最大的复制耦合点(见 AUDIT_REPORT)。

### 3.3 掉落管线(两级引用)

```
品阶怪死亡 ─→ death_loot_table NBT ─→ rpgloot:<tier>_loot ─┬→ rpgloot:uncommon_items
原版怪死亡 ─→ minecraft:entities/<mob> 覆写(按 tag 条件) ──┤   rpgloot:rare_items
宝箱开启  ─→ minecraft:chests/* 注入 ────────────────────┘   rpgloot:veryrare_items
                                                             rpgloot:legendary_items
                                                             rpgloot:*_potions
```

- **双轨掉落路由并存**:97 个 summon 函数在 NBT 里写 `death_loot_table`,同时 28 张原版实体覆写表按 `rpgloot.<tier>` tag 条件重定向。DEVELOPER_GUIDE 断言 26.2 已忽略 `death_loot_table`(若属实,实体覆写表是唯一生效路径)——**扩展新怪时两条都要写**,直到用实测确认其一后再裁撤另一条(见 AUDIT_REPORT B-11)。
- **tier 表**(`veteran/elite/champion/legendary/unique_loot.json`):决定掉落件数与品质权重,类型为 `minecraft:loot_table` 的 entry 用 `value` 键引用物品池(1.21+ 语法,勿用旧 `name` 键)。
- **品质物品池**:唯一定义每件装备(基底物品 + `set_name` + `set_attributes` + `set_custom_data` 标记)的地方。神器检测一律依赖 `custom_data` 标记(如 `{slimeboots:1}`),**禁止**按 `custom_name` 字符串匹配(对颜色/斜体敏感,已在 v26.2.16 全面废弃)。
- 具名 Boss 拥有独立 `<boss>_loot.json`。

### 3.4 物品效果与套装系统

- `1second` → `item_effects`(全局)+ `item_effects_player`(as 每个玩家):按装备槽 `custom_data` 检测并施加效果。
- `set_bonuses`:按 `Inventory` 槽位(100b-103b=盔甲槽)检测套装件,触发常驻效果或 aura 子函数(`flame_set_aura`、`hades_set_aura` 等)。
- 主动技能经 advancement 触发或 `10seconds` 低频轮询(如 tomeofchaos)。

### 3.5 配置注册表(游戏内 options 菜单)

| 设置项 | scoreboard 持有者/objective | 默认值 | 语义 |
| :--- | :--- | :--- | :--- |
| RPG 刷怪开关 | `mob_setting mobset` | 1 | 0=关闭进化 |
| 进化概率 | `rpgloot boss_chance` | 100 | 1-100 (%) |
| 区域 Boss 上限 | `rpgloot bosslimitset` | 30 | 全维度 `rpgloot.boss` 总数上限 |
| 世界随机事件 | `rpgloot eventset` | 0 | 1=开启,每 300s 掷骰 |
| 怪物发光 | `glow_setting glowset` | 0 | 1=Boss 发光 |
| 据点生成 | `pillager_settlements pilset` | — | 每 5min 检查 |

默认值由 `tick` 中的 `execute unless score ... run set` 惰性初始化(自愈)。玩家侧菜单入口:trigger `rpg_help`/`guide`/`rpg_recipes`/`stats`/`rpgloot_opt`/`rpgloot_dbg`(每 tick enable + 分发 + 清零)。

### 3.6 运行时标识符契约

**Entity tags(核心)**:
- `rpgloot.valid_mob` — 已经过进化判定,防重复处理
- `rpgloot.boss` — 一切品阶怪/Boss;计数上限、发光、清理都以它为准
- `rpgloot.<tier>` — `rpgloot.veteran/elite/champion/legendary/unique` 品阶细分,掉落覆写按它路由
- 具名 Boss tag:`carlos`、`wraith`、`vassal`、`blunderbore`、`rpgloot.painelemental`(与同名 bossbar 一一对应)
- 弹射物/机制 tag:`maelstromarrow`、`lightningTrident`、`painelemental.ghastball` 等
- `global.ignore` — 第三方兼容:带此 tag 的实体不参与本包任何逻辑

**Item custom_data 标记**:每件神器一个小写无分隔 key(如 `carloshelm`、`slimeboots`、`ribcageofhades`、`tomeofchaos`、`lucidity`),值恒为 `1`。新增神器必须沿用此约定。

完整 scoreboard/tag 清单见 [MAINTENANCE.md](MAINTENANCE.md) 附表。

---

## 4. 版本与兼容性约束

| 项 | 现状 | 约束 |
| :--- | :--- | :--- |
| pack_format | 107 (MC 26.2);声明 107..999 开区间 | 每逢新 MC 版本发布,须实测后更新上限认知;禁止再写 1..999 之类的虚假"全兼容"声明 |
| 文本组件事件 | `click_event`/`hover_event` 蛇形命名(1.21.5+);`run_command` 用 `command` 键、`change_page` 用 `page` 整数键 | 禁止旧 `clickEvent`/`hoverEvent`(v26.3.0 已全量统一,曾因新旧混用导致半数菜单点击失效) |
| 属性 ID | `minecraft:max_health` 等无前缀格式 (1.21.2+) | 禁止 `generic.*` |
| 物品数据 | 数据组件 (`components`/`custom_data`) | 禁止旧 `tag` NBT |
| loot_table entry | `value` 键 | 禁止旧 `name` 键 |
| CustomName | SNBT 组件数组 `[{text:...,color:...}]`(1.21.5+) | 禁止转义 JSON 字符串 |
| 药水云/弹射物 NBT | AEC 的 `Particle`/`Potion`/`Effects` 与火球 `power`/`direction` 已在 1.20.3~1.20.5 移除 | 光环用 `effect give`,火球用 `Motion`+`acceleration_power`(v26.3.0 已修) |
| i18n | 用户可见文本走 `translate` key,资源包提供 en/zh | 新增文本必须同 commit 同步两个语言文件 |

---

## 5. 扩展点(How to extend)

标准扩展流程详见 DEVELOPER_GUIDE;此处仅列系统边界:

1. **新神器**:物品池 JSON 定义(含 `custom_data` 标记)→ `item_effects*` 或 `items/` 添加检测行 → 语言文件添加 key。不触碰刷怪/掉落管线。
2. **新品阶**:`summon/<tier>_<mob>.mcfunction` × 目标怪种 → `make_boss`/`make_boss_this_mob` 权重区间 → `<tier>_loot.json` → 28 个实体覆写表加 tag 条件路由。改动面大,先看 AUDIT_REPORT 中的模板化建议。
3. **新具名 Boss**:`summon/` 生成函数 + `bosses/` AI 函数 + 专属 loot 表 + bossbar(需在 `loaded` 创建、`tick` 维护血条与可见性)。
4. **新世界事件**:`events/determine_event` 加权重分支 + `events/event_<name>` 实现 + `check_boss_setting` 中的按 `currentevent` 分发。
5. **新设置项**:`options.mcfunction` 菜单行 + `options/<name>on|off` + `tick` 惰性默认值 + 本表 3.5 登记。

---

## 6. 多版本发布体系(v26.3.0+)

**原则:源码树只有一种语法(26.2 原生),旧版本适配全部发生在构建期,仓库永不为兼容而分叉。**

```
data/ (26.2 原生语法)
   │  tools/package.py --target <t>
   ▼
tools/targets.json 声明目标 ──→ tools/transforms.py 变换管线 ──→ build/*-mc<t>.zip
   │                                                                │
   └── 每个 transform 带禁止残留 token 的自动验证                    ▼
                                            tools/verify_target.py --target <t>
                                            (真实服务器加载验证,jar 映射在 tools/servers.json)
```

| 目标 | 覆盖游戏版本 | pack_format | 变换 | 运行时验证 |
| :--- | :--- | :--- | :--- | :--- |
| `26.2` | MC 26.2+ | 107 | 无(原生) | ✅ 真实 26.2 服务器 E2E 全绿 |
| `1.21.9` | 1.21.9–1.21.10 | 88 | time 命令回退 | ⚠️ 仅构建,无本地服务器 |
| `1.21.5` | 1.21.5–1.21.8 | 71 | + 剥离铜质物品 | ⚠️ 仅构建,无本地服务器 |
| `1.21.4` | 1.21–1.21.4 | 61 | + 文本事件驼峰化、CustomName 字符串化、SNBT 转义降级 | ✅ 真实 1.21.4 服务器加载零错误 |

已实现的 transform(`tools/transforms.py`):
1. `time_query_daytime` — 26.2 时钟 API(`time query time` + 模 24000)回退为经典 `time query daytime`。
2. `strip_copper_items` — 移除 1.21.9 才存在的铜质装备 loot entry(否则整张物品池解析失败)。
3. `legacy_text_events` — `click_event/hover_event` 蛇形 → 1.21.4 驼峰;`command/page/url` 键 → `value`;hover `value` → `contents`。
4. `stringify_customname` — SNBT 组件数组 → 1.21.4 的 JSON 字符串形式(构建时做 JSON 合法性自检)。
5. `legacy_snbt_escapes` — 书本命令中 1.21.5+ 的 `\uXXXX` 解码为字面字符、`\n` 降级为 `\\n`(1.21.4 SNBT 不支持这些转义)。

**已知的旧目标运行时降级**(加载通过,但部分机制在旧版失效,属可接受降级):
- 1.21.4 玩家实体没有 `equipment` NBT:`item_effects_player` 的部分装备被动在 1.21.4 构建中不生效;盔甲被动由 `set_bonuses`(Inventory Slot 检测,1.21.4 时代机制)兜底——这正是两套检测并存(AUDIT B-13)的历史原因,**收敛 B-13 前必须保留 set_bonuses 路径**。
- `1.21.5`/`1.21.9` 目标未经真实服务器验证,发布物标注 EXPERIMENTAL;要转正,把对应 server.jar 加入 `tools/servers.json` 后跑 `verify_target` 即可。

**新增目标的流程**:targets.json 加条目(pack_format/范围/变换清单)→ 若语法差异不在现有 transform 覆盖内,在 transforms.py 增加带 `FORBIDDEN_AFTER` 验证的新变换 → `verify_target` 实测 → 更新本表。

---

## 附录 A:1.19.2 → 1.21.4 迁移规格(历史归档)

原 SPEC.md 内容,记录当年迁移的转换规则,仅供追溯:

- pack_format 9 → 61;`supported_formats` 声明。
- 目录单数化:`tags/functions/` → `tags/function/` 等(1.21+)。
- 属性 ID:`generic.maxHealth` → `minecraft:max_health`;NBT `Attributes:[{Name,Base}]` → `attributes:[{id,base}]`。
- 物品 NBT → 数据组件:`display.Name` → `custom_name`,自定义 tag → `custom_data`,选择器 `nbt={Item:{tag:...}}` → `nbt={Item:{components:{"minecraft:custom_data":...}}}`。
- loot table:`set_nbt` → `set_custom_data`/`set_components`;修复 `lost_soul_loot.json` 尾逗号、`swarm_loot.json` 多余括号。
