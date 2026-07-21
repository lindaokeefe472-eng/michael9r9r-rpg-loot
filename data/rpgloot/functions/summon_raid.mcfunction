function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..10 as @s as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/raid_carlos
execute if score rpgloot rpgloot.rng matches 11..55 as @s as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/raid_wraith
execute if score rpgloot rpgloot.rng matches 56..100 as @s as @s at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/raid_poseidon_army
