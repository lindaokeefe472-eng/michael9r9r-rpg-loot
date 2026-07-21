##Called from boss_count_check
#run every 5 seconds if boss mob count not too high

#say make_boss

function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..55 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon_veteran
execute if score rpgloot rpgloot.rng matches 56..86 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon_elite
execute if score rpgloot rpgloot.rng matches 87..97 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon_champion
execute if score rpgloot rpgloot.rng matches 98..99 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon_legendary
execute if score rpgloot rpgloot.rng matches 100 at @e[type=#rpgloot:normal_hostile_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon_unique


