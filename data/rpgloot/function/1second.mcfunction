#say 1second

function rpgloot:item_effects
execute as @a at @s run function rpgloot:item_effects_player
function rpgloot:bosses/carlos

execute at @e[type=trident,tag=lightningTrident] run summon lightning_bolt

schedule function rpgloot:1second 1s replace

execute at @e[tag=painelemental.ghastball] run function rpgloot:bosses/pain_elemental_summon_check
# World Random Events Timer (Triggers event check when enabled in options)
execute if score rpgloot eventset matches 1 run scoreboard players add rpgloot event_timer 1
execute if score rpgloot eventset matches 1 if score rpgloot event_timer matches 300.. run scoreboard players set rpgloot event_timer 0
execute if score rpgloot eventset matches 1 if score rpgloot event_timer matches 0 run function rpgloot:events/determine_event
