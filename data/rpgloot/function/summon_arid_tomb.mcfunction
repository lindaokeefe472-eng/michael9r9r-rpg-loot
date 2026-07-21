function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..40 run summon husk
execute if score rpgloot rpgloot.rng matches 41..80 run summon skeleton
execute if score rpgloot rpgloot.rng matches 81..91 run summon wither_skeleton
execute if score rpgloot rpgloot.rng matches 92 run function rpgloot:summon/veteran_skeleton
execute if score rpgloot rpgloot.rng matches 93 run function rpgloot:summon/veteran_husk
execute if score rpgloot rpgloot.rng matches 94 run function rpgloot:summon/elite_skeleton
execute if score rpgloot rpgloot.rng matches 95 run function rpgloot:summon/elite_husk
execute if score rpgloot rpgloot.rng matches 96 run function rpgloot:summon/veteran_wither_skeleton
execute if score rpgloot rpgloot.rng matches 97 run function rpgloot:summon/champion_skeleton
execute if score rpgloot rpgloot.rng matches 98 run function rpgloot:summon/champion_husk
execute if score rpgloot rpgloot.rng matches 99 run function rpgloot:summon/legendary_husk
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/unique_vanta