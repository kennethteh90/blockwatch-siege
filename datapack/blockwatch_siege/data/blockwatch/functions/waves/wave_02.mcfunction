# blockwatch:waves/wave_02
# Wave 2 spawn table: 4 Walkers (0–3) then 3 Runners (4–6). Lane 1 only.
# #sp_lane is pre-set to 1 by state/set_combat and not overridden here.
# Called from waves/spawn_next when #wave = 2.

execute if score #sp_idx bw.tmp matches 0..3 run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 4..6 run function blockwatch:enemies/spawn/runner

# Mark wave fully queued after index 6
execute if score #sp_idx bw.tmp matches 7.. run scoreboard players set #sp_done bw.tmp 1

# Advance index (only while still spawning)
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
