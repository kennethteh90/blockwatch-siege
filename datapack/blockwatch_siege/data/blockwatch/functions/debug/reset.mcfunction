# blockwatch:debug/reset
# Hard-resets to a clean lobby state: removes all entities, zeroes all scores.

kill @e[tag=bw.enemy]
kill @e[tag=bw.tower]
kill @e[tag=bw.pad]

scoreboard players set #state      bw.state     0
scoreboard players set #wave       bw.wave      0
scoreboard players set #castle_hp  bw.castle_hp 0
scoreboard players set #timer      bw.timer     0
scoreboard players set #sp_idx     bw.tmp       0
scoreboard players set #sp_cd      bw.tmp       0
scoreboard players set #sp_done    bw.tmp       0
scoreboard players set #sp_lane    bw.tmp       1
scoreboard players set #wave_leaks bw.tmp       0
scoreboard players set #ui_tick    bw.tmp       0
scoreboard players set @a bw.gold 0

tellraw @a [{"text":"[Debug] ","color":"aqua"},{"text":"Full reset — returning to lobby.","color":"white"}]
function blockwatch:state/set_lobby
