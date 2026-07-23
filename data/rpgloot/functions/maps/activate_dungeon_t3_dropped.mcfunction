execute store result score rpgloot rpgloot.rng run random value 1..100
execute if score rpgloot rpgloot.rng matches 1..33 run loot spawn ~ ~ ~ loot rpgloot:maps/buried_fortress
execute if score rpgloot rpgloot.rng matches 34..66 run loot spawn ~ ~ ~ loot rpgloot:maps/brimstone_bastion
execute if score rpgloot rpgloot.rng matches 67..100 run loot spawn ~ ~ ~ loot rpgloot:maps/divine_sanctum
kill @s
