# Transform current mob (@s) into an RPG Elite Mob
function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..55 at @s run function rpgloot:summon_veteran
execute if score rpgloot rpgloot.rng matches 56..86 at @s run function rpgloot:summon_elite
execute if score rpgloot rpgloot.rng matches 87..97 at @s run function rpgloot:summon_champion
execute if score rpgloot rpgloot.rng matches 98..99 at @s run function rpgloot:summon_legendary
execute if score rpgloot rpgloot.rng matches 100 at @s run function rpgloot:summon_unique
