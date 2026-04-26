# blockwatch:towers/do_upgrade_l2
# Context: as = tower (level 1). Upgrades to level 2 for 30g.
# Returns 0 if player cannot afford; returns normally (success) otherwise.

execute unless score #gold bw.gold >= #upg.cost.1 bw.cfg run tellraw @a[tag=bw.upgrading,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Team bank is too low — upgrade costs 30g.","color":"red"}]
execute unless score #gold bw.gold >= #upg.cost.1 bw.cfg run return 0

scoreboard players operation #gold bw.gold -= #upg.cost.1 bw.cfg
scoreboard players set @s bw.tower_level 2

execute if score @s bw.tower_type matches 1 run data modify entity @s CustomName set value '{"text":"▲▲ Arrow","color":"aqua"}'
execute if score @s bw.tower_type matches 2 run data modify entity @s CustomName set value '{"text":"** Frost","color":"aqua"}'
execute if score @s bw.tower_type matches 3 run data modify entity @s CustomName set value '{"text":"XX Bomb","color":"red"}'
tellraw @a[tag=bw.upgrading,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Upgraded to Lv 2! (-30g team gold)  Faster attack rate.","color":"green"}]
