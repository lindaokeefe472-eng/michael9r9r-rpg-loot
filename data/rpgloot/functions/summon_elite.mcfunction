# Dispatcher for elite boss spawning

execute if entity @s[type=creeper] at @s run function rpgloot:summon/elite_creeper
execute if entity @s[type=witch] at @s run function rpgloot:summon/elite_witch
execute if entity @s[type=zombie] at @s run function rpgloot:summon/elite_zombie
execute if entity @s[type=husk] at @s run function rpgloot:summon/elite_husk
execute if entity @s[type=drowned] at @s run function rpgloot:summon/elite_zombie
execute if entity @s[type=zombie_villager] at @s run function rpgloot:summon/elite_zombie
execute if entity @s[type=skeleton] at @s run function rpgloot:summon/elite_skeleton
execute if entity @s[type=stray] at @s run function rpgloot:summon/elite_stray
execute if entity @s[type=spider] at @s run function rpgloot:summon/elite_spider
execute if entity @s[type=cave_spider] at @s run function rpgloot:summon/elite_spider
execute if entity @s[type=wither_skeleton] at @s run function rpgloot:summon/elite_wither_skeleton
execute if entity @s[type=enderman] at @s run function rpgloot:summon/elite_enderman
execute if entity @s[type=blaze] at @s run function rpgloot:summon/elite_blaze
execute if entity @s[type=ghast] at @s run function rpgloot:summon/elite_ghast
execute if entity @s[type=phantom] at @s run function rpgloot:summon/elite_zombie
execute if entity @s[type=silverfish] at @s run function rpgloot:summon/elite_spider
execute if entity @s[type=slime] at @s run function rpgloot:summon/elite_zombie
execute unless entity @s[type=creeper] unless entity @s[type=witch] unless entity @s[type=zombie] unless entity @s[type=husk] unless entity @s[type=skeleton] unless entity @s[type=stray] unless entity @s[type=spider] unless entity @s[type=enderman] at @s run function rpgloot:summon/elite_zombie
tp @s ~ -500 ~