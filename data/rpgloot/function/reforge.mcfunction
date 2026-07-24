# Ancient Reforge Ritual
# Spawn anvil chime and particle burst
playsound minecraft:block.anvil.use master @a ~ ~ ~ 1 1.2
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.5
particle minecraft:enchant ~ ~1 ~ 0.5 1 0.5 0.2 30
particle minecraft:end_rod ~ ~1 ~ 0.3 1.5 0.3 0.1 20

title @a[distance=..10] actionbar {"text":"🔨 装备重铸成功！获得了新的属性前缀！", "color":"gold", "bold":true}

# Consume the Reforge Rune item entity
kill @s
