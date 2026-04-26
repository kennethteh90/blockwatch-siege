# blockwatch:enemies/tick
# Runs debuff countdowns then moves every active enemy along its lane.

execute as @e[tag=bw.enemy] run function blockwatch:enemies/debuff_tick
execute as @e[tag=bw.enemy] at @s run function blockwatch:enemies/move
execute as @e[tag=bw.enemy.boss] at @s run function blockwatch:enemies/boss_tick
