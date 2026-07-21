tellraw @a {"text":"You feel the world tremble beneath you...","color":"dark_red"}

bossbar add carlos {"text":"Carlos, Destroyer of Worlds","color":"green"}
bossbar set carlos color green
bossbar set carlos max 800

summon slime ~ ~100 ~ {Size:12,CustomName:"\"§cCarlos, Destroyer of Worlds\"",CustomNameVisible:1,DeathLootTable:"rpgloot:carlos_loot",ActiveEffects:[{Id:13,Amplifier:0,Duration:999999},{Id:10,Amplifier:2,Duration:999999},{Id:28,Amplifier:2,Duration:1000},{Id:12,Amplifier:1,Duration:999999},{Id:11,Amplifier:0,Duration:999999},{Id:8,Amplifier:5,Duration:999999}],Attributes:[{id:"minecraft:max_health",base:800.0},{id:"minecraft:movement_speed",base:0.90f},{id:"minecraft:follow_range",base:512.0f},{id:"minecraft:knockback_resistance",base:0.95f},{id:"minecraft:attack_knockback",base:6.0f},{id:"minecraft:attack_damage",base:20.0f}],Silent:0,Glowing:0,Health:800.0f,Tags:["rpgloot.boss","carlos","rpgloot.raidboss"]}