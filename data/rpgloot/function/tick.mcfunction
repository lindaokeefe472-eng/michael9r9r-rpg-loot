# Self-healing trigger objective initialization (Guarantees zero 'Unknown objective' errors)
scoreboard objectives add rpg_help trigger
scoreboard objectives add rpg_recipes trigger
scoreboard objectives add guide trigger
scoreboard objectives add stats trigger
scoreboard objectives add rpgloot_opt trigger
scoreboard objectives add rpgloot_dbg trigger

scoreboard players enable @a rpg_help
scoreboard players enable @a rpg_recipes
scoreboard players enable @a guide
scoreboard players enable @a stats
scoreboard players enable @a rpgloot_opt
scoreboard players enable @a rpgloot_dbg

# Dispatch triggers
execute as @a[scores={rpg_help=1..}] run function rpgloot:guide
execute as @a[scores={guide=1..}] run function rpgloot:guide
execute as @a[scores={rpg_recipes=1..}] run function rpgloot:show_recipes
execute as @a[scores={rpgloot_opt=12}] at @s run function rpgloot:stats
execute as @a[scores={rpgloot_opt=13}] at @s run function rpgloot:random_structure
execute as @a[scores={rpgloot_opt=1..11}] run function rpgloot:options
execute as @a[scores={rpgloot_opt=14..}] run function rpgloot:options
execute as @a[scores={rpgloot_dbg=1..}] run function rpgloot:debug
execute as @a[scores={stats=1..}] at @s run function rpgloot:stats

scoreboard players set @a[scores={rpg_help=1..}] rpg_help 0
scoreboard players set @a[scores={guide=1..}] guide 0
scoreboard players set @a[scores={rpg_recipes=1..}] rpg_recipes 0
scoreboard players set @a[scores={rpgloot_opt=1..}] rpgloot_opt 0
scoreboard players set @a[scores={rpgloot_dbg=1..}] rpgloot_dbg 0
scoreboard players set @a[scores={stats=1..}] stats 0

# Lazy defaults: only initialize when the score has never been set.
# "matches 0.." keeps player-chosen 0 (= feature off) intact instead of force-resetting it.
execute unless score mob_setting mobset matches 0.. run scoreboard players set mob_setting mobset 1
execute unless score rpgloot boss_chance matches 0.. run scoreboard players set rpgloot boss_chance 100
execute unless score rpgloot bosslimitset matches 0.. run scoreboard players set rpgloot bosslimitset 30

execute as @a[tag=!rpgloot_welcomed] run function rpgloot:welcome_player
scoreboard players add rpgloot timer 1

execute if score rpgloot timer matches 101.. run scoreboard players set rpgloot timer 0

execute if score rpgloot timer matches 100 run scoreboard players add rpgloot timer10s 1

execute if entity @e[tag=carlos] store result bossbar carlos value run data get entity @e[tag=carlos,limit=1] Health
execute if entity @e[tag=wraith] store result bossbar wraith value run data get entity @e[tag=wraith,limit=1] Health
execute if entity @e[tag=vassal] store result bossbar vassal value run data get entity @e[tag=vassal,limit=1] Health
execute if entity @e[tag=blunderbore] store result bossbar blunderbore value run data get entity @e[tag=blunderbore,limit=1] Health
execute if entity @e[tag=rpgloot.painelemental] store result bossbar rpgloot.painelemental value run data get entity @e[tag=rpgloot.painelemental,limit=1] Health

execute as @e[tag=carlos] at @s run bossbar set carlos players @a[distance=..96]
execute as @e[tag=wraith] at @s run bossbar set wraith players @a[distance=..96]
execute as @e[tag=vassal] at @s run bossbar set vassal players @a[distance=..64]
execute as @e[tag=blunderbore] at @s run bossbar set blunderbore players @a[distance=..64]
execute as @e[tag=rpgloot.painelemental] at @s run bossbar set rpgloot.painelemental players @a[distance=..96]
