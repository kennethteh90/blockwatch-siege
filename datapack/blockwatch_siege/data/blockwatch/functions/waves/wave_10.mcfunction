# blockwatch:waves/wave_10
# Wave 10 — THE SIEGE: 4 Walkers + 4 Runners + 2 Brutes + 1 Boss. Dual lane. Total 11.

execute if score #sp_idx bw.tmp matches 0  run scoreboard players set #sp_lane bw.tmp 1
execute if score #sp_idx bw.tmp matches 0  run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 1  run scoreboard players set #sp_lane bw.tmp 2
execute if score #sp_idx bw.tmp matches 1  run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 2  run scoreboard players set #sp_lane bw.tmp 1
execute if score #sp_idx bw.tmp matches 2  run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 3  run scoreboard players set #sp_lane bw.tmp 2
execute if score #sp_idx bw.tmp matches 3  run function blockwatch:enemies/spawn/walker
execute if score #sp_idx bw.tmp matches 4  run scoreboard players set #sp_lane bw.tmp 1
execute if score #sp_idx bw.tmp matches 4  run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 5  run scoreboard players set #sp_lane bw.tmp 2
execute if score #sp_idx bw.tmp matches 5  run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 6  run scoreboard players set #sp_lane bw.tmp 1
execute if score #sp_idx bw.tmp matches 6  run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 7  run scoreboard players set #sp_lane bw.tmp 2
execute if score #sp_idx bw.tmp matches 7  run function blockwatch:enemies/spawn/runner
execute if score #sp_idx bw.tmp matches 8  run scoreboard players set #sp_lane bw.tmp 1
execute if score #sp_idx bw.tmp matches 8  run function blockwatch:enemies/spawn/brute
execute if score #sp_idx bw.tmp matches 9  run scoreboard players set #sp_lane bw.tmp 2
execute if score #sp_idx bw.tmp matches 9  run function blockwatch:enemies/spawn/brute
# Boss always spawns in lane 1 (boss.mcfunction ignores #sp_lane)
execute if score #sp_idx bw.tmp matches 10 run function blockwatch:enemies/spawn/boss

execute if score #sp_idx bw.tmp matches 11.. run scoreboard players set #sp_done bw.tmp 1
execute unless score #sp_done bw.tmp matches 1 run scoreboard players add #sp_idx bw.tmp 1
