# blockwatch:towers/bomb/tick
# Context: as = Bomb Tower armor stand.
# Each level uses a separate attack file (different damage; L3 also gets longer range).

scoreboard players remove @s bw.cd 1

execute if score @s bw.cd matches ..0 at @s if score @s bw.tower_level matches 1 run function blockwatch:towers/bomb/attack
execute if score @s bw.cd matches ..0 at @s if score @s bw.tower_level matches 2 run function blockwatch:towers/bomb/attack_l2
execute if score @s bw.cd matches ..0 at @s if score @s bw.tower_level matches 3 run function blockwatch:towers/bomb/attack_l3

execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 1 run scoreboard players operation @s bw.cd = #rate.bomb   bw.cfg
execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 2 run scoreboard players operation @s bw.cd = #rate.bomb.2 bw.cfg
execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 3 run scoreboard players operation @s bw.cd = #rate.bomb.3 bw.cfg
