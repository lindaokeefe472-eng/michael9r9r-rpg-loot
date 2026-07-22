tellraw @a {"text":"You hear demonic rambling draw closer...","color":"dark_red"}

bossbar add rpgloot.painelemental {"text":"Pain Elemental","color":"red"}
bossbar set rpgloot.painelemental color red
bossbar set rpgloot.painelemental max 400


summon ghast ~ ~10 ~ {CustomName:'[{"text": "Pain Elemental", "color": "white"}]',CustomNameVisible:1,death_loot_table:"rpgloot:pain_elemental_loot",active_effects:[{id:"minecraft:water_breathing",amplifier:0,duration:999999},{id:"minecraft:regeneration",amplifier:0,duration:999999},{id:"minecraft:fire_resistance",amplifier:1,duration:999999},{id:"minecraft:resistance",amplifier:0,duration:999999},{id:"minecraft:jump_boost",amplifier:3,duration:999999}],attributes:[{id:"minecraft:max_health",base:400.0},{id:"minecraft:movement_speed",base:1.40},{id:"minecraft:follow_range",base:170.0},{id:"minecraft:knockback_resistance",base:0.50},{id:"minecraft:attack_knockback",base:4.0},{id:"minecraft:attack_damage",base:9.0}],Silent:0,Glowing:0,Health:400.0f,Tags:["rpgloot.boss","rpgloot.ghast",rpgloot.painelemental]}