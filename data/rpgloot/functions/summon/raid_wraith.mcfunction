tellraw @a {"text":"You hear a distant shrieking draw closer...","color":"dark_red"}
weather thunder
time set midnight

bossbar add wraith {"text":"Wraith, Scourge of the Skies","color":"blue"}
bossbar set wraith color blue
bossbar set wraith max 600

summon phantom ~ ~50 ~ {Size:20,CustomName:"\"§9Wraith, Scourge of the Skies\"",CustomNameVisible:1,DeathLootTable:"rpgloot:wraith_loot",ActiveEffects:[{Id:13,Amplifier:0,Duration:999999},{Id:10,Amplifier:1,Duration:999999},{Id:12,Amplifier:1,Duration:999999},{Id:11,Amplifier:0,Duration:999999},{Id:8,Amplifier:5,Duration:999999}],Attributes:[{Name:generic.max_health, Base:600.0},{Name:generic.movement_speed, Base:200.0f},{Name:generic.follow_range, Base:512.0f},{Name:generic.knockback_resistance,Base:0.95f},{Name:generic.attack_knockback ,Base:6.0f},{Name:generic.attack_damage,Base:24.0f}],Silent:0,Glowing:0,Health:600.0f,Tags:["rpgloot.boss","wraith","rpgloot.raidboss"]}