# blockwatch:towers/frost/tick
# Context: as = Frost Tower armor stand.
# L1/L2 share attack.mcfunction (range 6, 3 dmg, 3s freeze). L3 uses attack_l3 (5 dmg, 5s freeze).

scoreboard players remove @s bw.cd 1

execute if score @s bw.cd matches ..0 at @s unless score @s bw.tower_level matches 3 run function blockwatch:towers/frost/attack
execute if score @s bw.cd matches ..0 at @s   if score @s bw.tower_level matches 3 run function blockwatch:towers/frost/attack_l3

execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 1 run scoreboard players operation @s bw.cd = #rate.frost   bw.cfg
execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 2 run scoreboard players operation @s bw.cd = #rate.frost.2 bw.cfg
execute if score @s bw.cd matches ..0 if score @s bw.tower_level matches 3 run scoreboard players operation @s bw.cd = #rate.frost.3 bw.cfg
