function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 21..54 run summon zombie
execute if score rpgloot rpgloot.rng matches 55..74 run summon skeleton
execute if score rpgloot rpgloot.rng matches 75..89 run summon blaze
execute if score rpgloot rpgloot.rng matches 90..99 run summon wither_skeleton
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/unique_flare