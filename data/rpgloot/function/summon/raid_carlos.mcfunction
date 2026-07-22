tellraw @a {"text":"You feel the world tremble beneath you...","color":"dark_red"}

bossbar add carlos {"text":"Carlos, Destroyer of Worlds","color":"green"}
bossbar set carlos color green
bossbar set carlos max 800

summon slime ~ ~100 ~ {Size:12,CustomName:'"§cCarlos, Destroyer of Worlds"',CustomNameVisible:1,DeathLootTable:"rpgloot:carlos_loot",ActiveEffects:[{name:"minecraft:water_breathing",amplifier:0,duration:999999},{name:"minecraft:regeneration",amplifier:2,duration:999999},{name:"minecraft:slow_falling",amplifier:2,duration:1000},{name:"minecraft:fire_resistance",amplifier:1,duration:999999},{name:"minecraft:resistance",amplifier:0,duration:999999},{name:"minecraft:jump_boost",amplifier:5,duration:999999}],Attributes:[{name:"minecraft:max_health",base:800.0},{name:"minecraft:movement_speed",base:0.90f},{name:"minecraft:follow_range",base:512.0f},{name:"minecraft:knockback_resistance",base:0.95f},{name:"minecraft:attack_knockback",base:6.0f},{name:"minecraft:attack_damage",base:20.0f}],Silent:0,Glowing:0,Health:800.0f,Tags:["rpgloot.boss","carlos","rpgloot.raidboss"]}