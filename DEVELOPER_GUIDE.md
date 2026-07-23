# 🛠️ RPG Loot 数据包 开发者维护与二次开发指南 (Developer Guide)

> **目标读者**：开发者、社区贡献者、二次开发（Mod/Datapack）作者  
> **适用引擎版本**：Minecraft Java Edition 1.21.4 / 26.2+ (`pack_format: 61`)

本指南旨在详细说明 **RPG Loot 数据包** 的架构原理、代码规范，并提供**修改爆率**、**新增武器特效/工具类型**、**扩展怪物等级**以及**后续 MC大版本迁移**的标准开发流程（SOP）。

---

## 目录
1. [🏗️ 项目架构与目录结构说明](#1-项目架构与目录结构说明)
2. [🎲 如何修改掉落概率与爆率权重](#2-如何修改掉落概率与爆率权重)
3. [🗡️ 如何新增武器特殊效果与被动神器](#3-如何新增武器特殊效果与被动神器)
4. [⛏️ 如何添加新工具与武器类型 (如长矛、重锤等)](#4-如何添加新工具与武器类型)
5. [👹 如何增加新敌对生物等级与变种怪](#5-如何增加新敌对生物等级与变种怪)
6. [⚠️ MC 26.2+ 关键避坑与兼容规范](#6-mc-262-关键避坑与兼容规范)

---

## 1. 🏗️ 项目架构与目录结构说明

数据包的核心代码分为两大命名空间：

```text
data/
├── minecraft/                   # 原版覆写命名空间
│   └── loot_table/              # 原版实体与宝箱战利品表覆写
│       ├── entities/            # 原版 28 种怪物死亡掉落覆写 (重定向至 RPG Loot)
│       └── chests/              # 地牢/试炼密室/遗迹宝箱战利品注入
└── rpgloot/                     # 数据包自定义命名空间
    ├── functions/               # 全量 mcfunction 逻辑函数 (核心逻辑)
    │   ├── summon/              # 118+ 种各阶级 BOSS 生成函数
    │   ├── items/               # 神器主动/被动技能逻辑函数
    │   ├── options/             # 游戏内设置菜单逻辑函数
    │   ├── tick.mcfunction      # 游戏高频主循环 (每 tick 执行)
    │   └── 1second.mcfunction   # 1 秒时钟周期逻辑
    └── loot_table/              # RPG 专属战利品表 (5大阶级战利品与神器池)
        ├── veteran_loot.json    # 🟢 资深级掉落表
        ├── elite_loot.json      # 🔵 精英级掉落表
        ├── champion_loot.json   # 🟣 冠军级掉落表
        ├── legendary_loot.json  # 🟡 传说级掉落表
        ├── unique_loot.json     # 🔴 副本/独一无二掉落表
        ├── uncommon_items.json  # 🟢 绿色装备池
        ├── rare_items.json      # 🔵 蓝色装备池
        ├── veryrare_items.json  # 🟣 紫色装备池
        └── legendary_items.json # 🟡 金色装备池
```

> 💡 **单复数目录同步规则**：为兼容不同第三方模组/服务端加载器，每次修改 `functions/` 或 `loot_table/` 后，须同步复制更新一份至复数文件夹 `function/` 与 `loot_tables/`。

---

## 2. 🎲 如何修改掉落概率与爆率权重

### 2.1 修改怪物阶级掉落表 (`<tier>_loot.json`)

以 `data/rpgloot/loot_table/legendary_loot.json` 为例，要调整传说怪掉落品质比例：

```json
{
  "pools": [
    {
      "rolls": { "min": 4.0, "max": 6.0 },
      "entries": [
        {
          "type": "minecraft:loot_table",
          "weight": 150,
          "quality": 1,
          "value": "rpgloot:rare_items"
        },
        {
          "type": "minecraft:loot_table",
          "weight": 550,
          "quality": 2,
          "value": "rpgloot:veryrare_items"
        },
        {
          "type": "minecraft:loot_table",
          "weight": 300,
          "quality": 3,
          "value": "rpgloot:legendary_items"
        }
      ]
    }
  ]
}
```

- **修改方法**：计算目标百分比，直接调整 `"weight"` 字段。
- ⚠️ **MC 26.2 必看**：引用嵌套战利品表时，键名**必须叫 `"value"`**（例如 `"value": "rpgloot:rare_items"`），写成旧版 `"name"` 会导致 MC 26.2 Codec 解析报错并掉落 0 件物品！

---

## 3. 🗡️ 如何新增武器特殊效果与被动神器

添加一件全新带有特殊效果的神器（例如“雷霆之怒”：攻击时引发落雷）分为 3 步：

### 第一步：在战利品池 JSON 中定义物品与 NBT 标记

在 `data/rpgloot/loot_table/legendary_items.json` 中添加物品条目：

```json
{
  "type": "minecraft:item",
  "name": "minecraft:diamond_sword",
  "weight": 10,
  "functions": [
    {
      "function": "minecraft:set_name",
      "name": { "text": "Thunder Wrath", "color": "gold" }
    },
    {
      "function": "minecraft:set_custom_data",
      "tag": "{rpgloot_item:\"thunder_wrath\"}"
    }
  ]
}
```

### 第二步：在高频 tick 循环中监听玩家手持

在 `data/rpgloot/functions/tick.mcfunction` 或 `1second.mcfunction` 中加入判断：

```mcfunction
# 检查玩家主手是否持有用自定义标记 rpgloot_item:"thunder_wrath" 的物品
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rpgloot_item:"thunder_wrath"}}}}] run function rpgloot:items/thunder_wrath
```

### 第三步：编写特效实现函数 (`items/thunder_wrath.mcfunction`)

创建 `data/rpgloot/functions/items/thunder_wrath.mcfunction`：

```mcfunction
# 为主手持剑的玩家赋予力量或触发落雷特效
effect give @s minecraft:strength 1 1 true
execute at @s run particle minecraft:electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.1 10
```

---

## 4. ⛏️ 如何添加新工具与武器类型

如果要向数据包中添加全新的武器类型（如长矛、战锤、火枪等）：

1. **在战利品池 JSON (`uncommon_items.json` 等) 中声明**：
   - 设置基底物品 `"name": "minecraft:spear"` 或 `"name": "minecraft:mace"`。
   - 使用 `minecraft:set_attributes` 配置专属属性词条：

```json
{
  "function": "minecraft:set_attributes",
  "modifiers": [
    {
      "name": "damage",
      "attribute": "minecraft:attack_damage",
      "operation": "add_value",
      "slot": "mainhand",
      "amount": { "min": 15.0, "max": 25.0 },
      "id": "rpgloot:attack_damage_mod"
    },
    {
      "name": "attackSpeed",
      "attribute": "minecraft:attack_speed",
      "operation": "add_value",
      "slot": "mainhand",
      "amount": { "min": -2.8, "max": -2.4 },
      "id": "rpgloot:attack_speed_mod"
    }
  ]
}
```

2. **注意属性 ID 规范**：`attribute` 字段必须使用 MC 1.21.2+ 标准无前缀格式（如 `minecraft:attack_damage`，严禁带有旧版 `generic.` 前缀）。

---

## 5. 👹 如何增加新敌对生物等级与变种怪

如果要新增一个新的怪物等级（如 🟠 **Mythic / 神话级**）：

### 第一步：创建生成函数 (`summon/mythic_<mob>.mcfunction`)

在 `data/rpgloot/functions/summon/mythic_zombie.mcfunction` 中写入：

```mcfunction
summon zombie ~ ~ ~ {CanPickUpLoot:1b,CustomName:[{text:"Mythic ",color:"gold"},{text:"Zombie",color:"red"}],CustomNameVisible:1,active_effects:[{id:"minecraft:speed",amplifier:1,duration:999999}],attributes:[{id:"minecraft:max_health",base:150.0},{id:"minecraft:attack_damage",base:12.0}],Health:150.0f,Tags:["rpgloot.boss","rpgloot.mythic"]}
```

⚠️ **CustomName SNBT 复合数组规范**：
在 26.2 中，`CustomName` 必须使用 SNBT 数组形式 `[{text:"Mythic ",color:"gold"},{text:"Zombie",color:"red"}]`，若写成单转义字符串 `CustomName:"{\"text\":\"...\"}"` 会导致头顶直接显示白字原始 JSON 代码！

### 第二步：在随机进化分配逻辑中注册

在 `data/rpgloot/functions/make_boss_this_mob.mcfunction` 中加入新阶级的随机权重区间：

```mcfunction
execute if score rpgloot rpgloot.rng matches 95..99 at @s run function rpgloot:summon/legendary_zombie
execute if score rpgloot rpgloot.rng matches 100 at @s run function rpgloot:summon/mythic_zombie
```

### 第三步：为原版怪物掉落注册覆写

在 `data/minecraft/loot_table/entities/zombie.json` 中配置该 Tag 的死后掉落重定向：

```json
{
  "type": "minecraft:loot_table",
  "weight": 1,
  "quality": 5,
  "conditions": [
    {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": { "type_specific": { "type": "player" } }
    },
    {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": { "nbt": "{Tags:[\"rpgloot.mythic\"]}" }
    }
  ],
  "value": "rpgloot:mythic_loot"
}
```

---

## 6. ⚠️ MC 26.2+ 关键避坑与兼容规范

在维护或开发本项目时，**必须严格遵守以下 5 大 MC 26.2 引擎防崩规则**：

1. **`death_loot_table` NBT 被移除**：
   - Mojang 在 MC 26.2 中彻底废弃了实体 NBT 里的 `death_loot_table` 字段。任何写在 `/summon` 里的 `death_loot_table:"rpgloot:xxx"` 都会被游戏静默忽略。
   - 必须通过 `data/minecraft/loot_table/entities/<mob>.json` 重定向掉落。

2. **嵌套战利品表递归检测 (Recursion Loop)**：
   - `data/minecraft/loot_table/entities/zombie.json` 中**绝对不能**再引用 `"value": "minecraft:entities/zombie"`，否则游戏会检测出无限循环递归，直接输出 `Dropped 0 [Air]`！

3. **`enchant_with_levels` 格式规范**：
   - 附魔函数里的 `levels` 必须为纯数字范围对象：`"levels": {"min": 10, "max": 20}`。
   - 绝对不能在 `levels` 内部包含 `"type": "minecraft:uniform"`，否则解析器会拒绝加载战利品表。

4. **指令中的非 ASCII 字符转义**：
   - 在 `.mcfunction` 命令文件中，如果包含中文或特殊字符（如 `═` 或 `⚔️`），建议使用 Unicode 转义（如 `\u2694\ufe0f`），避免某些服务端在加载字符集时引发 `Invalid string contents` 语法解析崩坏。

5. **`clickEvent` 与 `hoverEvent` 规范**：
   - `hoverEvent` 动作必须使用 `"contents": "显示文本"`，不能使用旧版 `"value"`。
   - 打开菜单等指令应避免在开头强行调用 `options/default`，防止重置玩家自定义配置。

---

## 🛠️ 本地测试与 E2E 验证脚本

在 `scratch/` 目录下保留了标准的 E2E 自动化测试工具脚本，在完成代码修改后，推荐运行：

```bash
# 验证全局 JSON 格式语法与键名规范
python scratch/verify_json_strict.py

# 启动本地 Minecraft Server 模拟环境并运行开机与击杀测试
python scratch/test_options_click_in_server.py
```

遵循以上规范，即可确保 RPG Loot 数据包在后续版本迭代中保持极高的稳定性与扩展性！
