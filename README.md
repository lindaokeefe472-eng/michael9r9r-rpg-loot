# michael9r9r's RPG Loot Data Pack (MC 1.21.4)

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.21.4-brightgreen.svg)](https://minecraft.net)
[![Data Pack Format](https://img.shields.io/badge/Pack%20Format-61-blue.svg)](https://minecraft.wiki/w/Data_pack)

Welcome to **michael9r9r's RPG Loot** Data Pack updated for Minecraft 1.21.4!

This Data Pack transforms vanilla Minecraft into an immersive RPG experience with tiered mob spawns, boss fights, custom dungeons, rare weapon drops, special potion effects, and dynamic loot scaling.

---

## 🌟 Core Features

- ⚔️ **Mob Tier System**: Standard mobs spawn as **Veteran**, **Elite**, **Legendary**, or **Spectre** variants with modified attributes and abilities.
- 👹 **Unique Bosses & Raids**: Custom bosses including *Abyss Watcher*, *Dread Knight*, *Exalted One*, *Headless Horseman*, *Killer Rabbit*, and more!
- 🏰 **Custom Dungeons & Structures**:
  - Alpha Castle, Arid Tomb, Ashen Chambers, Brimstone Bastion, Buried Fortress, Capped Tower, Catacombs, Divine Sanctum, Graveyard, Jeweled Caverns, Magma Manufactory, Sunken Ruins.
- 🗡️ **RPG Items & Custom Loot Tables**:
  - Over 50+ custom items with custom model data, attributes, lore, and potion effects.
  - Overwritten chest loot tables to populate structures with RPG rewards.
- 📜 **In-game Options & Debug Menu**:
  - Configuration functions for toggling boss spawns, particle effects, and notification settings.

---

## 📁 Repository Branch Organization

- `main`: Updated production branch fully compatible with Minecraft 1.21.4 (`pack_format: 61`).
- `research`: Research notes, audit scripts, and migration specifications (`SPEC.md`).
- `update-1.21`: Feature migration working branch.

---

## 🚀 Installation & Setup

1. Download or clone this repository.
2. Move the folder or `.zip` archive into your world's `datapacks` directory:
   ```text
   .minecraft/saves/<YOUR_WORLD>/datapacks/
   ```
3. Enter your world and run `/reload`.
4. Run `/function rpgloot:give_book` or `/function rpgloot:options` to access settings.

---

## 📖 Specifications & Technical Reference

For detailed breakdown of technical changes from MC 1.19 (`pack_format: 9`) to MC 1.21.4 (`pack_format: 61`), see [SPEC.md](file:///D:/game/mc/michael9r9r-s-rpg-loot-v1-15/SPEC.md).
