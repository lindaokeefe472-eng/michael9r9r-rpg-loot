tellraw @a {"text":"You hear a distant shrieking draw closer...","color":"dark_red"}
weather thunder
time set midnight

bossbar add wraith {"text":"Wraith, Scourge of the Skies","color":"blue"}
bossbar set wraith color blue
bossbar set wraith max 600

summon phantom ~ ~50 ~ {Size:20,CustomName:'[{"text": "Wraith", "color": "white"}]',CustomNameVisible:1,death_loot_table:"rpgloot:wraith_loot",active_effects:[{id:"minecraft:water_breathing",amplifier:0,duration:999999},{id:"minecraft:regeneration",amplifier:1,duration:999999},{id:"minecraft:fire_resistance",amplifier:1,duration:999999},{id:"minecraft:resistance",amplifier:0,duration:999999},{id:"minecraft:jump_boost",amplifier:5,duration:999999}],attributes:[{id:"minecraft:max_health",base:600.0},{id:"minecraft:movement_speed",base:200.0},{id:"minecraft:follow_range",base:512.0},{id:"minecraft:knockback_resistance",base:0.95},{id:"minecraft:attack_knockback",base:6.0},{id:"minecraft:attack_damage",base:24.0}],Silent:0,Glowing:0,Health:600.0f,Tags:["rpgloot.boss","wraith","rpgloot.raidboss"]}