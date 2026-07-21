#say veteran

function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..8 at @e[type=creeper,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_creeper
execute if score rpgloot rpgloot.rng matches 9..16 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_witch
execute if score rpgloot rpgloot.rng matches 17..24 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_zombie
execute if score rpgloot rpgloot.rng matches 25..32 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_husk
execute if score rpgloot rpgloot.rng matches 33..40 at @e[type=skeleton,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_skeleton
execute if score rpgloot rpgloot.rng matches 41..48 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_stray
execute if score rpgloot rpgloot.rng matches 49..56 at @e[type=spider,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_spider
execute if score rpgloot rpgloot.rng matches 57..64 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_jockey
execute if score rpgloot rpgloot.rng matches 63..72 at @e[type=#rpgloot:normal_and_nether_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_wither_skeleton
execute if score rpgloot rpgloot.rng matches 73..78 at @e[type=#rpgloot:normal_and_nether_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_wither_archer
execute if score rpgloot rpgloot.rng matches 79..86 at @e[type=#rpgloot:all_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_enderman
execute if score rpgloot rpgloot.rng matches 87..92 at @e[type=blaze,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_blaze
execute if score rpgloot rpgloot.rng matches 93..100 at @e[type=ghast,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_ghast