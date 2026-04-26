# blockwatch:towers/arrow/tick
# Context: as = Arrow Tower armor stand.
# L1/L2 share attack.mcfunction (range 8, 5 dmg). L3 uses attack_l3 (range 8, 8 dmg).
# Rate is level-aware via bw.cfg constants.

scoreboard players remove @s bw.cd 1

execute if score @s bw.cd matches ..0 at @s unless score @s bw.tower_level matches 3 run function blockwatch:towers/arrow/attack
execute if score @s bw.cd matches ..0 at @s   if score @s bw.tower_level matches 3 run function blockwatch:towers/arrow/attack_l3

execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 1 run scoreboard players operation @s bw.cd = #rate.arrow   bw.cfg
execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 2 run scoreboard players operation @s bw.cd = #rate.arrow.2 bw.cfg
execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 3 run scoreboard players operation @s bw.cd = #rate.arrow.3 bw.cfg
