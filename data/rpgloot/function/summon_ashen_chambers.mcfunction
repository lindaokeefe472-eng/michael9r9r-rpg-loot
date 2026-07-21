function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..20 run summon zombie
execute if score rpgloot rpgloot.rng matches 21..40 run summon skeleton
execute if score rpgloot rpgloot.rng matches 41..60 run summon spider
execute if score rpgloot rpgloot.rng matches 61..80 run function rpgloot:summon/dungeon_ashen_one
execute if score rpgloot rpgloot.rng matches 81..100 run function rpgloot:summon/dungeon_seraph
