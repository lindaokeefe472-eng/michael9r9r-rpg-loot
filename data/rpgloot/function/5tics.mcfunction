function rpgloot:dungeon_spawns
function rpgloot:enemy_effects

# Auto-tag valid hostile mobs for 100% failsafe selection in 1.21+
tag @e[type=zombie,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=skeleton,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=creeper,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=spider,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=witch,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=husk,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=stray,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=drowned,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=cave_spider,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=zombie_villager,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=wither_skeleton,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=blaze,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=ghast,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=slime,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob
tag @e[type=phantom,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] add rpgloot.valid_mob

schedule function rpgloot:5tics 5t replace

#Maelstrom
execute as @e[tag=maelstromarrow] run data merge entity @s {life:1200,pickup:0}
execute at @e[tag=maelstromarrow] run summon arrow

#Give data to arrows being dropped
execute as @e[type=#rpgloot:arrows] at @s if entity @e[distance=0..3,tag=maelstromarrow] run data merge entity @s {life:1200,pickup:0}
