function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..75 run function rpgloot:summon/dungeon_vanguard
execute if score rpgloot rpgloot.rng matches 76..100 run function rpgloot:summon/dungeon_seraph
