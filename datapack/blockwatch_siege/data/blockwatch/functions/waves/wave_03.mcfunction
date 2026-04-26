# blockwatch:waves/wave_03
# Wave 3 spawn table: 3 Walkers (0–2), 2 Runners (3–4), 1 Brute (5). Lane 1 only.
# #sp_lane is pre-set to 1 by state/set_combat and not overridden here.
# Called from waves/spawn_next when #wave = 3.

execute if score #sp_idx bw.tmp matches 0..2 run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 3..4 run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 5    run function blockwatch:enemies/spawn/brute

# Mark wave fully queued after index 5
execute if score #sp_idx bw.tmp matches 6.. run scoreboard players set #sp_done bw.tmp 1

# Advance index (only while still spawning)
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
