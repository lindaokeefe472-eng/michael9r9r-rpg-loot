# RPG Loot Themed Set Bonuses System
# Executed every second for all players

# 1. 🔴 Flame Lord Set (烈焰魔王套)
# Check 2+ pieces equipped
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_name":'{"text":"Flame of Firehawk"}'}}]}] at @s run effect give @s minecraft:fire_resistance 2 0 true
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_name":'{"text":"Flame of Firehawk"}'}}]}] at @s run effect give @s minecraft:resistance 2 0 true

# Check 4-piece full set -> Trigger Flame Aura & Strength II
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_name":'{"text":"Flame of Firehawk"}'}}]}] at @s run function rpgloot:flame_set_aura

# 2. 🟣 Hades Necro Set (冥王死灵套)
# Check 2+ pieces -> Wither Immunity & Night Vision
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_name":'{"text":"Ribcage of Hades"}'}}]}] at @s run effect clear @s minecraft:wither
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_name":'{"text":"Ribcage of Hades"}'}}]}] at @s run effect give @s minecraft:night_vision 12 0 true

# Check 4-piece full set -> Death Wither Aura to mobs
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_name":'{"text":"Ribcage of Hades"}'}}]}] at @s run function rpgloot:hades_set_aura

# 3. 🟢 Shadow Assassin Set (影之刺客套)
# Speed II & Jump Boost II
execute as @a[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_name":'{"text":"Slime Boots"}'}}]}] at @s run effect give @s minecraft:speed 2 1 true
execute as @a[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_name":'{"text":"Slime Boots"}'}}]}] at @s run effect give @s minecraft:jump_boost 2 1 true

# 4-piece Sneaking Invisibility
execute as @a[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_name":'{"text":"Slime Boots"}'}} ]}] if entity @s[nbt={Pose:"crouching"}] at @s run function rpgloot:shadow_set_stealth

# 4. 🟡 Divine Paladin Set (神圣圣骑士套)
# Regeneration I & Absorption
execute as @a[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_name":'{"text":"Lucidity"}'}}]}] at @s run effect give @s minecraft:regeneration 2 0 true
execute as @a[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_name":'{"text":"Lucidity"}'}}]}] at @s run effect give @s minecraft:absorption 2 0 true
execute as @a[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_name":'{"text":"Lucidity"}'}}]}] at @s run function rpgloot:paladin_set_buff
