#say unique

function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..11 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_hordir
execute if score rpgloot rpgloot.rng matches 12..21 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_vermivorous
execute if score rpgloot rpgloot.rng matches 22..31 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_abyss_watcher
execute if score rpgloot rpgloot.rng matches 32..41 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_vanta
execute if score rpgloot rpgloot.rng matches 42..51 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_dread_knight
execute if score rpgloot rpgloot.rng matches 52..61 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_butcher
execute if score rpgloot rpgloot.rng matches 62..67 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_killer_rabbit
execute if score rpgloot rpgloot.rng matches 68..79 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_mavmus
execute if score rpgloot rpgloot.rng matches 80..89 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_headless_horseman
execute if score rpgloot rpgloot.rng matches 90..100 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/unique_sharpshooter