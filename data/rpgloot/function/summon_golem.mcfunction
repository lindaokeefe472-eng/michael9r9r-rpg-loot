function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 91..96 as @s as @s at @e[type=#rpgloot:village_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/veteran_iron_golem
execute if score rpgloot rpgloot.rng matches 97..98 as @s as @s at @e[type=#rpgloot:village_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/elite_iron_golem
execute if score rpgloot rpgloot.rng matches 99 as @s as @s at @e[type=#rpgloot:village_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/champion_iron_golem
execute if score rpgloot rpgloot.rng matches 100 as @s as @s at @e[type=#rpgloot:village_mobs,tag=!global.ignore,tag=!rpgloot_rng,tag=!rpgloot.boss,limit=1,sort=random] run function rpgloot:summon/legendary_iron_golem