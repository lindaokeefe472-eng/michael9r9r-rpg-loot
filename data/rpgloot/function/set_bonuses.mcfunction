# RPG Loot Themed Set Bonuses System
# Executed every second for all players
# NOTE: Detection uses custom_data tags (reliable) instead of custom_name strings
#       (custom_name matching requires exact string including color/italic, which is fragile)

# 1. 🔴 Flame Lord Set (烈焰魔王套)
# Check chest piece equipped -> Fire Resistance & Resistance
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{flameoffirehawk:1}}}]}] at @s run effect give @s minecraft:fire_resistance 2 0 true
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{flameoffirehawk:1}}}]}] at @s run effect give @s minecraft:resistance 2 0 true

# Check 4-piece full set -> Trigger Flame Aura & Strength II
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{flameoffirehawk:1}}}]}] at @s run function rpgloot:flame_set_aura

# 2. 🟣 Hades Necro Set (冥王死灵套)
# Check chest piece -> Wither Immunity & Night Vision
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{ribcageofhades:1}}}]}] at @s run effect clear @s minecraft:wither
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{ribcageofhades:1}}}]}] at @s run effect give @s minecraft:night_vision 12 0 true

# Check 4-piece full set -> Death Wither Aura to mobs
execute as @a[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{ribcageofhades:1}}}]}] at @s run function rpgloot:hades_set_aura

# 3. 🟢 Shadow Assassin Set (影之刺客套)
# Speed II & Jump Boost II
execute as @a[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_data":{slimeboots:1}}}]}] at @s run effect give @s minecraft:speed 2 1 true
execute as @a[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_data":{slimeboots:1}}}]}] at @s run effect give @s minecraft:jump_boost 2 1 true

# 4-piece Sneaking Invisibility
execute as @a[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_data":{slimeboots:1}}}]}] if entity @s[nbt={Pose:"crouching"}] at @s run function rpgloot:shadow_set_stealth

# 4. 🟡 Divine Paladin Set (神圣圣骑士套)
# Regeneration I & Absorption
execute as @a[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_data":{lucidity:1}}}]}] at @s run effect give @s minecraft:regeneration 2 0 true
execute as @a[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_data":{lucidity:1}}}]}] at @s run effect give @s minecraft:absorption 2 0 true
execute as @a[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_data":{lucidity:1}}}]}] at @s run function rpgloot:paladin_set_buff
