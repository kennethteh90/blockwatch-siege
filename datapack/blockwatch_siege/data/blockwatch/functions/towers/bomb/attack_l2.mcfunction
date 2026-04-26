# blockwatch:towers/bomb/attack_l2
# L2 Bomb: range 10 (same), 20 HP AoE damage.

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1
execute as @e[tag=bw.enemy,distance=..10] at @s run function blockwatch:towers/bomb/hit_l2
