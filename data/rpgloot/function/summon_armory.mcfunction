function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 31..60 run summon zombie
execute if score rpgloot rpgloot.rng matches 61..90 run summon skeleton
execute if score rpgloot rpgloot.rng matches 93..96 run function rpgloot:summon/dungeon_decayed_guard
execute if score rpgloot rpgloot.rng matches 97..99 run function rpgloot:summon/dungeon_decayed_archer
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/unique_dread_knight
