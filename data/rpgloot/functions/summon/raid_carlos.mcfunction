tellraw @a {"text":"You feel the world tremble beneath you...","color":"dark_red"}

bossbar add carlos {"text":"Carlos, Destroyer of Worlds","color":"green"}
bossbar set carlos color green
bossbar set carlos max 800

summon slime ~ ~100 ~ {Size:12,CustomName:"\"§cCarlos, Destroyer of Worlds\"",CustomNameVisible:1,DeathLootTable:"rpgloot:carlos_loot",ActiveEffects:[{Id:13,Amplifier:0,Duration:999999},{Id:10,Amplifier:2,Duration:999999},{Id:28,Amplifier:2,Duration:1000},{Id:12,Amplifier:1,Duration:999999},{Id:11,Amplifier:0,Duration:999999},{Id:8,Amplifier:5,Duration:999999}],Attributes:[{Name:generic.max_health, Base:800.0},{Name:generic.movement_speed, Base:0.90f},{Name:generic.follow_range, Base:512.0f},{Name:generic.knockback_resistance,Base:0.95f},{Name:generic.attack_knockback ,Base:6.0f},{Name:generic.attack_damage,Base:20.0f}],Silent:0,Glowing:0,Health:800.0f,Tags:["rpgloot.boss","carlos","rpgloot.raidboss"]}