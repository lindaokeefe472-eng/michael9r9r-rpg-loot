function rpgloot:rng/1-100

# 10% Chance for each veteran
execute if score rpgloot rpgloot.rng matches 1..10 run function rpgloot:summon/veteran_creeper
execute if score rpgloot rpgloot.rng matches 11..20 run function rpgloot:summon/veteran_zombie
execute if score rpgloot rpgloot.rng matches 21..30 run function rpgloot:summon/veteran_skeleton
execute if score rpgloot rpgloot.rng matches 31..40 run function rpgloot:summon/veteran_spider
execute if score rpgloot rpgloot.rng matches 41..50 run function rpgloot:summon/veteran_enderman

# 5% Chance for each elite
execute if score rpgloot rpgloot.rng matches 51..55 run function rpgloot:summon/elite_creeper
execute if score rpgloot rpgloot.rng matches 56..60 run function rpgloot:summon/elite_zombie
execute if score rpgloot rpgloot.rng matches 61..65 run function rpgloot:summon/elite_skeleton
execute if score rpgloot rpgloot.rng matches 66..70 run function rpgloot:summon/elite_spider
execute if score rpgloot rpgloot.rng matches 71..75 run function rpgloot:summon/elite_enderman

# 3% Chance for each champion
execute if score rpgloot rpgloot.rng matches 76..79 run function rpgloot:summon/champion_creeper
execute if score rpgloot rpgloot.rng matches 80..83 run function rpgloot:summon/champion_zombie
execute if score rpgloot rpgloot.rng matches 84..87 run function rpgloot:summon/champion_skeleton
execute if score rpgloot rpgloot.rng matches 88..91 run function rpgloot:summon/champion_spider
execute if score rpgloot rpgloot.rng matches 92..95 run function rpgloot:summon/champion_enderman

# 1% Chance for each legendary
execute if score rpgloot rpgloot.rng matches 96 run function rpgloot:summon/legendary_creeper
execute if score rpgloot rpgloot.rng matches 97 run function rpgloot:summon/legendary_zombie
execute if score rpgloot rpgloot.rng matches 98 run function rpgloot:summon/legendary_skeleton
execute if score rpgloot rpgloot.rng matches 99 run function rpgloot:summon/legendary_spider
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/legendary_enderman




