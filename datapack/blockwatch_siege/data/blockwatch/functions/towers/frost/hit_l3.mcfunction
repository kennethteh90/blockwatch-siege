# blockwatch:towers/frost/hit_l3
# Context: as = target enemy. L3 Frost — 5 HP damage, 5s freeze (#frost.dur.3).

particle minecraft:snowflake ~ ~0.8 ~ 0.3 0.3 0.3 0.05 15
scoreboard players remove @s bw.hp 5
execute if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill
execute if score @s bw.hp matches 1.. run tag @s add bw.frozen
execute if score @s bw.hp matches 1.. run scoreboard players operation @s bw.slow = #frost.dur.3 bw.cfg
