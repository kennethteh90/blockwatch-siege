# blockwatch:towers/tick
# Dispatches per-tick logic for each tower type.
# Called once per tick during state 3 (combat).

execute as @e[tag=bw.tower.arrow] run function blockwatch:towers/arrow/tick
execute as @e[tag=bw.tower.frost] run function blockwatch:towers/frost/tick
execute as @e[tag=bw.tower.bomb]  run function blockwatch:towers/bomb/tick
