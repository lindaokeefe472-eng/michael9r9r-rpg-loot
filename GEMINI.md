# 🛡️ Universal Agent & RPG Loot Quality Standards (GEMINI.md)

### 1. 📁 Path & Scope Standard
- All file creation, editing, and output MUST target paths relative to the current workspace root (e.g. `./build/` or project subdirectories).
- Strictly isolate all build artifacts, temporary zips, and logs within the current working directory (`./build/`).
- Maintain 100% path parity for Minecraft 26.2 (1.21.4+ / `pack_format: 61`) between singular and plural forms (e.g. `data/rpgloot/function/` & `functions/`, `data/minecraft/loot_table/` & `loot_tables/`).

### 2. 🎮 In-Game Debugging & QA Standard
- Data pack MUST maintain a master debug portal `/function rpgloot:debug`.
- Master debug portal MUST include 4 sub-modules:
  1. Options & Attribute Panel (`/function rpgloot:options`);
  2. Structure Locate & Spawn Menu (`/function rpgloot:locate/menu`), where locate commands MUST use `execute at @s` for direct clickable chat output;
  3. World Random Events Trigger (`/function rpgloot:events/determine_event`);
  4. Instant Mob Summoning for all 5 tiers (`veteran`, `elite`, `champion`, `legendary`, `unique`).
- Major releases MUST undergo manual in-game UX verification (clicking UI buttons, killing Bosses for drop particles, opening structure chests for Lore rendering).

### 3. 🌐 i18n & Resource Pack Standard
- NO HARDCODING: Text outputs (tellraw broadcasts, menu components, CustomName, Lore descriptions) MUST NEVER use hardcoded text strings.
- Mandatory Standard Component: MUST use standard `"translate": "rpgloot.xxx"` + `"fallback": "..."` JSON component structure.
- Same-Commit Synchronization: Any text modification or addition MUST be synchronized in the same commit with `resourcepack/assets/rpgloot/lang/zh_cn.json` and `en_us.json`.

### 4. 🧪 Empirical Verification & Dynamic Coverage Standard
- Empirical Runtime Verification Required: NEVER declare completion without actual test execution with clean log output.
- Dynamic Discovery Framework: Tests MUST dynamically discover all 99+ summon functions, 15+ locate functions, 6+ event functions, and 31+ chest loot tables instead of hardcoding target names.
- Zero-Error Quality Bar: E2E tests MUST pass with 0 JSON parse errors, 0 function load errors, and 0 missing NBT errors in server logs.

### 5. 🌿 Git Hygiene & Branch Standard
- All code changes MUST be developed on dedicated `feature/*` or `fix/*` branches.
- Commit messages MUST be clear and descriptive.
- Never push binary archives, zip files, or build artifacts into git history.
- Verification on headless test server is required before merging to `main`.

### 6. 📝 Documentation Sync Standard
- Any player-facing changes, loot rate adjustments, new commands, or architecture overhauls MUST immediately update `README.md` and `DEVELOPER_GUIDE.md`.
