
scoreboard players add pillager_settlements pilset1size 1
execute unless entity @e[tag=rpgloot.pillagerarchitect] at @e[tag=rpgloot.pillagerchieftain] run function rpgloot:settlements/summon_pillagerarchitect

execute if score pillager_settlements pilset1exists matches 0 as @s run function rpgloot:settlements/create_settlement

execute unless score pillager_settlements pilset1exists matches 0..1 as @s run tellraw @a {"text":"debug: created settlement value","color":"blue"}
execute unless score pillager_settlements pilset1exists matches 0..1 as @s run scoreboard players set pillager_settlements pilset1exists 0


execute if score pillager_settlements pilset1exists matches 1 as @s if score pillager_settlements pilset1built <= pillager_settlements pilset1size as @s at @e[tag=rpgloot.pillagerchieftain] as @e[distance=..15,tag=rpgloot.pillagerarchitect] as @e[tag=rpgloot.pillagerarchitect] run tp @e[tag=rpgloot.pillagerarchitect] ~-8 ~1 ~16

