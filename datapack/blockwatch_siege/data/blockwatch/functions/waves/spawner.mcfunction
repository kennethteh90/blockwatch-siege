# blockwatch:waves/spawner
# Tick-based enemy spawner. Called every tick during state 3 (combat).
# Uses fake-player scores in bw.tmp:
#   #sp_idx  — index of the next enemy to spawn in the current wave
#   #sp_cd   — ticks remaining before the next spawn (40 ticks = 2 s between enemies)
#   #sp_done — 1 when all enemies for this wave have been queued

# Count down cooldown (only while positive to avoid underflow)
execute if score #sp_cd bw.tmp matches 1.. run scoreboard players remove #sp_cd bw.tmp 1

# Spawn next enemy when cooldown is 0 and wave is not fully spawned
execute if score #sp_cd bw.tmp matches ..0 unless score #sp_done bw.tmp matches 1 run function blockwatch:waves/spawn_next
