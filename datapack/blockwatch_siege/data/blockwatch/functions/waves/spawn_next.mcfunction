# blockwatch:waves/spawn_next
# Dispatches to the current wave's spawn function; resets the spawn cooldown.
# Called by waves/spawner when #sp_cd reaches 0 and #sp_done is 0.

execute if score #wave bw.wave matches 1  run function blockwatch:waves/wave_01
execute if score #wave bw.wave matches 2  run function blockwatch:waves/wave_02
execute if score #wave bw.wave matches 3  run function blockwatch:waves/wave_03
execute if score #wave bw.wave matches 4  run function blockwatch:waves/wave_04
execute if score #wave bw.wave matches 5  run function blockwatch:waves/wave_05
execute if score #wave bw.wave matches 6  run function blockwatch:waves/wave_06
execute if score #wave bw.wave matches 7  run function blockwatch:waves/wave_07
execute if score #wave bw.wave matches 8  run function blockwatch:waves/wave_08
execute if score #wave bw.wave matches 9  run function blockwatch:waves/wave_09
execute if score #wave bw.wave matches 10 run function blockwatch:waves/wave_10

# Reset cooldown from config (default 40 ticks = 2 s)
scoreboard players operation #sp_cd bw.tmp = #sp.interval bw.cfg
