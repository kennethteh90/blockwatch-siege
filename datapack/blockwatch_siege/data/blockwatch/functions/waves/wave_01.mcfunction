# blockwatch:waves/wave_01
# Wave 1 spawn table: 5 Walkers (indices 0–4). Lane 1 only.
# #sp_lane is pre-set to 1 by state/set_combat and not overridden here.
# Called from waves/spawn_next when #wave = 1.

execute if score #sp_idx bw.tmp matches 0..4 run function blockwatch:enemies/spawn/walker

# Mark wave fully queued after index 4
execute if score #sp_idx bw.tmp matches 5.. run scoreboard players set #sp_done bw.tmp 1

# Advance index (only while still spawning)
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
