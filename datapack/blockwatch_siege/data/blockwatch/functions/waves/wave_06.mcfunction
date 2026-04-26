# blockwatch:waves/wave_06
# Wave 6: 6 Runners (0-5) + 2 Brutes (6-7). Lane 1 only. Total 8.

execute if score #sp_idx bw.tmp matches 0..5 run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 6..7 run function blockwatch:enemies/spawn/brute

execute if score #sp_idx bw.tmp matches 8.. run scoreboard players set #sp_done bw.tmp 1
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
