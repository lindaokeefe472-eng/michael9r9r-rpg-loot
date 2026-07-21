function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..33 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_pickaxe",tag:{display:{Name:"{\"text\":\"Ancient Excavator\"}"}}}}] run function rpgloot:structures/buried_fortress
execute if score rpgloot rpgloot.rng matches 34..66 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_pickaxe",tag:{display:{Name:"{\"text\":\"Ancient Excavator\"}"}}}}] run function rpgloot:structures/brimstone_bastion
execute if score rpgloot rpgloot.rng matches 67..100 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_pickaxe",tag:{display:{Name:"{\"text\":\"Ancient Excavator\"}"}}}}] run function rpgloot:structures/divine_sanctum
#execute if score rpgloot rpgloot.rng matches 76..100 at @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_pickaxe",tag:{display:{Name:"{\"text\":\"Ancient Excavator\"}"}}}}] run function rpgloot:structures/ashen_chambers

tellraw @a {"text":"The earth trembles below you as an ancient structure is revealed...","color":"gold"}
