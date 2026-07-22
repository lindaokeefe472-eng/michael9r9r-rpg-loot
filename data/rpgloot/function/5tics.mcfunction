function rpgloot:dungeon_spawns
function rpgloot:enemy_effects

# Immediately transform newly spawned hostile mobs
execute as @e[type=zombie,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=skeleton,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=creeper,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=spider,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=witch,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=husk,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=stray,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=drowned,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=cave_spider,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=zombie_villager,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=wither_skeleton,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=blaze,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=ghast,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=slime,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob
execute as @e[type=phantom,tag=!rpgloot.boss,tag=!rpgloot.valid_mob] at @s run function rpgloot:try_transform_mob

schedule function rpgloot:5tics 5t replace

# Maelstrom
execute as @e[tag=maelstromarrow] run data merge entity @s {life:1200,pickup:0}
execute at @e[tag=maelstromarrow] run summon arrow

# Give data to arrows being dropped
execute as @e[type=#rpgloot:arrows] at @s if entity @e[distance=0..3,tag=maelstromarrow] run data merge entity @s {life:1200,pickup:0}
