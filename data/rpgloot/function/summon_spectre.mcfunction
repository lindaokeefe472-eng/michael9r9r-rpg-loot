function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..35 as @e[type=zombie,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] at @s if entity @s[y=50,dy=1000] run function rpgloot:summon/spectre_zombie
execute if score rpgloot rpgloot.rng matches 36..70 as @e[type=spider,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] at @s if entity @s[y=50,dy=1000] run function rpgloot:summon/spectre_spider
