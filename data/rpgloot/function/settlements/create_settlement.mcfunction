execute if entity @e[tag=rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.pillagerchieftain] run setblock ~ ~1 ~ minecraft:structure_block[mode=load]{name:"rpgloot:pillagers/outpost",posX:-8,posY:-2,posZ:-8,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if entity @e[tag=rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.pillagerchieftain] run setblock ~ ~2 ~ minecraft:redstone_block

execute if entity @e[tag=rpgloot.pillagerchieftain] run tellraw @a {"text":"You sense that a new pillager settlement has been formed somewhere...","color":"red"}

execute if entity @e[tag=rpgloot.pillagerchieftain] run scoreboard players add pillager_settlements pilset1exists 1
execute if entity @e[tag=rpgloot.pillagerchieftain] run scoreboard players add pillager_settlements pilset1size 1

execute if entity @e[tag=rpgloot.heightdetector,tag=!rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.heightdetector] run function rpgloot:settlements/summon_pillagerchieftain
execute if entity @e[tag=rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.pillagerchieftain] run function rpgloot:settlements/summon_pillagerbodyguard
execute if entity @e[tag=rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.pillagerchieftain] run function rpgloot:settlements/summon_pillagerbodyguard
execute if entity @e[tag=rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.pillagerchieftain] run function rpgloot:settlements/summon_pillagerbodyguard
execute if entity @e[tag=rpgloot.pillagerchieftain] as @s at @e[tag=rpgloot.pillagerchieftain] run function rpgloot:settlements/summon_pillagerknight


execute if entity @e[tag=rpgloot.pillagerchieftain] run kill @e[tag=rpgloot.heightdetector]


execute at @e[tag=rpgloot.pillagerchieftain] run fill ~15 ~5 ~15 ~-15 ~-3 ~-15 grass_block replace structure_block
execute at @e[tag=rpgloot.pillagerchieftain] run fill ~15 ~5 ~15 ~-15 ~-3 ~-15 grass_block replace redstone_block