tellraw @a {"text":"You feel the world tremble beneath you...","color":"dark_red"}

bossbar add carlos {"text":"Carlos, Destroyer of Worlds","color":"green"}
bossbar set carlos color green
bossbar set carlos max 800

summon slime ~ ~100 ~ {Size:12,CustomName:{text:"Carlos",color:"dark_aqua"},CustomNameVisible:1,death_loot_table:"rpgloot:carlos_loot",active_effects:[{id:"minecraft:water_breathing",amplifier:0,duration:999999},{id:"minecraft:regeneration",amplifier:2,duration:999999},{id:"minecraft:slow_falling",amplifier:2,duration:1000},{id:"minecraft:fire_resistance",amplifier:1,duration:999999},{id:"minecraft:resistance",amplifier:0,duration:999999},{id:"minecraft:jump_boost",amplifier:5,duration:999999}],attributes:[{id:"minecraft:max_health",base:800.0},{id:"minecraft:movement_speed",base:0.90},{id:"minecraft:follow_range",base:512.0},{id:"minecraft:knockback_resistance",base:0.95},{id:"minecraft:attack_knockback",base:6.0},{id:"minecraft:attack_damage",base:20.0}],Silent:0,Glowing:0,Health:800.0f,Tags:["rpgloot.boss","carlos","rpgloot.raidboss"]}