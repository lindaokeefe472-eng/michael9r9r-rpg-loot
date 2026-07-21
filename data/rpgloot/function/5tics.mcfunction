function rpgloot:dungeon_spawns
function rpgloot:enemy_effects

schedule function rpgloot:5tics 5t replace

#Maelstrom
execute as @e[tag=maelstromarrow] run data merge entity @s {life:1200,pickup:0}
execute at @e[tag=maelstromarrow] run summon arrow

#Give data to arrows being dropped
execute as @e[type=#rpgloot:arrows] at @s if entity @e[distance=0..3,tag=maelstromarrow] run data merge entity @s {life:1200,pickup:0}