# RPG Loot Data Pack - MC 1.21.4 Migration Specification

## 1. Overview
This specification details the technical migration of the **michael9r9r's RPG Loot** Data Pack from Minecraft 1.19.2 (`pack_format: 9`) to Minecraft 1.21.4 (`pack_format: 61`).

The RPG Loot Data Pack introduces dynamic RPG elements to Minecraft, including elite/legendary mob spawns, custom dungeons & structures, unique boss encounters, custom rare items, potion effects, and custom loot table drops.

---

## 2. Target Version & Technical Parameters
- **Original MC Version**: Minecraft 1.19 - 1.19.2 (`pack_format: 9`)
- **Target MC Version**: Minecraft 1.21.4 (`pack_format: 61`)
- **Supported Format Range**: `48` (MC 1.21) to `61` (MC 1.21.4)
- **Repository Branch Structure**:
  - `main`: Production release branch.
  - `research`: Technical audit, specification documents, migration blueprints.
  - `update-1.21`: Feature migration development branch.

---

## 3. Major Breaking Changes & Conversion Protocol

### 3.1 Pack Metadata (`pack.mcmeta`)
- Update `pack_format` from `9` to `61`.
- Add `supported_formats` field specifying `[48, 61]` for backward compatibility across 1.21.x releases.

### 3.2 Tag Directory Structure (MC 1.21 Singular Naming Rule)
In Minecraft 1.21, tag directory paths changed from plural to singular:
- `data/minecraft/tags/functions/` -> `data/minecraft/tags/function/`
- `data/rpgloot/tags/entity_types/` -> `data/rpgloot/tags/entity_type/`

### 3.3 Attribute Identifiers Standard (MC 1.21.2+)
In MC 1.21.2+, attribute identifiers dropped the `generic.` prefix and camelCase property names:
- **Command & JSON Attribute Identifiers**:
  - `generic.attack_damage` / `generic.attackDamage` -> `minecraft:attack_damage` (or `attack_damage`)
  - `generic.max_health` / `generic.maxHealth` -> `minecraft:max_health` (or `max_health`)
  - `generic.movement_speed` / `generic.movementSpeed` -> `minecraft:movement_speed` (or `movement_speed`)
  - `generic.knockback_resistance` / `generic.knockbackResistance` -> `minecraft:knockback_resistance`
  - `generic.armor` / `generic.armorToughness` -> `minecraft:armor` / `minecraft:armor_toughness`
  - `generic.follow_range` / `generic.followRange` -> `minecraft:follow_range`
- **Entity NBT `Attributes` Array Structure**:
  - Old: `Attributes:[{Name:"generic.maxHealth", Base:40.0}]`
  - New: `Attributes:[{id:"minecraft:max_health", base:40.0}]`

### 3.4 Item NBT to Data Components (MC 1.20.5+ / 1.21.4)
In Minecraft 1.20.5+, item `tag` NBT was removed in favor of explicit components syntax:
- **In Commands (`/give`, `/item`, `/summon`)**:
  - `display:{Name:'{"text":"Name"}'}` -> `custom_name='{"text":"Name"}'`
  - `display:{Lore:[...]}` -> `lore=[...]`
  - `CustomModelData: 12` -> `custom_model_data=12`
  - `Unbreakable: 1b` -> `unbreakable={}`
  - `Enchantments:[{id:"sharpness",lvl:5}]` -> `enchantments={levels:{"minecraft:sharpness":5}}`
  - Custom NBT Tags (e.g. `{rpgloot:1b}`, `{rpg_item:1}`): -> `custom_data={rpgloot:1b}`
  - Entity hand/armor items: `HandItems:[{id:"...",tag:{...}}]` -> `HandItems:[{id:"...",components:{"minecraft:custom_data":{...}}}]`

- **Entity Selectors & Predicates**:
  - Old: `@e[type=item,nbt={Item:{tag:{rpgloot:1b}}}]`
  - New: `@e[type=item,nbt={Item:{components:{"minecraft:custom_data":{rpgloot:1b}}}}]`

### 3.5 Loot Tables & JSON Syntaxes
- Replace `minecraft:set_nbt` with `minecraft:set_custom_data` (or component setters `set_components`).
- Fix JSON syntax errors in original files:
  - `data/rpgloot/loot_tables/lost_soul_loot.json` (trailing comma fix)
  - `data/rpgloot/loot_tables/swarm_loot.json` (extra array bracket fix)

---

## 4. Verification & Testing Strategy
1. **JSON Syntax Audit**: Run automated JSON validation across all 122 JSON files.
2. **mcfunction Audit**: Run command syntax parser across all 238 `.mcfunction` files to ensure zero residual legacy attribute or item tag references.
3. **Data Pack Structure Test**: Confirm folder paths comply with MC 1.21 directory specifications.
