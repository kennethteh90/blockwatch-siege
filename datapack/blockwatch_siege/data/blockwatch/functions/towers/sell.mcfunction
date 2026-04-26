# blockwatch:towers/sell
# Runs as the player (at player position). Finds the nearest tower within 4 blocks.

execute unless entity @e[tag=bw.tower,distance=..4] run tellraw @s {"text":"[Siege] Stand within 4 blocks of a tower to sell it.","color":"red"}
execute unless entity @e[tag=bw.tower,distance=..4] run return 0

tag @s add bw.selling
# at @s after the as-switch sets execution position to the tower — required for pad lookup in do_sell
execute as @e[tag=bw.tower,sort=nearest,limit=1,distance=..4] at @s run function blockwatch:towers/do_sell
tag @s remove bw.selling
