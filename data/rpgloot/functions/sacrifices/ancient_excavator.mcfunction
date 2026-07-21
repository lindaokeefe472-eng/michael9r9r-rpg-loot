function rpgloot:generate_structure
summon minecraft:lightning_bolt ~ ~ ~
kill @e[type=minecraft:item,nbt={Item:{name:"minecraft:diamond_pickaxe",components:{"minecraft:custom_name":'{"text":"Ancient Excavator"}'}}}] 