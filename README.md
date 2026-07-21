# ⚔️ michael9r9r's RPG Loot Data Pack & Resource Pack (MC 1.21.4)

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.21.4-brightgreen.svg)](https://minecraft.net)
[![Data Pack Format](https://img.shields.io/badge/Pack%20Format-61-blue.svg)](https://minecraft.wiki/w/Data_pack)
[![Resource Pack Format](https://img.shields.io/badge/Resource%20Pack-46-orange.svg)](https://minecraft.wiki/w/Resource_pack)
[![Language Support](https://img.shields.io/badge/Language-English%20%7C%20%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-yellow.svg)](#)

[English Installation & Guide](#-english-installation--guide) | [中文安装说明与指南](#-中文安装说明与指南)

---

## 🇺🇸 English Installation & Guide

### 📦 Downloads / 下载

前往 [GitHub Releases](https://github.com/lindaokeefe472-eng/michael9r9r-rpg-loot/releases/tag/v1.21.4) 下载以下两个文件：

| 文件 | 用途 |
| :--- | :--- |
| `michael9r9r-rpg-loot-datapack-v1.21.4.zip` | 数据包本体 (Data Pack) |
| `michael9r9r-rpg-loot-resourcepack-v1.21.4.zip` | 中文翻译资源包 (Resource Pack, 可选) |

---

### 🔧 Step 1: Install the Data Pack (安装数据包)

**适用于新存档 / New World：**
1. 打开 Minecraft，在创建新世界界面点击 **「数据包 (Data Packs)」**。
2. 将 `michael9r9r-rpg-loot-datapack-v1.21.4.zip` **直接拖入** 弹出的文件夹窗口。
3. 在数据包列表中找到它，点击 **▶** 箭头将其移至"已选"列。
4. 点击「完成」并继续创建世界。

**适用于已有存档 / Existing World：**
1. 找到你的存档文件夹：
   - Windows：`%appdata%\.minecraft\saves\<你的存档名>\datapacks\`
   - MacOS / Linux：`~/.minecraft/saves/<你的存档名>/datapacks/`
2. 将 `michael9r9r-rpg-loot-datapack-v1.21.4.zip` **直接复制粘贴** 到 `datapacks` 文件夹中（无需解压！）。
3. 进入游戏后，在聊天框输入：
   ```
   /reload
   ```
4. 如果看到聊天框输出加载成功提示，即代表安装成功！

---

### 🌐 Step 2: Install the Chinese Translation Resource Pack (安装中文翻译资源包，可选)

> 资源包为可选项。安装后，数据包中所有物品、BOSS、提示消息均会显示为简体中文。

**Java Edition 安装步骤：**
1. 找到资源包文件夹：
   - Windows：`%appdata%\.minecraft\resourcepacks\`
   - MacOS / Linux：`~/.minecraft/resourcepacks/`
2. 将 `michael9r9r-rpg-loot-resourcepack-v1.21.4.zip` **直接复制粘贴** 到 `resourcepacks` 文件夹中（无需解压！）。
3. 打开 Minecraft，点击 **「选项 (Options)」→「资源包 (Resource Packs)」**。
4. 在左侧"可用"列表中找到 `michael9r9r-rpg-loot-resourcepack`，点击 **▶** 箭头将其移至"已选"列。
5. 点击「完成」，等待资源包加载，界面中文字段将全部汉化。

---

### ✅ Step 3: Verify Installation (验证安装)

进入世界后，在聊天框中输入以下指令来确认数据包已正常运行：
```
/function rpgloot:give_book
```
如果你收到了一本 RPG 指南书，恭喜安装成功！

你也可以输入以下指令查看你的 RPG 属性面板：
```
/function rpgloot:stats
```

---

### ⚙️ Step 4: Options Menu (可选配置)

输入以下指令打开配置菜单，可调整 BOSS 生成开关、怪物上限数量、地形破坏开关等：
```
/function rpgloot:options
```

---

## 🇨🇳 中文安装说明与指南

### 📦 第一步：下载资源文件

前往 [GitHub Releases 页面](https://github.com/lindaokeefe472-eng/michael9r9r-rpg-loot/releases/tag/v1.21.4) 下载以下两个文件：

| 文件 | 用途 |
| :--- | :--- |
| `michael9r9r-rpg-loot-datapack-v1.21.4.zip` | 数据包本体 |
| `michael9r9r-rpg-loot-resourcepack-v1.21.4.zip` | 中文翻译资源包（可选） |

---

### 🔧 第二步：安装数据包

**如果你是新建存档：**
1. 在 Minecraft 创建新世界界面，点击 **「数据包」**。
2. 将 `michael9r9r-rpg-loot-datapack-v1.21.4.zip` 直接**拖入**弹出的文件夹窗口。
3. 在数据包列表中点击 **▶** 箭头将其移至右侧"已选"列，点击「完成」即可。

**如果你是已有存档：**
1. 找到存档目录下的 `datapacks` 文件夹：
   - Windows 默认路径：`%appdata%\.minecraft\saves\<存档名>\datapacks\`
2. 将 `michael9r9r-rpg-loot-datapack-v1.21.4.zip` **直接复制进该文件夹**（不要解压）。
3. 进入存档，在聊天框输入 `/reload` 重载数据包。

---

### 🌐 第三步：安装中文翻译资源包（可选）

1. 找到资源包目录：Windows 默认路径 `%appdata%\.minecraft\resourcepacks\`
2. 将 `michael9r9r-rpg-loot-resourcepack-v1.21.4.zip` **直接复制进该文件夹**（不要解压）。
3. 打开游戏 → **选项 → 资源包**，在左侧"可用"列表中找到该资源包，点击 **▶** 移至右侧"已选"列，点击「完成」加载即可。
4. 加载完成后，游戏内的 BOSS 名称、物品属性、系统提示等均将显示为**简体中文**。

---

### ✅ 第四步：验证安装

进入存档后，在聊天框输入：
```
/function rpgloot:give_book
```
如果你的背包出现了一本 **RPG 指南书**，说明数据包安装成功！

查看 RPG 属性面板：
```
/function rpgloot:stats
```

打开数据包配置菜单（可调整 BOSS 生成频率、怪物上限等）：
```
/function rpgloot:options
```

---

### ❌ 卸载方式

如需卸载本数据包，请在聊天框输入：
```
/function rpgloot:uninstall
```
该指令会安全清理所有计分板数据，之后再从 `datapacks` 文件夹中删除压缩包即可。

---

## 🇺🇸 English

### 🚀 v1.21.4 Ultimate Upgrade Changelog

We've got a massive update here folks! The entire Data Pack has been fully modernized and ported to **Minecraft 1.21.4 (`pack_format: 61`)** along with an official **i18n Resource Pack (`pack_format: 46`)** featuring native English and Simplified Chinese support!

#### 🛠️ Engine & Mechanics Refactor
- **Pack Format Upgrade**: Updated `pack.mcmeta` to `pack_format: 61` with backward compatibility range `[48, 61]` (MC 1.21 - 1.21.4).
- **Data Component Migration (1.20.5+)**: Fully overhauled all 238 `.mcfunction` files and 122 JSON Loot Tables. Converted legacy NBT `tag:{display:{Name:...}}` to modern MC 1.20.5+ Data Components (`custom_name`, `lore`, `enchantments`, `custom_data`, `dyed_color`, `potion_contents`).
- **Attribute Identifiers Standard (1.21.2+)**: Stripped legacy `generic.` prefixes from attribute commands and entity NBT. Converted `generic.attack_damage` -> `minecraft:attack_damage`, `generic.max_health` -> `minecraft:max_health`, `generic.movement_speed` -> `minecraft:movement_speed`, `generic.knockback_resistance` -> `minecraft:knockback_resistance`, `generic.armor` -> `minecraft:armor`, and `generic.luck` -> `minecraft:luck`.
- **Entity Attributes Compound Structure**: Updated mob NBT from `Attributes:[{Name:"generic.maxHealth", Base:40.0}]` to modern `Attributes:[{id:"minecraft:max_health", base:40.0}]`.
- **Loot Table Modernization**: Converted all 40+ legacy `minecraft:set_nbt` functions to `minecraft:set_custom_data`, `minecraft:set_components`, `minecraft:set_lore`, and `minecraft:set_name`.
- **Tag Folder Restructuring**: Renamed plural tag folders to singular MC 1.21 standards (`tags/function/` and `tags/entity_type/`).
- **JSON Syntax & Repair**: Repaired broken syntax in legacy loot tables (`lost_soul_loot.json` trailing comma & `swarm_loot.json` bracket errors).

---

### ⛏️ Dungeon Spawning & Ritual Mechanics

#### 1. Anvil Pickaxe Dungeon Ritual
- **Diamond Pickaxe (`Ancient Excavator`)**: Rename a Diamond Pickaxe to `Ancient Excavator` in an Anvil and drop it (`Q`) to spawn 1 of 7 Tier 1/2 Dungeons:
  - 🌿 *Overgrown Armory* (15% chance)
  - 📚 *Library* (15% chance)
  - 🌊 *Sunken Ruins* (10% chance)
  - 💎 *Jeweled Caverns* (15% chance)
  - 🌋 *Magma Manufactory* (15% chance)
  - 💀 *Catacombs* (15% chance)
  - 🏜️ *Arid Tomb* (15% chance)
- **Netherite Pickaxe (`Ancient Excavator`)**: Rename a Netherite Pickaxe to `Ancient Excavator` to spawn 1 of 3 Tier 3 End-game Dungeons:
  - 🏰 *Buried Fortress* (33% chance)
  - 🌋 *Brimstone Bastion* (33% chance)
  - 🏛️ *Divine Sanctum* (34% chance)

#### 2. Anvil Item Rituals & RAID Bosses
- `Slime Block` named `Friend Cube` -> Summons **Carlos** RAID Boss.
- `Diamond Block` named `Offering` -> Summons **Wraith** Boss.
- `Ancient Debris` named `Unique Sacrifice` -> Summons **Unique Boss**.
- `Crying Obsidian` named `Sacrifice` -> Summons **Veteran Mob Trial**.
- `Blaze Rod` named `Rod of Banishment` -> Banishes & kills nearby RAID Bosses.
- `Coal Block` named `Infernal Fuel` -> Summons **Pain Elemental** Boss.
- `Raw Iron Block` named `Magic Beans` -> Triggers Magic Beans Ritual.

---

### 🗡️ 50+ Exclusive RPG Artifacts

- **Flame of Firehawk**: Radiates a fire aura (sets mobs within 5 blocks on fire) & grants Fire Resistance.
- **Ribcage of Hades**: Radiates a death aura inflicting Wither on mobs within 8 blocks.
- **Shadow Sabre**: Holding the sword grants Invisibility.
- **Odyssey**: Grants Strength I to all nearby teammates within 12 blocks.
- **Lucidity**: Instantly clears Wither effect.
- **Regeneration Aura**: Grants Regeneration I to all teammates within 8 blocks.
- **Devourer**: Grants Hunger & Regeneration II.
- **Tome of Chaos**: Grants 1 of 11 random buffs for 11 seconds.
- **Slime Boots / Killer Rabbit's Foot**: Grants Jump Boost II.
- **Beowulf**: Grants Dolphin's Grace.

---

## 🇨🇳 中文说明与版本日志

### 🚀 v1.21.4 重磅升级日志

这是一次极其庞大的版本重构！整个数据包已全面升级并原生适配 **Minecraft 1.21.4 (`pack_format: 61`)**，同时配套推出了全新的 **官方多语言资源包 (`pack_format: 46`)**，支持简体中文与英文无缝切换！

#### 🛠️ 引擎底座与底层重构
- **数据包版本号升级**：`pack.mcmeta` 升级至 `pack_format: 61`，支持版本区间 `[48, 61]` (MC 1.21 - 1.21.4)。
- **1.20.5+ 组件系统全面迁移**：重构了全包 **238 个 `.mcfunction` 命令文件** 与 **122 个 JSON Loot Table 文件**。将旧版 NBT `tag:{display:{Name:...}}` 全量转换为现代 Data Components（`custom_name`, `lore`, `enchantments`, `custom_data`, `dyed_color`, `potion_contents`）。
- **1.21.2+ 属性规范标准化**：全面去掉了过时的 `generic.` 属性前缀。将 `generic.attack_damage` -> `minecraft:attack_damage`，`generic.max_health` -> `minecraft:max_health`，`generic.movement_speed` -> `minecraft:movement_speed`，`generic.knockback_resistance` -> `minecraft:knockback_resistance`，`generic.armor` -> `minecraft:armor`，`generic.luck` -> `minecraft:luck`。
- **生物 NBT 结构更新**：生物 NBT 从 `Attributes:[{Name:"generic.maxHealth", Base:40.0}]` 升级为现代 `Attributes:[{id:"minecraft:max_health", base:40.0}]`。
- **战利品表现代化**：将全包 40+ 处旧版 `minecraft:set_nbt` 函数全量升级为 `minecraft:set_custom_data`、`minecraft:set_components`、`minecraft:set_lore` 与 `minecraft:set_name`。
- **标签目录单数重命名**：按照 1.21 标准将复数标签目录重命名为单数（`tags/function/` 与 `tags/entity_type/`）。
- **原包语法修复**：修复了原版遗留的 `lost_soul_loot.json` 末尾逗号错误与 `swarm_loot.json` 多余括号导致的 JSON 解析崩坏问题。

---

### ⛏️ 镐子副本与铁砧改名召唤机制

#### 1. 镐子铁砧改名召唤地下城
- **钻石镐 (`Ancient Excavator` / `远古挖掘者`)**：在铁砧中改名并按 `Q` 丢在地上，将在玩家脚下深处随机生成 7 种 T1/T2 级地下城副本：
  - 🌿 *Overgrown Armory (藤蔓军械库)* [15% 概率]
  - 📚 *Library (失落图书馆)* [15% 概率]
  - 🌊 *Sunken Ruins (沉没废墟)* [10% 概率]
  - 💎 *Jeweled Caverns (宝石洞窟)* [15% 概率]
  - 🌋 *Magma Manufactory (熔岩工坊)* [15% 概率]
  - 💀 *Catacombs (地下墓穴)* [15% 概率]
  - 🏜️ *Arid Tomb (干旱陵墓)* [15% 概率]
- **下界合金镐 (`Ancient Excavator`)**：改名丢在地上生成 3 种 T3 终极高阶副本：
  - 🏰 *Buried Fortress (深埋堡垒)* [33% 概率]
  - 🌋 *Brimstone Bastion (硫磺堡垒)* [33% 概率]
  - 🏛️ *Divine Sanctum (神圣圣殿)* [34% 概率]

#### 2. 铁砧改名丢物仪式与 RAID BOSS
- `史莱姆方块` 改名 `Friend Cube` -> 召唤 RAID BOSS **Carlos (卡洛斯)**！
- `钻石块` 改名 `Offering` -> 召唤高难 BOSS **Wraith (幽灵尊者)**！
- `远古残骸` 改名 `Unique Sacrifice` -> 召唤 **隐藏独特 BOSS**！
- `哭泣的黑曜石` 改名 `Sacrifice` -> 召唤 **资深怪物试炼**！
- `烈焰棒` 改名 `Rod of Banishment` -> **【保命神器】** 瞬间杀死并放逐附近所有 RAID BOSS！
- `煤炭块` 改名 `Infernal Fuel` -> 召唤 BOSS **Pain Elemental (痛苦元素)**！

---

### 🗡️ 50+ 专属神器与特殊被动技能

- **烈焰鹰之火**：放射烈焰光环，点燃半径 5 格内所有怪物，并赋予玩家常驻抗火。
- **冥王胸铠**：放射死灵光环，对半径 8 格内所有敌对怪物施加持续凋零！
- **影之圣剑**：手持时获得全身隐身效果。
- **奥德赛**：战歌之剑，赋予周围所有队友力量 I 增益。
- **清明之冠**：净化效果，免疫并瞬间清除凋零 (Wither) 减益。
- **治愈光环**：赋予周围 8 格内队友生命恢复 I。
- **吞噬者**：获得饥饿效果的同时赋予生命恢复 II。
- **混沌魔典**：使用后从 11 种 BUFF 中随机获得 1 项 11 秒增益！
- **史莱姆靴 / 杀手兔脚**：赋予常驻跳跃提升 II。
- **贝奥武夫**：赋予海豚恩惠快速游泳。

---

## 📜 Historical Release Archive / 历史版本更新日志存档

<details>
<summary><b>Click to expand full changelog history (v1.03 - v1.15) / 点击展开历史日志</b></summary>

#### v1.15
- Replaced Potion of the Magma Diver with Obsidian Skin Potions.
- Added RPG ghast generation with color-coded particle effects.
- Added a new raid boss: The Pain Elemental (Summon by renaming coal block to "Infernal Fuel").
- Added 4 naturally spawning structures: Graveyard, Alpha Castle, Capped Tower, Collapsed Ruins.
- Added the Arid Tomb (Tier 2 dungeon).
- Overhauled Unique Bow Ember & Unique Crossbow Maelstrom.
- Item Balance Nerfs: Torch of darkness (2-4 luck), Comically large spoon (12-16 dmg), Scythe of the Harvester (12-16 dmg), Blóðörn (16-20 dmg), Cleaver (20-25 dmg), Radiance (9-13 dmg), Death's axe (18-23 dmg), Final Flight armor (5-10), etc.

#### v1.14 (by michael9r9r)
- Pack updated to 1.19.
- Added New dungeons - summon with diamond pickaxe "Ancient Excavator".
- Added The Butcher, Spore, Defender of the Grove, Stalker Carapace.
- Added Tier 1 Magma Manufactory & Tier 2 Catacombs.
- Added Raid boss summonable with raw iron block "Magic Beans".
- Added Headless Horseman, Ender Dragon loot table, Wither loot table (Ribcage of Hades, Bone Blast, Wither Bone).
- Added guide book & stat system `/function rpgloot:stats`.

#### v1.13 (by michael9r9r)
- Updated for MC 1.18.2.
- Diamond Pickaxes renamed "Ancient Excavator" only spawn Tier 1 or 2 Dungeons. Netherite Pickaxes required for Tier 3 Dungeons.

#### v1.12.2 / v1.12.3
- Performance & RNG system overhaul thanks to TBlazeWarriorT.
- Crying obsidian named "Sacrifice" spawns veteran mob. Ancient Debris named "Sacrifice" spawns Unique Legendary Mob.

#### v1.12
- Added Tier 3 dungeon: The Divine Sanctum (Boss: The Exalted One).

#### v1.11
- Added Jeweled Caverns (Boss: The Plague Swarm).
- Overhauled options menu (`/function rpgloot:options`).

#### v1.10
- Updated for MC 1.16. Added Brimstone Bastion & Pillager Settlements.

#### v1.08 / v1.09
- Added Buried Fortress & Sunken Ruins.

#### v1.04 - v1.07
- Introduced RPG Mobs, Tiers, Diamond Pickaxe Ancient Excavator spawning, and Phat Loot raid boss.

</details>

---

### 📖 Documentation Links / 教程与百科文档

- 📚 **[WIKI.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/WIKI.md)**: **【RPG Loot 权威百科全书】** 全 BOSS 召唤/技能/掉落物表，全传说/独特神器技能机制图鉴，副本地下城生成与全仪式指南。
- 🎮 **[GAMEPLAY_TUTORIAL.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/GAMEPLAY_TUTORIAL.md)**: Full Gameplay Manual & Quick Start Guide.
- ⚙️ **[SPEC.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/SPEC.md)**: Technical specification & 1.19 -> 1.21.4 engine upgrade blueprint.

- 📦 **[GitHub Release v1.21.4](https://github.com/lindaokeefe472-eng/michael9r9r-rpg-loot/releases/tag/v1.21.4)**: Direct ZIP downloads for Data Pack and Translation Resource Pack.
