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



execute unless entity @e[tag=carlos] run bossbar set carlos players

execute unless entity @e[tag=wraith] run bossbar set wraith players

execute unless entity @e[tag=vassal] run bossbar set vassal players

execute unless entity @e[tag=blunderbore] run bossbar set blunderbore players

execute unless entity @e[tag=rpgloot.painelemental] run bossbar set rpgloot.painelemental players



#Life Steal (Credit to MC_Ninja38 for this method)

execute as @a[nbt={SelectedItem:{tag:{lifesteal:1b}}}, scores={dealt=40..}] run effect give @s instant_health 1 0

scoreboard players reset @a dealt



tag @e[type=trident,tag=!lightningTrident,tag=!normalTrident,nbt={Trident:{tag:{lightningTrident:1b}}}] add lightningTrident

tag @e[type=trident,tag=!lightningTrident,tag=!normalTrident] add normalTrident



# Blunderbore attacks (Realworldjedi)

# Run Attack

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=0}] at @s if entity @a[distance=0..25] run function rpgloot:attack

scoreboard players remove @e[tag=blunderbore,type=giant,scores={atk_cool=1..}] atk_cool 1



# Stomp 

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=590}] at @s if entity @a[distance=0..12] run tp @s ^ ^5 ^

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=580}] at @s if entity @a[distance=0..12] run tp @a[distance=0..12] ^ ^15 ^



# Summon reinforcements (Zombie)

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=350}] at @s if entity @a[distance=0..20] run function rpgloot:summon/raid_blunderbore_reinforcement



# Give Effects (instant damage)

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=50}] at @s if entity @a[distance=0..16] run effect give @a[distance=0..8] minecraft:instant_damage 1 1 

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=200}] at @s if entity @a[distance=0..16] run effect give @a[distance=0..12] minecraft:instant_damage 1 1

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=200}] at @s if entity @a[distance=0..16] run effect give @a[distance=0..12] minecraft:instant_damage 1 1 

execute as @e[tag=blunderbore,type=giant,scores={atk_cool=450}] at @s if entity @a[distance=0..16] run effect give @a[distance=0..8] minecraft:instant_damage 2 1 

# End of blunderbore attacks



execute unless score mob_setting mobset matches 0..1 as @s run scoreboard players set mob_setting mobset 1



#only make these checks per tick if the pillager settlements option is enabled.

execute if score pillager_settlements pilset matches 1.. run function rpgloot:settlements/settlements_timer

