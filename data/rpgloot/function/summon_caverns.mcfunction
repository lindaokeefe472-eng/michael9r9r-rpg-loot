function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 21..30 run summon zombie
execute if score rpgloot rpgloot.rng matches 31..40 run summon skeleton
execute if score rpgloot rpgloot.rng matches 51..60 run summon creeper
execute if score rpgloot rpgloot.rng matches 61..80 run summon spider
execute if score rpgloot rpgloot.rng matches 80..99 run summon cave_spider
execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:summon/unique_swarm
