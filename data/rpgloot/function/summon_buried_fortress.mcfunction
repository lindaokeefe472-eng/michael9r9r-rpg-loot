function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 56..75 run summon zombie
execute if score rpgloot rpgloot.rng matches 76..95 run summon skeleton
execute if score rpgloot rpgloot.rng matches 95..97 run function rpgloot:summon/dungeon_scorched_conscript
execute if score rpgloot rpgloot.rng matches 98..99 run function rpgloot:summon/dungeon_fallen_one
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/dungeon_plagued_defender