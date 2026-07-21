tellraw @a {"text":"You hear demonic rambling draw closer...","color":"dark_red"}

bossbar add rpgloot.painelemental {"text":"Pain Elemental","color":"red"}
bossbar set rpgloot.painelemental color red
bossbar set rpgloot.painelemental max 400


summon ghast ~ ~10 ~ {CustomName:"\"§cPain Elemental\"",CustomNameVisible:1,DeathLootTable:"rpgloot:pain_elemental_loot",ActiveEffects:[{Id:13,Amplifier:0,Duration:999999},{Id:10,Amplifier:0,Duration:999999},{Id:12,Amplifier:1,Duration:999999},{Id:11,Amplifier:0,Duration:999999},{Id:8,Amplifier:3,Duration:999999}],Attributes:[{Name:generic.max_health, Base:400.0},{Name:generic.movement_speed, Base:1.40f},{Name:generic.follow_range, Base:170.0f},{Name:generic.knockback_resistance,Base:0.50f},{Name:generic.attack_knockback ,Base:4.0f},{Name:generic.attack_damage,Base:9.0f}],Silent:0,Glowing:0,Health:400.0f,Tags:["rpgloot.boss","rpgloot.ghast",rpgloot.painelemental]}