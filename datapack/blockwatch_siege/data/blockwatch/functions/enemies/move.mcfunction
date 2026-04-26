# blockwatch:enemies/move
# Context: as = enemy entity, at = enemy position.
# Skips movement when frozen; routes to lane-specific function otherwise.

execute if entity @s[tag=bw.frozen] run return 0

execute if score @s bw.lane matches 1 run function blockwatch:enemies/lane1/move
execute if score @s bw.lane matches 2 run function blockwatch:enemies/lane2/move
