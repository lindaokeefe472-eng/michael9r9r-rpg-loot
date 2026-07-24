execute store result score rpgloot rpgloot.rng run random value 1..100
execute if score rpgloot rpgloot.rng matches 1..25 run loot spawn ~ ~ ~ loot rpgloot:maps/alpha_castle
execute if score rpgloot rpgloot.rng matches 26..50 run loot spawn ~ ~ ~ loot rpgloot:maps/graveyard
execute if score rpgloot rpgloot.rng matches 51..75 run loot spawn ~ ~ ~ loot rpgloot:maps/capped_tower
execute if score rpgloot rpgloot.rng matches 76..100 run loot spawn ~ ~ ~ loot rpgloot:maps/collapsed_ruins
kill @s
