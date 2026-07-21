# RPG Loot Datapack Wiki
> **Version:** v26.2 · **Target:** Minecraft Java Edition 1.21.4 / 26.2  
> **Last Updated:** Auto-generated from datapack source

---

## Table of Contents
1. [Getting Started](#1-getting-started)
2. [How to Configure](#2-how-to-configure)
3. [RPG Mob Tiers & Spawn Rates](#3-rpg-mob-tiers--spawn-rates)
4. [Loot Drop Rates](#4-loot-drop-rates)
5. [Item Tiers](#5-item-tiers)
6. [Unique Bosses](#6-unique-bosses)
7. [Dungeon Types](#7-dungeon-types)
8. [Special Items & Effects](#8-special-items--effects)
9. [Debug / Testing](#9-debug--testing)
10. [Commands Reference](#10-commands-reference)

---

## 1. Getting Started

### Installation
1. Download `michael9r9r-rpg-loot-datapack-v26.2.zip` from GitHub Releases
2. Place the ZIP into your world's `datapacks/` folder (do NOT unzip)
3. Start/load the world — run `/reload` if already loaded
4. A diagnostic banner will appear in chat confirming the datapack loaded

### First Steps
- Run `/function rpgloot:options` to open the configuration menu
- Run `/function rpgloot:options/default` to apply recommended default settings
- Run `/function rpgloot:give_book` to receive the in-game guide book

---

## 2. How to Configure

Open the interactive menu with: `/function rpgloot:options`

| Setting | Default | Description |
|---------|---------|-------------|
| RPG Mob Spawning | **ON** | Enable/disable RPG boss mobs spawning |
| Mob Spawn Chance | **5%** | Per-5-second chance a boss spawns near a hostile mob |
| Boss Mob Limit | **10** | Max simultaneous boss mobs in the world |
| Glowing RPG Mobs | OFF | Give boss mobs the glowing effect |
| World Events | ON | Enable random world events |
| World Event Chance | 5% | Per-5-min chance of a world event |
| Brutal Nights | OFF | Harder nights with more frequent spawns |
| Pillager Settlements | OFF | Experimental pillager village system |

---

## 3. RPG Mob Tiers & Spawn Rates

Every **5 seconds**, the datapack rolls a random number (1–100).  
If `roll ≤ Spawn Chance` (default: 5), a boss spawns at a nearby hostile mob.

When a boss spawns, a second roll determines the **tier**:

| Tier | Roll Range | Probability | Health Mult | Damage Mult |
|------|-----------|-------------|-------------|-------------|
| 🟢 **Veteran** | 1–55 | 55% | ~2× | ~2× |
| 🔵 **Elite** | 56–86 | 31% | ~3× | ~3× |
| 🟣 **Champion** | 87–97 | 11% | ~5× | ~5× |
| 🟡 **Legendary** | 98–99 | 2% | ~8× | ~8× |
| 🔴 **Unique** | 100 | 1% | Boss-specific | Boss-specific |

### Spawn Mob Types
Boss mobs can spawn at any naturally occurring:
`cave_spider`, `spider`, `creeper`, `drowned`, `husk`, `phantom`, `silverfish`,
`skeleton`, `slime`, `stray`, `witch`, `zombie`, `zombie_villager`

---

## 4. Loot Drop Rates

All drop rates apply **only when killed by a player**.  
Each kill rolls the loot pool 1–3 times (Veteran) up to 4–6 times (Legendary).

### Per-Roll Tier Selection Odds

| Item Tier | 🟢 Veteran | 🔵 Elite | 🟣 Champion | 🟡 Legendary |
|-----------|-----------|---------|-----------|------------|
| Uncommon | 79.8% | 52.5% | 62.3% | 49.0% |
| Rare | 16.0% | 42.0% | 24.9% | 39.2% |
| Very Rare | 4.0% | 5.2% | 12.5% | 9.8% |
| Legendary | ****0.20%**** | ****0.26%**** | ****0.31%**** | **2.0%** |

> **Reading the table:** A Champion mob rolls its loot pool 3–4 times per kill.  
> Each roll has a **0.31%** chance of pulling from the Legendary item pool.

### XP Bottles (Always Drops, No Kill Condition)

| Tier | Rolls |
|------|-------|
| Veteran | 2–4 bottles |
| Elite | 4–6 bottles |
| Champion | 7–9 bottles |
| Legendary | 11–13 bottles |

---

## 5. Item Tiers

### Overview

| Tier | Items in Pool | Enchant Level | Notes |
|------|--------------|--------------|-------|
| **Uncommon** | 30 items | Low | Iron/Chain/Leather gear, common weapons |
| **Rare** | 37 items | Medium | Diamond gear added, rarer enchants |
| **Very Rare** | 37 items | High | All diamond gear, higher enchant levels |
| **Legendary** | 43 items | Max | Unique named weapons & armor with special enchants |

### Uncommon Items
Standard iron/chain/leather gear and basic weapons. Enchanted with low-tier effects.  
Items include: Swords, Axes, Shields, Helmets, Chestplates, Leggings, Boots, Tridents, Bows

### Rare Items  
Diamond gear begins appearing. Higher enchant values.  
Additional drops: Diamond (1.5%), Totem of Undying (0.8%)

### Very Rare Items
Full diamond gear selection with significant enchants.  
Very Rare Diamond Axe has the highest weight in this tier (4.1%).

### Legendary Items
Fully named, custom enchanted weapons and armor pieces.  
Each item is unique with handcrafted stat combinations.

---

## 6. Unique Bosses

Unique bosses spawn at roll **100** (1% chance per spawn event) or are summoned at specific dungeon locations.

| Boss Name | Loot Table | Notes |
|-----------|-----------|-------|
| Abyss  (dark_gray) | `rpgloot:abyss_watcher_loot` | — |
| The Butcher (dark_red) | `rpgloot:butcher_loot` | — |
| Deathstrider (dark_gray) | `rpgloot:deathstrider_loot` | — |
| Dread Knight (gold) | `rpgloot:dread_knight_loot` | — |
| Holy Mount (gold) | `rpgloot:legendary_loot` | — |
| Farlander (dark_aqua) | `rpgloot:farlander_loot` | — |
| Flare (gold) | `rpgloot:flare_loot` | — |
| Headless Horseman (dark_red) | `rpgloot:headless_loot` | — |
| Hordir  (gold) | `rpgloot:hordir_loot` | — |
| Jailer (dark_red) | `rpgloot:jailer_loot` | — |
| The Killer Rabbit of Caerbannog (dark_red) | `rpgloot:killer_rabbit_loot` | — |
| Mavmus  (dark_red) | `rpgloot:mavmus_loot` | — |
| Sharpshooter (gold) | `rpgloot:sharpshooter_loot` | — |
| Spore Stalker (dark_red) | `rpgloot:spore_loot` | — |
| Plague Swarm (gray) | `rpgloot:swarm_loot` | — |
| Vanta (black) | `rpgloot:vanta_loot` | — |
| Vermivorous  (gold) | `rpgloot:vermivorous_loot` | — |

### Named Boss Raids
Special boss encounters triggered by world events or dungeon entry:
- **Carlos** — Named boss with personal bossbar
- **Wraith** — Named boss with personal bossbar  
- **Vassal** — Named boss with personal bossbar
- **Blunderbore** — Giant boss with stomp attacks + zombie reinforcements
- **Pain Elemental** — Boss that summons Ghastballs

---

## 7. Dungeon Types

The datapack includes custom dungeon structures. Each dungeon spawns themed mobs.

| Dungeon Tag | Mob Theme |
|-------------|-----------|
| `rpgloot.armoryspawn` | Armory — soldier-type mobs |
| `rpgloot.armoryspawn` | Armory — soldier-type mobs |
| `rpgloot.libraryspawn` | Library — caster/scholar mobs |
| `rpgloot.libraryspawn` | Library — caster/scholar mobs |
| `rpgloot.buriedfortressspawn` | Buried Fortress — fortress guards (+ Deathstrider boss) |
| `rpgloot.buriedfortressspawn` | Buried Fortress — fortress guards (+ Deathstrider boss) |
| `rpgloot.buriedfortressspawn` | Buried Fortress — fortress guards (+ Deathstrider boss) |
| `rpgloot.buriedfortressspawn` | Buried Fortress — fortress guards (+ Deathstrider boss) |
| `rpgloot.sunkenruinsspawn` | Sunken Ruins — aquatic/undead mobs |
| `rpgloot.sunkenruinsspawn` | Sunken Ruins — aquatic/undead mobs |
| `rpgloot.brimstonespawn` | Brimstone — fire mobs (+ Flare boss) |
| `rpgloot.brimstonespawn` | Brimstone — fire mobs (+ Flare boss) |
| `rpgloot.brimstonespawn` | Brimstone — fire mobs (+ Flare boss) |
| `rpgloot.brimstonespawn` | Brimstone — fire mobs (+ Flare boss) |
| `rpgloot.cavernsspawn` | Caverns — cave mobs |
| `rpgloot.cavernsspawn` | Caverns — cave mobs |
| `rpgloot.divinesanctumspawn` | Divine Sanctum — holy mobs |
| `rpgloot.divinesanctumspawn` | Divine Sanctum — holy mobs |
| `rpgloot.ashenchambersspawn` | Ashen Chambers — ash/fire mobs |
| `rpgloot.ashenchambersspawn` | Ashen Chambers — ash/fire mobs |
| `rpgloot.magmaspawn` | Magma — magma mobs |
| `rpgloot.magmaspawn` | Magma — magma mobs |
| `rpgloot.catacombsspawn` | Catacombs — undead mobs |
| `rpgloot.catacombsspawn` | Catacombs — undead mobs |
| `rpgloot.alphaspawn` | Alpha — elite natural mobs |
| `rpgloot.alphaspawn` | Alpha — elite natural mobs |
| `rpgloot.surfacespawn` | Surface — overworld mobs |
| `rpgloot.surfacespawn` | Surface — overworld mobs |
| `rpgloot.aridtombspawn` | Arid Tomb — desert mobs |
| `rpgloot.aridtombspawn` | Arid Tomb — desert mobs |

---

## 8. Special Items & Effects

### Weapon Special Effects
- **Lifesteal** (`lifesteal:1b`) — Heals caster when dealing damage (40+ damage triggers instant_health)
- **Ember** (`ember:1`) — Bow that sets arrows on fire
- **Maelstrom** (`maelstrom:1`) — Crossbow that spawns extra arrows
- **Longbow of the Cleric** (`healbow:1`) — Heals allies hit by arrows
- **Lightning Trident** (`lightningTrident:1`) — Summons lightning bolts

### Carlos Helmet Set
Wearing the Carlos helmet (`carloshelm:1`) grants **Absorption I** indefinitely.

### Tome of Chaos
Off-hand item that triggers special effects every 10 seconds.

### Boneblast Arrow
Special arrow type with unique physics and behavior.

---

## 9. Debug / Testing

### 🦇 Easter Egg: Bat = 100% Legendary Drop
Kill any **Bat** to instantly receive a Legendary item.  
This overrides the vanilla bat loot table for easy testing without grinding.

```
/summon bat ~ ~ ~1   # Spawn a bat next to you, then kill it
```

Why bats?
- Extremely low HP (3 hearts), one-hit kill with any weapon
- Spawn naturally in caves at Y < 63
- Easy to summon and kill in creative/survival
- Non-threatening — perfect for quick loot table verification

### Other Debug Commands
```mcfunction
# Check which datapacks are loaded
/datapack list

# Reload all datapacks
/reload

# Get the guide book
/function rpgloot:give_book

# Open options menu
/function rpgloot:options

# Apply default settings
/function rpgloot:options/default

# Force a legendary boss to spawn at your location
/function rpgloot:summon_legendary

# Check current boss count
/scoreboard players get rpgloot bosscount

# Instantly spawn a unique boss
/function rpgloot:summon/unique_vanta
/function rpgloot:summon/unique_deathstrider
```

### Testing Workflow
1. Enter a new world (flat world recommended for speed)
2. `/function rpgloot:options/default` — apply defaults
3. Kill a bat — confirm legendary item drops ✓
4. `/function rpgloot:summon_veteran` — test veteran mob spawns ✓
5. Kill the veteran mob — confirm loot drops ✓
6. `/function rpgloot:summon/unique_vanta` — test unique boss ✓

---

## 10. Commands Reference

| Command | Description |
|---------|-------------|
| `/function rpgloot:options` | Open settings menu |
| `/function rpgloot:options/default` | Reset to default settings |
| `/function rpgloot:options/mobon` | Enable mob spawning |
| `/function rpgloot:options/moboff` | Disable mob spawning |
| `/function rpgloot:options/1` | +1% spawn chance |
| `/function rpgloot:options/-1` | -1% spawn chance |
| `/function rpgloot:options/1limit` | +1 boss limit |
| `/function rpgloot:options/-1limit` | -1 boss limit |
| `/function rpgloot:options/brooton` | Enable Brutal Nights |
| `/function rpgloot:options/eventon` | Enable World Events |
| `/function rpgloot:give_book` | Get guide book |
| `/function rpgloot:summon_veteran` | Spawn veteran mob |
| `/function rpgloot:summon_elite` | Spawn elite mob |
| `/function rpgloot:summon_champion` | Spawn champion mob |
| `/function rpgloot:summon_legendary` | Spawn legendary mob |
| `/function rpgloot:summon_unique` | Spawn random unique boss |
| `/function rpgloot:options/uninstall` | Remove datapack data |

---

*This wiki was auto-generated from the datapack source files.*  
*Report issues at: https://github.com/lindaokeefe472-eng/michael9r9r-rpg-loot*
