# ⚔️ michael9r9r's RPG Loot Data Pack & Resource Pack (MC 1.21.4)

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.21.4-brightgreen.svg)](https://minecraft.net)
[![Data Pack Format](https://img.shields.io/badge/Pack%20Format-61-blue.svg)](https://minecraft.wiki/w/Data_pack)
[![Resource Pack Format](https://img.shields.io/badge/Resource%20Pack-46-orange.svg)](https://minecraft.wiki/w/Resource_pack)
[![Language Support](https://img.shields.io/badge/Language-English%20%7C%20%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-yellow.svg)](#)

[English](#-english) | [中文说明](#-中文说明)

---

## 🇺🇸 English

### Overview
Welcome to **michael9r9r's RPG Loot** Data Pack and Resource Pack updated for **Minecraft 1.21.4**!

This project transforms vanilla Minecraft into an immersive RPG experience with tiered mob spawns, boss fights, custom dungeons, rare weapon drops, special potion effects, and dynamic loot scaling.

It includes both the **Data Pack** (game logic, loot tables, mob tiers, custom structures) and the official **Resource Pack** supporting **English (`en_us`)** and **Simplified Chinese (`zh_cn`)** via native Minecraft `translate` components.

---

### 🌟 Key Features

1. **⛏️ Anvil Rename Dungeon Spawning**:
   - Rename a **Diamond Pickaxe** to `Ancient Excavator` in an Anvil and drop it on the ground (`Q`) to instantly spawn a Tier 1/2 Dungeon (*Overgrown Armory, Library, Sunken Ruins, Jeweled Caverns, Magma Manufactory, Catacombs, Arid Tomb*) beneath your feet!
   - Rename a **Netherite Pickaxe** to `Ancient Excavator` to spawn Tier 3 End-game Dungeons (*Buried Fortress, Brimstone Bastion, Divine Sanctum*).
2. **🔮 Anvil Item Sacrifices & RAID Bosses**:
   - Drop renamed blocks/items on the ground to trigger rituals:
     - `Slime Block` named `Friend Cube` -> Summons **Carlos** RAID Boss.
     - `Diamond Block` named `Offering` -> Summons **Wraith** Boss.
     - `Ancient Debris` named `Unique Sacrifice` -> Summons **Unique Boss**.
     - `Blaze Rod` named `Rod of Banishment` -> Banishes & kills nearby RAID Bosses.
     - `Coal Block` named `Infernal Fuel` -> Summons **Pain Elemental** Boss.
3. **🗡️ 50+ Exclusive RPG Artifacts & Passive Abilities**:
   - *Flame of Firehawk*: Radiates a fire aura, sets nearby hostile mobs on fire & grants Fire Resistance.
   - *Ribcage of Hades*: Radiates a death aura inflicting Wither on nearby hostile mobs.
   - *Shadow Sabre*: Holding the sword grants Invisibility.
   - *Odyssey*: Grants Strength I to all nearby teammates.
   - *Tome of Chaos*: Grants 1 of 11 random buffs for 11 seconds.
4. **⚔️ Tiered Mob System**: Standard mobs spawn as **Veteran**, **Elite**, **Legendary**, or **Spectre** variants with modified attributes and loot.
5. **🌐 Native i18n Language Support**: Automatic English/Chinese translation matching client language settings.

---

### 📦 Installation Guide

#### 1. Data Pack Installation
Place the repository folder (or `.zip`) into your world's `datapacks` folder:
```text
.minecraft/saves/<YOUR_WORLD>/datapacks/
```

#### 2. Resource Pack Installation
Place the `resourcepack/` folder (or zipped `resourcepack.zip`) into your Minecraft `resourcepacks` folder:
```text
.minecraft/resourcepacks/
```
In Minecraft, navigate to **Options -> Resource Packs** and enable **michael9r9r's RPG Loot Resource Pack**.

---

### ⚙️ Useful In-Game Commands

- `/function rpgloot:stats`: Open player RPG attribute panel (Armor, Toughness, DPS, Health, Luck, Speed).
- `/function rpgloot:give_book`: Receive the configuration book.
- `/function rpgloot:options`: Open the system options menu.

---

### 📖 Documentation Links

- 🎮 **[GAMEPLAY_TUTORIAL.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/GAMEPLAY_TUTORIAL.md)**: Full Gameplay Manual & Artifact Ability Guide.
- ⚙️ **[SPEC.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/SPEC.md)**: Technical specification & 1.19 -> 1.21.4 engine upgrade blueprint.

---

## 🇨🇳 中文说明

### 项目简介
欢迎使用适配 **Minecraft 1.21.4** 的 **michael9r9r's RPG Loot 数据包与配套资源包**！

本项目将原版 Minecraft 转化为充满 RPG 探索要素的奇幻世界。包含强化怪物阶级、BOSS 副本战、自定义地下城生成、稀有神器武器、特殊药水被动技能以及动态战利品系统。

包含 **Data Pack**（游戏逻辑、战利品表、怪物阶级、副本结构）与官方 **Resource Pack**（支持 **简体中文 `zh_cn`** 与 **英文 `en_us`** 自动切换）。

---

### 🌟 核心特色与玩法

1. **⛏️ 镐子铁砧改名：瞬间生成地下城副本**:
   - 在铁砧中将 **钻石镐** 改名为 `Ancient Excavator`（资源包下显示 `远古挖掘者`），按 `Q` 键丢在地上，即可在脚下瞬间生成 T1/T2 级地下城副本（*藤蔓军械库、图书馆、沉没废墟、宝石洞窟、熔岩工坊、地下墓穴、干旱陵墓*）！
   - 将 **下界合金镐** 改名为 `Ancient Excavator` 丢在地上，即可生成 T3 级终极副本（*深埋堡垒、硫磺堡垒、神圣圣殿*）！
2. **🔮 铁砧改名丢物：召唤 RAID BOSS 与仪式**:
   - 丢弃铁砧改名后的方块/道具即可触发召唤仪式：
     - `史莱姆方块` 改名 `Friend Cube` -> 召唤 RAID BOSS **Carlos (卡洛斯)**！
     - `钻石块` 改名 `Offering` -> 召唤高难 BOSS **Wraith (幽灵尊者)**！
     - `远古残骸` 改名 `Unique Sacrifice` -> 召唤 **隐藏独特 BOSS**！
     - `烈焰棒` 改名 `Rod of Banishment` -> **【保命神器】** 瞬间放逐并杀死附近所有 RAID BOSS！
     - `煤炭块` 改名 `Infernal Fuel` -> 召唤 **Pain Elemental (痛苦元素)**！
3. **🗡️ 50+ 专属神器与特殊被动技能**:
   - *烈焰鹰之火*：点燃半径 5 格内所有怪物，并赋予玩家常驻抗火。
   - *冥王胸铠*：放射死灵光环，对半径 8 格内所有敌对怪物施加持续凋零！
   - *影之圣剑*：手持时获得全身隐身效果。
   - *奥德赛*：战歌之剑，赋予周围所有队友力量 I 增益。
   - *混沌魔典*：使用后从 11 种 BUFF 中随机获得 1 项 11 秒增益！
4. **⚔️ 强化怪物阶级系统**: 野外怪物概率强化为 **资深 (Veteran)**、**精英 (Elite)**、**传奇 (Legendary)** 或 **幽灵 (Spectre)** 阶级。
5. **🌐 官方中英双语支持**: 根据玩家客户端语言自动切换中文/英文展示。

---

### 📦 安装指南

#### 1. 数据包 (Data Pack) 安装
将项目根目录（或 `.zip` 压缩包）放入存档的 `datapacks` 目录：
```text
.minecraft/saves/<你的存档>/datapacks/
```

#### 2. 资源包 (Resource Pack) 安装
将 `resourcepack/` 目录放入 Minecraft 的 `resourcepacks` 目录：
```text
.minecraft/resourcepacks/
```
进入游戏，在 **选项 -> 资源包** 中启用 **michael9r9r's RPG Loot Resource Pack**。

---

### ⚙️ 常用游戏内指令

- `/function rpgloot:stats`: 打开玩家 RPG 属性面板（护甲、护甲韧性、DPS、生命值、幸运值、移动速度）。
- `/function rpgloot:give_book`: 获取配置书。
- `/function rpgloot:options`: 打开系统设置菜单。

---

### 📖 相关规范与教程文档

- 🎮 **[GAMEPLAY_TUTORIAL.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/GAMEPLAY_TUTORIAL.md)**: 玩家与服主玩法指南、专属装备效果全览、铁砧改名召唤教程。
- ⚙️ **[SPEC.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/SPEC.md)**: 1.19 -> 1.21.4 引擎升级技术规范与架构说明。
