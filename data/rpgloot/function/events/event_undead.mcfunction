function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 40..60 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon zombie
execute if score rpgloot rpgloot.rng matches 61..80 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon skeleton
execute if score rpgloot rpgloot.rng matches 81..85 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon husk
execute if score rpgloot rpgloot.rng matches 86..94 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon wither_skeleton
execute if score rpgloot rpgloot.rng matches 95..100 as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run summon stray
