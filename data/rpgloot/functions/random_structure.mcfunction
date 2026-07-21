function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..23 as @s at @s run function rpgloot:structures/random_overgrown_armory
execute if score rpgloot rpgloot.rng matches 24..46 as @s at @s run function rpgloot:structures/random_library
execute if score rpgloot rpgloot.rng matches 47..70 as @s at @s run function rpgloot:structures/random_sunken_ruins
execute if score rpgloot rpgloot.rng matches 71..85 as @s at @s run function rpgloot:structures/random_buried_fortress
execute if score rpgloot rpgloot.rng matches 86..100 as @s at @s run function rpgloot:structures/random_brimstone_bastion

