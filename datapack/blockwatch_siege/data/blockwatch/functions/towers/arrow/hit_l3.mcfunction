# blockwatch:towers/arrow/hit_l3
# Context: as = target enemy. L3 Arrow — 8 HP damage.

particle minecraft:crit ~ ~0.8 ~ 0.2 0.2 0.2 0.05 8
scoreboard players remove @s bw.hp 8
execute if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill
