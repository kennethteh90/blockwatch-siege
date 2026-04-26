# blockwatch:towers/frost/hit
# Context: as = target enemy.
# Deals 3 HP and freezes the enemy for #frost.dur bw.cfg ticks.
# Frozen enemies skip movement in enemies/move (bw.frozen tag guard).
# The freeze is only applied if the enemy survives the hit.

particle minecraft:snowflake ~ ~0.8 ~ 0.3 0.3 0.3 0.05 10
scoreboard players remove @s bw.hp 3
execute if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill
execute if score @s bw.hp matches 1.. run tag @s add bw.frozen
execute if score @s bw.hp matches 1.. run scoreboard players operation @s bw.slow = #frost.dur bw.cfg
