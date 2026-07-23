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
scoreboard players enable @a rpgloot_opt
scoreboard players enable @a rpgloot_dbg

# Process options menu trigger clicks (rpgloot_opt)
execute as @a[scores={rpgloot_opt=1}] run function rpgloot:options/moboff
execute as @a[scores={rpgloot_opt=2}] run function rpgloot:options/mobon
execute as @a[scores={rpgloot_opt=3}] run function rpgloot:options/-1
execute as @a[scores={rpgloot_opt=4}] run function rpgloot:options/1
execute as @a[scores={rpgloot_opt=5}] run function rpgloot:options/-1limit
execute as @a[scores={rpgloot_opt=6}] run function rpgloot:options/1limit
execute as @a[scores={rpgloot_opt=7}] run function rpgloot:options/eventoff
execute as @a[scores={rpgloot_opt=8}] run function rpgloot:options/eventon
execute as @a[scores={rpgloot_opt=9}] run function rpgloot:options/glowoff
execute as @a[scores={rpgloot_opt=10}] run function rpgloot:options/glowon
execute as @a[scores={rpgloot_opt=11}] run function rpgloot:give_book
execute as @a[scores={rpgloot_opt=12}] run function rpgloot:stats
execute as @a[scores={rpgloot_opt=13}] run function rpgloot:generate_structure
execute as @a[scores={rpgloot_opt=14}] run function rpgloot:debug
scoreboard players reset @a[scores={rpgloot_opt=1..}] rpgloot_opt

# Process debug menu trigger clicks (rpgloot_dbg)
execute as @a[scores={rpgloot_dbg=1}] run function rpgloot:options/100spawn
execute as @a[scores={rpgloot_dbg=2}] run function rpgloot:options/default
execute as @a[scores={rpgloot_dbg=3}] run function rpgloot:summon/veteran_zombie
execute as @a[scores={rpgloot_dbg=4}] run function rpgloot:summon/elite_zombie
execute as @a[scores={rpgloot_dbg=5}] run function rpgloot:summon/champion_zombie
execute as @a[scores={rpgloot_dbg=6}] run function rpgloot:summon/legendary_zombie
execute as @a[scores={rpgloot_dbg=7}] run function rpgloot:summon/unique_zombie
execute as @a[scores={rpgloot_dbg=8}] run loot give @s loot rpgloot:uncommon_items
execute as @a[scores={rpgloot_dbg=9}] run loot give @s loot rpgloot:rare_items
execute as @a[scores={rpgloot_dbg=10}] run loot give @s loot rpgloot:veryrare_items
execute as @a[scores={rpgloot_dbg=11}] run loot give @s loot rpgloot:legendary_items
execute as @a[scores={rpgloot_dbg=12}] run kill @e[type=!player,distance=..50]
execute as @a[scores={rpgloot_dbg=13}] run kill @e[type=item,distance=..50]
scoreboard players reset @a[scores={rpgloot_dbg=1..}] rpgloot_dbg
