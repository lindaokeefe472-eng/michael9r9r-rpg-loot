# RPG Rarity Loot Beams & Sound FX
# Executed periodically for dropped item entities

# 1. Legendary / Ancient Excavator Items -> Gold/Flame Beams
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] at @s run particle minecraft:flame ~ ~ ~ 0.1 2 0.1 0.05 8
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] at @s run particle minecraft:end_rod ~ ~ ~ 0.1 2.5 0.1 0.02 5

# 2. Boss Ritual Sacrifice Items -> End Rod Beams & Portal Effects
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_name":'{"text":"Friend Cube"}'}}}] at @s run particle minecraft:happy_villager ~ ~ ~ 0.2 1.5 0.2 0.05 6
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_name":'{"text":"Offering"}'}}}] at @s run particle minecraft:end_rod ~ ~ ~ 0.1 2 0.1 0.05 8
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_name":'{"text":"Infernal Fuel"}'}}}] at @s run particle minecraft:lava ~ ~ ~ 0.2 1.5 0.2 0.05 6
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_name":'{"text":"Unique Sacrifice"}'}}}] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.1 2.5 0.1 0.05 10

# 3. Reforge Rune Item -> Enchantment Particles
execute as @e[type=minecraft:item,nbt={item:{components:{"minecraft:custom_data":{reforge_rune:1b}}}}] at @s run particle minecraft:enchant ~ ~1 ~ 0.3 1 0.3 0.1 10
