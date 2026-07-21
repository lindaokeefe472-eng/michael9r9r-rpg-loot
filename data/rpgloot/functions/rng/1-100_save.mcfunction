#move to rng scoreboard
execute store result score rpgloot rpgloot.rng run data get entity @s Item.tag.AttributeModifiers[0].Amount
#kill the item used
kill @s