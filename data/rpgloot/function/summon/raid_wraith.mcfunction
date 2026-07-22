tellraw @a {"text":"You hear a distant shrieking draw closer...","color":"dark_red"}
weather thunder
time set midnight

bossbar add wraith {"text":"Wraith, Scourge of the Skies","color":"blue"}
bossbar set wraith color blue
bossbar set wraith max 600

summon phantom ~ ~50 ~ {Size:20,CustomName:'"§9Wraith, Scourge of the Skies"',CustomNameVisible:1,DeathLootTable:"rpgloot:wraith_loot",ActiveEffects:[{name:"minecraft:water_breathing",amplifier:0,duration:999999},{name:"minecraft:regeneration",amplifier:1,duration:999999},{name:"minecraft:fire_resistance",amplifier:1,duration:999999},{name:"minecraft:resistance",amplifier:0,duration:999999},{name:"minecraft:jump_boost",amplifier:5,duration:999999}],Attributes:[{name:"minecraft:max_health",base:600.0},{name:"minecraft:movement_speed",base:200.0f},{name:"minecraft:follow_range",base:512.0f},{name:"minecraft:knockback_resistance",base:0.95f},{name:"minecraft:attack_knockback",base:6.0f},{name:"minecraft:attack_damage",base:24.0f}],Silent:0,Glowing:0,Health:600.0f,Tags:["rpgloot.boss","wraith","rpgloot.raidboss"]}