##Called from 5tics
#run every 5tics

# For each type of dungeon, spawn a random matching mob on the tagged armor stands, then remove the armor stands.
execute as @e[tag=rpgloot.armoryspawn] at @s run function rpgloot:summon_armory
kill @e[tag=rpgloot.armoryspawn]

execute as @e[tag=rpgloot.libraryspawn] at @s run function rpgloot:summon_library
kill @e[tag=rpgloot.libraryspawn]

execute as @e[tag=rpgloot.buriedfortressspawn] at @s run function rpgloot:summon_buried_fortress
kill @e[tag=rpgloot.buriedfortressspawn]

execute as @e[tag=rpgloot.buriedfortressspawnboss] at @s run function rpgloot:summon/unique_deathstrider
kill @e[tag=rpgloot.buriedfortressspawnboss]

execute as @e[tag=rpgloot.sunkenruinsspawn] at @s run function rpgloot:summon_sunken_ruins
kill @e[tag=rpgloot.sunkenruinsspawn]

execute as @e[tag=rpgloot.brimstonespawn] at @s run function rpgloot:summon_brimstone
kill @e[tag=rpgloot.brimstonespawn]

execute as @e[tag=rpgloot.brimstonespawnboss] at @s run function rpgloot:summon/unique_flare
kill @e[tag=rpgloot.brimstonespawnboss]

execute as @e[tag=rpgloot.cavernsspawn] at @s run function rpgloot:summon_caverns
kill @e[tag=rpgloot.cavernsspawn]

execute as @e[tag=rpgloot.divinesanctumspawn] at @s run function rpgloot:summon_divine_sanctum
kill @e[tag=rpgloot.divinesanctumspawn]

execute as @e[tag=rpgloot.ashenchambersspawn] at @s run function rpgloot:summon_ashen_chambers
kill @e[tag=rpgloot.ashenchambersspawn]

execute as @e[tag=rpgloot.magmaspawn] at @s run function rpgloot:summon_magma
kill @e[tag=rpgloot.magmaspawn]

execute as @e[tag=rpgloot.catacombsspawn] at @s run function rpgloot:summon_catacombs
kill @e[tag=rpgloot.catacombsspawn]

execute as @e[tag=rpgloot.alphaspawn] at @s run function rpgloot:summon_alpha
kill @e[tag=rpgloot.alphaspawn]

execute as @e[tag=rpgloot.surfacespawn] at @s run function rpgloot:summon_surface
kill @e[tag=rpgloot.surfacespawn]

execute as @e[tag=rpgloot.aridtombspawn] at @s run function rpgloot:summon_arid_tomb
kill @e[tag=rpgloot.aridtombspawn]