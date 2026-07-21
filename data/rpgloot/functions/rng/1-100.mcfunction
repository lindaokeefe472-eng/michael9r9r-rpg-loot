#use loot table set_attributes to generate rng
loot spawn ~ -9 ~ loot rpgloot:rng/1-100
#call a function as the item to only have to use @e once
execute as @e[type=item,nbt={Item:{tag:{rng:1}}},limit=1] run function rpgloot:rng/1-100_save