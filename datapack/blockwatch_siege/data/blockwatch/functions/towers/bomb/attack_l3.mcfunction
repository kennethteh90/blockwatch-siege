# blockwatch:towers/bomb/attack_l3
# L3 Bomb: range 12 (extended), 28 HP AoE damage.

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1
execute as @e[tag=bw.enemy,distance=..12] at @s run function blockwatch:towers/bomb/hit_l3
