import os, shutil

base_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot"
func_dir = os.path.join(base_dir, "functions")
func_singular_dir = os.path.join(base_dir, "function")

# 1. Update tick.mcfunction with self-healing objective initialization
self_healing_header = """# Self-healing trigger objective initialization (Guarantees zero 'Unknown objective' errors)
scoreboard objectives add rpg_help trigger
scoreboard objectives add rpg_recipes trigger
scoreboard objectives add guide trigger
scoreboard objectives add stats trigger
scoreboard objectives add rpgloot_opt trigger
scoreboard objectives add rpgloot_dbg trigger

scoreboard players enable @a rpg_help
scoreboard players enable @a rpg_recipes
scoreboard players enable @a guide
scoreboard players enable @a stats
scoreboard players enable @a rpgloot_opt
scoreboard players enable @a rpgloot_dbg

# Dispatch triggers
execute as @a[scores={rpg_help=1..}] run function rpgloot:guide
execute as @a[scores={guide=1..}] run function rpgloot:guide
execute as @a[scores={rpg_recipes=1..}] run function rpgloot:show_recipes

scoreboard players set @a[scores={rpg_help=1..}] rpg_help 0
scoreboard players set @a[scores={guide=1..}] guide 0
scoreboard players set @a[scores={rpg_recipes=1..}] rpg_recipes 0
"""

for d in [func_dir, func_singular_dir]:
    if os.path.exists(d):
        tick_path = os.path.join(d, "tick.mcfunction")
        if os.path.exists(tick_path):
            with open(tick_path, "r", encoding="utf-8") as f:
                content = f.read()
            
            if "scoreboard objectives add rpg_help trigger" not in content:
                content = self_healing_header + "\n" + content
                with open(tick_path, "w", encoding="utf-8") as f:
                    f.write(content)

# 2. Sync all files from functions to function (and vice versa) to ensure 100% consistency
for root, dirs, files in os.walk(func_dir):
    for f in files:
        rel = os.path.relpath(os.path.join(root, f), func_dir)
        target = os.path.join(func_singular_dir, rel)
        os.makedirs(os.path.dirname(target), exist_ok=True)
        shutil.copy2(os.path.join(root, f), target)

print("Synchronized function/ and functions/ directories with self-healing objectives!")
