# blockwatch:waves/wave_05
# Wave 5: 3 Walkers (0-2) + 3 Runners (3-5) + 2 Brutes (6-7). Lane 1 only. Total 8.

execute if score #sp_idx bw.tmp matches 0..2 run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 3..5 run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 6..7 run function blockwatch:enemies/spawn/brute

execute if score #sp_idx bw.tmp matches 8.. run scoreboard players set #sp_done bw.tmp 1
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
