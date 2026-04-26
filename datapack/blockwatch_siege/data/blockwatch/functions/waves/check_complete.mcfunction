# blockwatch:waves/check_complete
# Called every tick during state 3 (combat).
# Transitions to intermission only after ALL enemies are spawned AND none remain alive.

execute if score #sp_done bw.tmp matches 1 unless entity @e[tag=bw.enemy] run function blockwatch:state/set_intermission
