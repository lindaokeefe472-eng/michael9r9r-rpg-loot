# Ensure 100% RPG Mob Spawning is ALWAYS active automatically on any world load
execute unless score mob_setting mobset matches 1.. run scoreboard players set mob_setting mobset 1
execute unless score rpgloot boss_chance matches 1.. run scoreboard players set rpgloot boss_chance 100
execute unless score rpgloot bosslimitset matches 1.. run scoreboard players set rpgloot bosslimitset 30

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


# Always keep trigger clicks enabled for all survival non-OP players



# Always keep trigger clicks enabled for all non-OP survival players
scoreboard players enable @a rpgloot_opt
scoreboard players enable @a rpgloot_dbg

# If a non-OP player types /trigger rpgloot_opt in chat (value 0 or >0), open Options Menu
execute as @a[scores={rpgloot_opt=0..}] run function rpgloot:options
scoreboard players reset @a[scores={rpgloot_opt=0..}] rpgloot_opt

# If a non-OP player types /trigger rpgloot_dbg in chat, open Debug Menu
execute as @a[scores={rpgloot_dbg=0..}] run function rpgloot:debug
scoreboard players reset @a[scores={rpgloot_dbg=0..}] rpgloot_dbg
