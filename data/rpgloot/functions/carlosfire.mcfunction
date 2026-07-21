execute at @e[type=trident,tag=lightningTrident] run summon lightning_bolt

execute if entity @e[tag=carlos] run function rpgloot:rng/1-100

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 1..10 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,0.0],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 1..10 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 1..10 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,0.0],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 11..22 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.10,0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 11..22 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.0,-0.08,0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 11..22 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.0,-0.12,0.6],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 23..34 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 23..34 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 23..34 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,0.6],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 35..46 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,0.0],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 35..46 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 35..46 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,0.0],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 47..58 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.10,-0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 47..58 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.0,-0.08,-0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 47..58 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.0,-0.12,-0.6],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 59..70 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,-0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 59..70 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,-0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 59..70 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,-0.6],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 71..82 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 71..82 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 71..82 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,0.6],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 83..94 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,-0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 83..94 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,-0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 83..94 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,-0.6],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 95..98 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.9,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 95..98 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.1,-1.0,-0.1],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 95..98 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.1,-1.1,0.1],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,0.9,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.1,1.0,-0.1],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~7 {direction:[0.0,0.0,0.0],power:[0.1,1.1,0.1],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,0.9,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.1,1.0,-0.1],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~1 ~3 ~5 {direction:[0.0,0.0,0.0],power:[0.1,1.1,0.1],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,0.9,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~3 ~4 ~10 {direction:[0.0,0.0,0.0],power:[-0.1,1.0,-0.1],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~8 ~5 ~7 {direction:[0.0,0.0,0.0],power:[0.1,1.1,0.1],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~8 ~3 ~3 {direction:[0.0,0.0,0.0],power:[1.0,0.8,1.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~3 ~6 ~3 {direction:[0.0,0.0,0.0],power:[-0.5,0.8,-0.1],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 99 at @e[tag=carlos] run summon minecraft:fireball ~1 ~7 ~5 {direction:[0.0,0.0,0.0],power:[0.2,0.7,0.1],ExplosionPower:1}

execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~2 {direction:[0.0,0.0,0.0],power:[0.5,-0.10,0.0],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~1 ~1 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~1 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.10,0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.0,-0.08,0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~9 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.0,-0.12,0.6],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~2 ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~1 ~2 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~4 ~2 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,0.6],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~2 ~4 {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,0.0],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~8 ~2 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~8 ~2 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~5 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.10,-0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~3 ~5 ~8 {direction:[0.0,0.0,0.0],power:[0.0,-0.08,-0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~1 ~5 ~8 {direction:[0.0,0.0,0.0],power:[0.0,-0.12,-0.6],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~5 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,-0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~4 ~5 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,-0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~5 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,-0.6],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~5 ~4 ~2 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~2 ~4 ~4 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,0.6],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~ ~4 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,-0.5],ExplosionPower:2}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~4 ~4 ~2 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,-0.4],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~2 ~6 ~4 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,-0.6],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~4 ~6 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.9,0.0],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~4 ~6 ~2 {direction:[0.0,0.0,0.0],power:[-0.1,-1.0,-0.1],ExplosionPower:1}
execute if entity @e[tag=carlos] if score rpgloot rpgloot.rng matches 100 at @e[tag=carlos] run summon minecraft:fireball ~2 ~4 ~4 {direction:[0.0,0.0,0.0],power:[0.1,-1.1,0.1],ExplosionPower:1}
