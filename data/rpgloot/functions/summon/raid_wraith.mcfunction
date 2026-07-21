tellraw @a {"text":"You hear a distant shrieking draw closer...","color":"dark_red"}
weather thunder
time set midnight

bossbar add wraith {"text":"Wraith, Scourge of the Skies","color":"blue"}
bossbar set wraith color blue
bossbar set wraith max 600

summon phantom ~ ~50 ~ {Size:20,CustomName:"\"§9Wraith, Scourge of the Skies\"",CustomNameVisible:1,DeathLootTable:"rpgloot:wraith_loot",ActiveEffects:[{Id:13,Amplifier:0,Duration:999999},{Id:10,Amplifier:1,Duration:999999},{Id:12,Amplifier:1,Duration:999999},{Id:11,Amplifier:0,Duration:999999},{Id:8,Amplifier:5,Duration:999999}],Attributes:[{id:"minecraft:max_health",base:600.0},{id:"minecraft:movement_speed",base:200.0f},{id:"minecraft:follow_range",base:512.0f},{id:"minecraft:knockback_resistance",base:0.95f},{id:"minecraft:attack_knockback",base:6.0f},{id:"minecraft:attack_damage",base:24.0f}],Silent:0,Glowing:0,Health:600.0f,Tags:["rpgloot.boss","wraith","rpgloot.raidboss"]}