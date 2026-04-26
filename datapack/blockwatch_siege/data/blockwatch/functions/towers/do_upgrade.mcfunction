# blockwatch:towers/do_upgrade
# Context: as = tower armor stand.  @a[tag=bw.upgrading,limit=1] = the buyer.
# Uses `return run` to prevent fall-through from L1→L2 into L2→L3 in the same call.

execute if score @s bw.tower_level matches 3.. run tellraw @a[tag=bw.upgrading,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Already at max level!","color":"red"}]
execute if score @s bw.tower_level matches 3.. run return 0

execute if score @s bw.tower_level matches 1 run return run function blockwatch:towers/do_upgrade_l2
function blockwatch:towers/do_upgrade_l3
