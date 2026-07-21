function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 0..50 run execute at @e[tag=painelemental.ghastball] run function rpgloot:summon/raid_lost_soul_ranged
execute if score rpgloot rpgloot.rng matches 51..100 run execute at @e[tag=painelemental.ghastball] run function rpgloot:summon/raid_lost_soul_melee