#Ember
execute as @e[type=#rpgloot:arrows] at @s if entity @p[distance=0..3,nbt={SelectedItem:{id:"minecraft:bow",tag:{ember:1}}}] run tag @s add emberarrow
execute as @e[tag=emberarrow] run function rpgloot:items/ember_arrow

#Maelstrom
execute as @e[type=#rpgloot:arrows] at @s if entity @p[distance=0..2,nbt={SelectedItem:{id:"minecraft:crossbow",tag:{maelstrom:1}}}] run tag @s add maelstromarrow
execute as @e[tag=maelstromarrow] run function rpgloot:items/maelstrom_arrow

#Longbow of the Cleric
execute as @e[type=minecraft:arrow] at @s if entity @p[distance=0..3,nbt={SelectedItem:{id:"minecraft:bow",tag:{healbow:1}}}] run tag @s add healarrow
execute as @e[tag=healarrow] run data merge entity @s {life:1200,pickup:0}
execute at @e[tag=healarrow] run summon area_effect_cloud ~ ~ ~ {Particle:spell,ReapplicationDelay:20,Radius:1f,Duration:20,Potion:"minecraft:regeneration"}
execute as @e[tag=healarrow] run function rpgloot:items/heal_arrow

#Veteran Ghast
execute as @e[type=minecraft:fireball] at @s if entity @e[distance=0..5,tag=rpgloot.veteran.ghast] run tag @s add veteran.ghastball
execute at @e[tag=veteran.ghastball] run summon area_effect_cloud ~ ~ ~ {Particle:composter,ReapplicationDelay:20,Radius:1f,Duration:4}
execute as @e[tag=veteran.ghastball] run function rpgloot:enemies/veteran_ghastball

#Elite Ghast
execute as @e[type=minecraft:fireball] at @s if entity @e[distance=0..5,tag=rpgloot.elite.ghast] run tag @s add elite.ghastball
execute at @e[tag=elite.ghastball] run summon area_effect_cloud ~ ~ ~ {Particle:sculk_soul,ReapplicationDelay:20,Radius:1f,Duration:4}
execute as @e[tag=elite.ghastball] run function rpgloot:enemies/elite_ghastball

#Champion Ghast
execute as @e[type=minecraft:fireball] at @s if entity @e[distance=0..5,tag=rpgloot.champion.ghast] run tag @s add champion.ghastball
execute at @e[tag=champion.ghastball] run summon area_effect_cloud ~ ~ ~ {Particle:dragon_breath,ReapplicationDelay:20,Radius:1f,Duration:4}
execute as @e[tag=champion.ghastball] run function rpgloot:enemies/champion_ghastball

#Legendary Ghast
execute as @e[type=minecraft:fireball] at @s if entity @e[distance=0..5,tag=rpgloot.legendary.ghast] run tag @s add legendary.ghastball
execute at @e[tag=legendary.ghastball] run summon area_effect_cloud ~ ~ ~ {Particle:lava,ReapplicationDelay:20,Radius:1f,Duration:4}
execute as @e[tag=legendary.ghastball] run function rpgloot:enemies/legendary_ghastball

#Pain Elemental
execute as @e[type=minecraft:fireball] at @s if entity @e[distance=0..5,tag=rpgloot.painelemental] run tag @s add painelemental.ghastball
execute at @e[tag=painelemental.ghastball] run summon area_effect_cloud ~ ~ ~ {Particle:crimson_spore,ReapplicationDelay:20,Radius:1f,Duration:4}
execute as @e[tag=painelemental.ghastball] run function rpgloot:bosses/pain_elemental 
#fireball logic




#Bone Blast

execute as @e[type=minecraft:arrow] at @s if entity @p[distance=0..3,nbt={SelectedItem:{id:"minecraft:bow",tag:{boneblast:1}}}] run tag @s add boneblast

execute as @e[type=minecraft:arrow,tag=boneblast] as @p at @s anchored eyes run function rpgloot:boneblastarrow

execute as @e[type=wither_skull,tag=player,tag=!motion] at @p rotated as @s run function rpgloot:motion



#Stats trigger

scoreboard players enable @a stats

execute at @a[scores={stats=1..}] run function rpgloot:stats

scoreboard players reset @a[scores={stats=1..}] stats



#Guide Book trigger

scoreboard players enable @a guide

execute at @a[scores={guide=1..}] run function rpgloot:give_book

scoreboard players reset @a[scores={guide=1..}] guide



# Gets the time of day and stores the value.

execute store result score rpgloot timeofday run time query daytime



# When time reaches 13000 and world events are enabled, then make a check to see if an event occurs.

# The reason we don't handle that in the tick function is because the rng function can be very taxing on the system. Doing that once per day cycle is much better than 35 times per second.

execute if score rpgloot timeofday matches 13000 run function rpgloot:events/determine_event



# And stop the event when it turns day

execute if score rpgloot timeofday matches 0 run scoreboard players set currenteventp currentevent 0





# Variable storing

scoreboard players set counter count 0



tag @a[tag=!float_bow,nbt={SelectedItem:{tag:{Bill:3b}}}] add float_bow



scoreboard players reset @a[tag=!float_bow,scores={lyupic=1..}] lyupic

scoreboard players reset @a[tag=!float_bow,scores={assassinpic=1..}] assassinpic



execute as @a[tag=float_bow,scores={lyupic=1..}] at @s run data merge entity @e[limit=1,sort=nearest,type=arrow] {NoGravity:1b,Fire:999}

execute as @a[tag=float_bow,scores={assassinpic=1..}] at @s run data merge entity @e[limit=1,sort=nearest,type=arrow] {NoGravity:1b}



scoreboard players reset @a[tag=float_bow,scores={lyupic=1..}] lyupic

scoreboard players reset @a[tag=float_bow,scores={assassinpic=1..}] assassinpic





#enchanted_chicken

execute as @e[type=chicken,nbt={EggLayTime:1},tag=enchanted_chicken] run tag @s add layedegg

execute as @e[tag=layedegg] run scoreboard players add @s timer 1



execute as @e[type=chicken,scores={timer=1..},tag=layedegg] at @s run kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:egg"}}, sort=nearest, limit=1, distance=..0.25] 

execute as @e[type=chicken,scores={timer=1..},tag=layedegg] at @s run loot spawn ~ ~ ~ loot rpgloot:enchanted_chicken_loot



execute as @e[type=chicken,scores={timer=1..}] run tag @s remove layedegg

execute as @e[type=chicken,scores={timer=1..}] run scoreboard players set @s timer 0



tag @a[tag=float_bow] remove float_bow



#Constants

scoreboard players set rpgloot0 constants 0

scoreboard players set rpgloot5 constants 5

scoreboard players set rpgloot10 constants 10

scoreboard players set rpgloot20 constants 20

scoreboard players set rpgloot25 constants 25

scoreboard players set rpgloot50 constants 50

scoreboard players set rpgloot100 constants 100

scoreboard players set rpgloot14000 constants 14000

scoreboard players set rpgloot23000 constants 23000



