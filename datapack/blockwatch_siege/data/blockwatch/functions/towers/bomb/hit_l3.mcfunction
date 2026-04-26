# blockwatch:towers/bomb/hit_l3
# Context: as = enemy entity hit by L3 Bomb AoE. at = that enemy's position.

particle minecraft:explosion ~ ~0.8 ~ 0.2 0.2 0.2 0.1 5
scoreboard players remove @s bw.hp 28
execute if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill
