# blockwatch:towers/bomb/hit_l2
# Context: as = enemy entity hit by L2 Bomb AoE. at = that enemy's position.

particle minecraft:explosion ~ ~0.8 ~ 0.2 0.2 0.2 0.1 5
scoreboard players remove @s bw.hp 20
execute if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill
