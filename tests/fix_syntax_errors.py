import os

base_dir = r"D:/game/mc/michael9r9r-s-rpg-loot-v1-15/data/rpgloot"
func_dirs = [os.path.join(base_dir, "functions"), os.path.join(base_dir, "function")]

# 1. Fix flame_set_aura.mcfunction
flame_aura_code = """effect give @s minecraft:strength 2 1 true
particle minecraft:flame ~ ~1 ~ 1 0.5 1 0.05 10
execute as @e[type=!minecraft:player,distance=..8] run data modify entity @s Fire set value 40s
"""

for d in func_dirs:
    with open(os.path.join(d, "flame_set_aura.mcfunction"), "w", encoding="utf-8") as f:
        f.write(flame_aura_code)

# 2. Fix set_bonuses.mcfunction
for d in func_dirs:
    path = os.path.join(d, "set_bonuses.mcfunction")
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    
    # Fix .if entity -> if entity
    content = content.replace("]}].if entity", " ]}] if entity")
    
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

print("Fixed flame_set_aura.mcfunction and set_bonuses.mcfunction!")
