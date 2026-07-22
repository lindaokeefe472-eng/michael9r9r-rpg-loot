# Dispatcher for veteran boss spawning

execute if entity @s[type=creeper] at @s run function rpgloot:summon/veteran_creeper
execute if entity @s[type=witch] at @s run function rpgloot:summon/veteran_witch
execute if entity @s[type=zombie] at @s run function rpgloot:summon/veteran_zombie
execute if entity @s[type=husk] at @s run function rpgloot:summon/veteran_husk
execute if entity @s[type=drowned] at @s run function rpgloot:summon/veteran_zombie
execute if entity @s[type=zombie_villager] at @s run function rpgloot:summon/veteran_zombie
execute if entity @s[type=skeleton] at @s run function rpgloot:summon/veteran_skeleton
execute if entity @s[type=stray] at @s run function rpgloot:summon/veteran_stray
execute if entity @s[type=spider] at @s run function rpgloot:summon/veteran_spider
execute if entity @s[type=cave_spider] at @s run function rpgloot:summon/veteran_spider
execute if entity @s[type=wither_skeleton] at @s run function rpgloot:summon/veteran_wither_skeleton
execute if entity @s[type=enderman] at @s run function rpgloot:summon/veteran_enderman
execute if entity @s[type=blaze] at @s run function rpgloot:summon/veteran_blaze
execute if entity @s[type=ghast] at @s run function rpgloot:summon/veteran_ghast
execute if entity @s[type=phantom] at @s run function rpgloot:summon/veteran_zombie
execute if entity @s[type=silverfish] at @s run function rpgloot:summon/veteran_spider
execute if entity @s[type=slime] at @s run function rpgloot:summon/veteran_zombie
execute unless entity @s[type=creeper] unless entity @s[type=witch] unless entity @s[type=zombie] unless entity @s[type=husk] unless entity @s[type=skeleton] unless entity @s[type=stray] unless entity @s[type=spider] unless entity @s[type=enderman] at @s run function rpgloot:summon/veteran_zombie
tp @s ~ -500 ~