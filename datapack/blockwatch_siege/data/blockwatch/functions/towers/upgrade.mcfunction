# blockwatch:towers/upgrade
# Context: as = player (bw.upgrade trigger), at = player position.
# Stand within 4 blocks of a placed tower and trigger /trigger bw.upgrade set 1.

execute unless entity @e[tag=bw.tower,distance=..4] run tellraw @s [{"text":"[Siege] ","color":"gold"},{"text":"No tower within range to upgrade.","color":"red"}]
execute unless entity @e[tag=bw.tower,distance=..4] run return 0

tag @s add bw.upgrading
execute as @e[tag=bw.tower,sort=nearest,limit=1,distance=..4] run function blockwatch:towers/do_upgrade
tag @s remove bw.upgrading
