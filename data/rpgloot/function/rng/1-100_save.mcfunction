#move to rng scoreboard
execute store result score rpgloot rpgloot.rng run data get entity @s item.components."minecraft:attribute_modifiers".modifiers[0].amount
#kill the item used
kill @s