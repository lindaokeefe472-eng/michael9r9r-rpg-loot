function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..15 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/overgrown_armory
execute if score rpgloot rpgloot.rng matches 16..30 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/library
execute if score rpgloot rpgloot.rng matches 31..40 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/sunken_ruins
execute if score rpgloot rpgloot.rng matches 41..55 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/jeweled_caverns
execute if score rpgloot rpgloot.rng matches 56..70 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/magma_manufactory
execute if score rpgloot rpgloot.rng matches 71..85 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/catacombs
execute if score rpgloot rpgloot.rng matches 86..100 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] run function rpgloot:structures/arid_tomb_excavator


tellraw @a {"translate":"rpgloot.msg.structure_revealed","fallback":"The earth trembles below you as an ancient structure is revealed...","color":"green"}
