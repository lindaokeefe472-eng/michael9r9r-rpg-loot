function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..25 run function rpgloot:structures/overgrown_armory
execute if score rpgloot rpgloot.rng matches 26..50 run function rpgloot:structures/library
execute if score rpgloot rpgloot.rng matches 51..75 run function rpgloot:structures/sunken_ruins
execute if score rpgloot rpgloot.rng matches 76..100 run function rpgloot:structures/jeweled_caverns

