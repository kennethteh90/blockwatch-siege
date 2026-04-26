# blockwatch:towers/bomb/attack
# Context: as = Bomb Tower, at = tower position.
# AoE — damages ALL enemies in range 10 for 15 HP each.
# Range: 10 blocks  ← PLACEHOLDER: edit distance=..10
# Damage: 15 HP     ← PLACEHOLDER: edit the literal 15

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1
execute as @e[tag=bw.enemy,distance=..10] at @s run function blockwatch:towers/bomb/hit
