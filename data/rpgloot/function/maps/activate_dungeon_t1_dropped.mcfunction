execute store result score rpgloot rpgloot.rng run random value 1..100
execute if score rpgloot rpgloot.rng matches 1..15 run loot spawn ~ ~ ~ loot rpgloot:maps/overgrown_armory
execute if score rpgloot rpgloot.rng matches 16..30 run loot spawn ~ ~ ~ loot rpgloot:maps/library
execute if score rpgloot rpgloot.rng matches 31..40 run loot spawn ~ ~ ~ loot rpgloot:maps/sunken_ruins
execute if score rpgloot rpgloot.rng matches 41..55 run loot spawn ~ ~ ~ loot rpgloot:maps/jeweled_caverns
execute if score rpgloot rpgloot.rng matches 56..70 run loot spawn ~ ~ ~ loot rpgloot:maps/magma_manufactory
execute if score rpgloot rpgloot.rng matches 71..85 run loot spawn ~ ~ ~ loot rpgloot:maps/catacombs
execute if score rpgloot rpgloot.rng matches 86..100 run loot spawn ~ ~ ~ loot rpgloot:maps/arid_tomb
kill @s
