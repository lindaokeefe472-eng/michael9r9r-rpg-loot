execute if score rpgloot rpgloot.rng matches 1..10 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,0.0],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 1..10 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,0.0],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 1..10 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,0.0],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 11..22 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.10,0.5],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 11..22 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.0,-0.08,0.4],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 11..22 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.0,-0.12,0.6],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 23..34 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,0.5],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 23..34 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,0.4],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 23..34 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,0.6],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 35..46 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,0.0],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 35..46 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,0.0],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 35..46 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,0.0],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 47..58 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.10,-0.5],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 47..58 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.0,-0.08,-0.4],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 47..58 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.0,-0.12,-0.6],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 59..70 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,-0.5],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 59..70 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,-0.4],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 59..70 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,-0.6],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 71..82 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[-0.5,-0.10,0.5],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 71..82 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.4,-0.08,0.4],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 71..82 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[-0.6,-0.12,0.6],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 83..94 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.5,-0.10,-0.5],ExplosionPower:2}
execute if score rpgloot rpgloot.rng matches 83..94 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[0.4,-0.08,-0.4],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 83..94 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.6,-0.12,-0.6],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 95..98 run summon minecraft:fireball ~ ~3 ~ {direction:[0.0,0.0,0.0],power:[0.0,-0.9,0.0],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 95..98 run summon minecraft:fireball ~3 ~3 ~1 {direction:[0.0,0.0,0.0],power:[-0.1,-1.0,-0.1],ExplosionPower:1}
execute if score rpgloot rpgloot.rng matches 95..98 run summon minecraft:fireball ~1 ~3 ~3 {direction:[0.0,0.0,0.0],power:[0.1,-1.1,0.1],ExplosionPower:1}

execute if score rpgloot rpgloot.rng matches 99 run function rpgloot:bosses/carlosfireballs_big

execute if score rpgloot rpgloot.rng matches 100 run function rpgloot:bosses/carlosfireballs_biggest
