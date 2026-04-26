# blockwatch:towers/arrow/hit
# Context: as = the enemy being hit, at = enemy position.
# Separated from attack so the target is locked to one entity for both particle and damage.

# Visual feedback: crit particle at enemy chest height
particle minecraft:crit ~ ~0.8 ~ 0.2 0.2 0.2 0.05 5

scoreboard players remove @s bw.hp 5
execute if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill
