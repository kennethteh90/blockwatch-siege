# blockwatch:towers/do_sell
# Context: as = the tower entity being sold. Execution position = tower (set by at @s in towers/sell).
# Refunds ~70% of all invested gold (base cost + upgrade costs), level-aware via bw.cfg.
# Uses #tmp_sell bw.tmp to pass the refund amount into the dynamic tellraw.

scoreboard players set #tmp_sell bw.tmp 0

execute if score @s bw.tower_type matches 1 if score @s bw.tower_level matches 1 run scoreboard players operation #tmp_sell bw.tmp = #sell.arrow   bw.cfg
execute if score @s bw.tower_type matches 1 if score @s bw.tower_level matches 2 run scoreboard players operation #tmp_sell bw.tmp = #sell.arrow.2 bw.cfg
execute if score @s bw.tower_type matches 1 if score @s bw.tower_level matches 3 run scoreboard players operation #tmp_sell bw.tmp = #sell.arrow.3 bw.cfg
execute if score @s bw.tower_type matches 2 if score @s bw.tower_level matches 1 run scoreboard players operation #tmp_sell bw.tmp = #sell.frost   bw.cfg
execute if score @s bw.tower_type matches 2 if score @s bw.tower_level matches 2 run scoreboard players operation #tmp_sell bw.tmp = #sell.frost.2 bw.cfg
execute if score @s bw.tower_type matches 2 if score @s bw.tower_level matches 3 run scoreboard players operation #tmp_sell bw.tmp = #sell.frost.3 bw.cfg
execute if score @s bw.tower_type matches 3 if score @s bw.tower_level matches 1 run scoreboard players operation #tmp_sell bw.tmp = #sell.bomb   bw.cfg
execute if score @s bw.tower_type matches 3 if score @s bw.tower_level matches 2 run scoreboard players operation #tmp_sell bw.tmp = #sell.bomb.2 bw.cfg
execute if score @s bw.tower_type matches 3 if score @s bw.tower_level matches 3 run scoreboard players operation #tmp_sell bw.tmp = #sell.bomb.3 bw.cfg

scoreboard players operation #gold bw.gold += #tmp_sell bw.tmp
tellraw @a[tag=bw.selling,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Tower sold. (+","color":"yellow"},{"score":{"name":"#tmp_sell","objective":"bw.tmp"},"color":"green"},{"text":"g team gold)","color":"yellow"}]

# Un-occupy the pad this tower is sitting on and restore its label
execute as @e[tag=bw.pad,tag=bw.occupied,sort=nearest,limit=1,distance=..2] run tag @s remove bw.occupied
execute as @e[tag=bw.pad,sort=nearest,limit=1,distance=..2] run data modify entity @s CustomNameVisible set value 1b

kill @s
