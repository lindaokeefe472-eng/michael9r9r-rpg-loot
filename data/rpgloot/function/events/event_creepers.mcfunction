function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 50..90 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon creeper
execute if score rpgloot rpgloot.rng matches 91..95 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_creeper
execute if score rpgloot rpgloot.rng matches 96..98 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/elite_creeper
execute if score rpgloot rpgloot.rng matches 99 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/champion_creeper
execute if score rpgloot rpgloot.rng matches 100 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/legendary_creeper
