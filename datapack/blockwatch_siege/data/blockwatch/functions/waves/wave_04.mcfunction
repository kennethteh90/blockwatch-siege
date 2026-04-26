# blockwatch:waves/wave_04
# Wave 4: 4 Walkers (0-3) + 4 Runners (4-7). Lane 1 only. Total 8.

execute if score #sp_idx bw.tmp matches 0..3 run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 4..7 run function blockwatch:enemies/spawn/runner

execute if score #sp_idx bw.tmp matches 8.. run scoreboard players set #sp_done bw.tmp 1
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
