function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 30..65 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon spider
execute if score rpgloot rpgloot.rng matches 66..90 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon cave_spider
execute if score rpgloot rpgloot.rng matches 91..95 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_spider
execute if score rpgloot rpgloot.rng matches 96..98 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/elite_spider
execute if score rpgloot rpgloot.rng matches 99 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/champion_spider
execute if score rpgloot rpgloot.rng matches 100 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/legendary_spider
