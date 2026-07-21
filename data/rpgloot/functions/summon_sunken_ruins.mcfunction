function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 21..40 run summon zombie
execute if score rpgloot rpgloot.rng matches 41..60 run summon skeleton
execute if score rpgloot rpgloot.rng matches 61..70 run summon spider
execute if score rpgloot rpgloot.rng matches 71..99 run summon slime
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/unique_vermivorous
