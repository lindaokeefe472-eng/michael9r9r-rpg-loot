##Called from 1second
#run every second

execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{flameoffirehawk:1}}}]}] as @e[distance=..5,type=#rpgloot:normal_hostile_mobs] run data merge entity @s {Fire:50}
execute if entity @s[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_data":{lucidity:1}}}]}] run effect clear @s minecraft:wither

execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{regenerationaura:1}}}]}] run effect give @a[distance=..8] regeneration 3 0 true
execute if entity @s[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{regenerationaura:1}}}]}] run effect give @a[distance=..8] regeneration 3 0 true
execute if entity @s[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_data":{waterbreathing:1}}}]}] run effect give @s water_breathing 12 0 true

execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{devourer:1}}}]}] run effect give @s hunger 3 0 true
execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{devourer:1}}}]}] run effect give @s regeneration 3 1 true

execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{aspectofterror:1}}}]}] run effect give @s speed 3 0 true
execute if entity @s[nbt={Inventory:[{Slot:103b,components:{"minecraft:custom_data":{nightmare:1}}}]}] run effect give @s night_vision 12 0 true

execute if entity @s[nbt={Selecteditem:{components:{"minecraft:custom_data":{shadowsabre:1}}}}] run effect give @s invisibility 3 0 true
execute if entity @s[nbt={Selecteditem:{components:{"minecraft:custom_data":{odyssey:1}}}}] run effect give @a[distance=..12] strength 3 0 true


execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{flameoffirehawk:1}}}]}] run effect give @s fire_resistance 3 0 true
execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{beowulf:1}}}]}] run effect give @s dolphins_grace 3 0 true
execute if entity @s[nbt={Inventory:[{Slot:100b,components:{"minecraft:custom_data":{slimeboots:1}}}]}] run effect give @s jump_boost 3 1 true
execute if entity @s[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{killerrabbitfoot:1}}}]}] run effect give @s jump_boost 3 1 true

execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{finalflight:1}}}]}] run effect give @s strength 3 1 true
execute if entity @s[nbt={Inventory:[{Slot:102b,components:{"minecraft:custom_data":{ribcageofhades:1}}}]}] run effect give @e[distance=..8,type=#rpgloot:normal_and_nether_mobs] wither 12 0 true 
