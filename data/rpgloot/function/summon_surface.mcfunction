function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..35 run summon zombie
execute if score rpgloot rpgloot.rng matches 36..70 run summon skeleton
execute if score rpgloot rpgloot.rng matches 71..75 run summon creeper
execute if score rpgloot rpgloot.rng matches 76..80 run summon spider
execute if score rpgloot rpgloot.rng matches 81..92 run summon witch
execute if score rpgloot rpgloot.rng matches 93 run function rpgloot:summon/veteran_skeleton
execute if score rpgloot rpgloot.rng matches 94 run function rpgloot:summon/veteran_zombie
execute if score rpgloot rpgloot.rng matches 95 run function rpgloot:summon/elite_skeleton
execute if score rpgloot rpgloot.rng matches 96 run function rpgloot:summon/elite_zombie
execute if score rpgloot rpgloot.rng matches 97 run function rpgloot:summon/veteran_jockey
execute if score rpgloot rpgloot.rng matches 98 run function rpgloot:summon/champion_skeleton
execute if score rpgloot rpgloot.rng matches 99 run function rpgloot:summon/champion_zombie
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/legendary_zombie