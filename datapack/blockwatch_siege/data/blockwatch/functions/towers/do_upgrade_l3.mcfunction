# blockwatch:towers/do_upgrade_l3
# Context: as = tower (level 2). Upgrades to level 3 for 50g.
# Returns 0 if player cannot afford; returns normally (success) otherwise.

execute unless score @a[tag=bw.upgrading,limit=1] bw.gold >= #upg.cost.2 bw.cfg run tellraw @a[tag=bw.upgrading,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Not enough gold — upgrade costs 50g.","color":"red"}]
execute unless score @a[tag=bw.upgrading,limit=1] bw.gold >= #upg.cost.2 bw.cfg run return 0

scoreboard players operation @a[tag=bw.upgrading,limit=1] bw.gold -= #upg.cost.2 bw.cfg
scoreboard players set @s bw.tower_level 3

execute if score @s bw.tower_type matches 1 run data modify entity @s CustomName set value '{"text":"▲▲▲ Arrow","color":"gold"}'
execute if score @s bw.tower_type matches 2 run data modify entity @s CustomName set value '{"text":"*** Frost","color":"gold"}'
execute if score @s bw.tower_type matches 3 run data modify entity @s CustomName set value '{"text":"XXX Bomb","color":"gold"}'
tellraw @a[tag=bw.upgrading,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Upgraded to Lv 3! (-50g)  MAX — bonus damage","color":"gold"}]
