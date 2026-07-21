function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng matches 1..11 run function rpgloot:summon/unique_hordir
execute if score rpgloot rpgloot.rng matches 12..21 run function rpgloot:summon/unique_vermivorous
execute if score rpgloot rpgloot.rng matches 22..31 run function rpgloot:summon/unique_abyss_watcher
execute if score rpgloot rpgloot.rng matches 32..41 run function rpgloot:summon/unique_vanta
execute if score rpgloot rpgloot.rng matches 42..51 run function rpgloot:summon/unique_dread_knight
execute if score rpgloot rpgloot.rng matches 52..61 run function rpgloot:summon/unique_butcher
execute if score rpgloot rpgloot.rng matches 62..67 run function rpgloot:summon/unique_killer_rabbit
execute if score rpgloot rpgloot.rng matches 68..79 run function rpgloot:summon/unique_mavmus
execute if score rpgloot rpgloot.rng matches 80..89 run function rpgloot:summon/unique_headless_horseman
execute if score rpgloot rpgloot.rng matches 90..100 run function rpgloot:summon/unique_sharpshooter