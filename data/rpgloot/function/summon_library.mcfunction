function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 53..72 run summon zombie
execute if score rpgloot rpgloot.rng matches 73..94 run summon skeleton
execute if score rpgloot rpgloot.rng matches 95..96 run summon evoker
execute if score rpgloot rpgloot.rng matches 97..99 run function rpgloot:summon/dungeon_scriber
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/unique_mavmus
