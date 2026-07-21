# michael9r9r's RPG Loot Data Pack & Resource Pack (MC 1.21.4)

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.21.4-brightgreen.svg)](https://minecraft.net)
[![Data Pack Format](https://img.shields.io/badge/Pack%20Format-61-blue.svg)](https://minecraft.wiki/w/Data_pack)
[![Resource Pack Format](https://img.shields.io/badge/Resource%20Pack-46-orange.svg)](https://minecraft.wiki/w/Resource_pack)
[![Language Support](https://img.shields.io/badge/Language-English%20%7C%20%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-yellow.svg)](#)

Welcome to **michael9r9r's RPG Loot** Data Pack and Resource Pack updated for Minecraft 1.21.4!

This project contains both the **Data Pack** (game logic, mob tiers, loot tables, structures) and the official **Resource Pack** for full **Simplified Chinese (简体中文)** and **English (en_us)** localization support via native Minecraft `translate` components.

---

## 🌟 Core Features

- 🌐 **Full Chinese & English Localization**:
  - Native Minecraft `translate` keys for Boss names, Mob tiers, Attribute stats, Structure notifications, and RPG items.
  - Automatically displays Chinese when playing in Simplified Chinese (`zh_cn`), and English when playing in English (`en_us`).
- ⚔️ **Mob Tier System**: Standard mobs spawn as **Veteran** (资深), **Elite** (精英), **Legendary** (传奇), or **Spectre** (幽灵) variants with modified attributes and custom abilities.
- 👹 **Unique Bosses & Raids**: Custom bosses including *Abyss Watcher* (深渊监视者), *Dread Knight* (恐惧骑士), *Exalted One* (崇高者), *Headless Horseman* (无头骑士), *Killer Rabbit* (杀手兔), and more!
- 🏰 **Custom Dungeons & Structures**:
  - Alpha Castle, Arid Tomb, Ashen Chambers, Brimstone Bastion, Buried Fortress, Capped Tower, Catacombs, Divine Sanctum, Graveyard, Jeweled Caverns, Magma Manufactory, Sunken Ruins.
- 🗡️ **RPG Items & Custom Loot Tables**: Over 50+ custom items with custom model data, attributes, lore, and potion effects.

---

## 📦 Installation & Setup

### 1. Install Data Pack (数据包安装)
Place the root directory (or zip) into your Minecraft world's `datapacks` folder:
```text
.minecraft/saves/<YOUR_WORLD>/datapacks/
```

### 2. Install Resource Pack (资源包安装)
Place the `resourcepack/` folder (or zipped `resourcepack.zip`) into your Minecraft `resourcepacks` folder:
```text
.minecraft/resourcepacks/
```
In Minecraft, go to **Options -> Resource Packs** and enable **michael9r9r's RPG Loot Resource Pack**.

---

## 📁 Repository Branch Organization

- `main`: Production release branch fully compatible with Minecraft 1.21.4.
- `research`: Research notes, audit scripts, and migration specifications (`SPEC.md`).
- `update-1.21`: 1.21.4 engine migration branch.
- `feature/i18n-resourcepack`: Multi-language Resource Pack & Data Pack translation key integration branch.

---

## 📖 Specifications & Technical Reference

- 🎮 **[GAMEPLAY_TUTORIAL.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/GAMEPLAY_TUTORIAL.md)**: 玩家与服主玩法指南、专属装备效果全览、丢物仪式与指令教程。
- ⚙️ **[SPEC.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/SPEC.md)**: Technical breakdown of changes from MC 1.19 (`pack_format: 9`) to MC 1.21.4 (`pack_format: 61`).

