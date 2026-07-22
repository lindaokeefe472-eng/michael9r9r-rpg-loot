# Dispatcher for veteran boss spawning

execute if entity @s[type=creeper] run function rpgloot:summon/veteran_creeper
execute if entity @s[type=witch] run function rpgloot:summon/veteran_witch
execute if entity @s[type=zombie] run function rpgloot:summon/veteran_zombie
execute if entity @s[type=husk] run function rpgloot:summon/veteran_husk
execute if entity @s[type=drowned] run function rpgloot:summon/veteran_zombie
execute if entity @s[type=zombie_villager] run function rpgloot:summon/veteran_zombie
execute if entity @s[type=skeleton] run function rpgloot:summon/veteran_skeleton
execute if entity @s[type=stray] run function rpgloot:summon/veteran_stray
execute if entity @s[type=spider] run function rpgloot:summon/veteran_spider
execute if entity @s[type=cave_spider] run function rpgloot:summon/veteran_spider
execute if entity @s[type=wither_skeleton] run function rpgloot:summon/veteran_wither_skeleton
execute if entity @s[type=enderman] run function rpgloot:summon/veteran_enderman
execute if entity @s[type=blaze] run function rpgloot:summon/veteran_blaze
execute if entity @s[type=ghast] run function rpgloot:summon/veteran_ghast
execute if entity @s[type=phantom] run function rpgloot:summon/veteran_zombie
execute if entity @s[type=silverfish] run function rpgloot:summon/veteran_spider
execute if entity @s[type=slime] run function rpgloot:summon/veteran_zombie
execute unless entity @s[type=creeper] unless entity @s[type=witch] unless entity @s[type=zombie] unless entity @s[type=husk] unless entity @s[type=skeleton] unless entity @s[type=stray] unless entity @s[type=spider] unless entity @s[type=enderman] run function rpgloot:summon/veteran_zombie
tp @s ~ -500 ~
