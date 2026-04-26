# blockwatch:state/set_intermission
# Transition → state 4 (intermission). Awards gold; grants flawless bonus if no leaks.
# Timer duration read from #t.intermiss bw.cfg.

scoreboard players set #state bw.state 4
scoreboard players operation #timer bw.timer = #t.intermiss bw.cfg

# Between-wave gold: base + (reward.wave * completed_wave)
scoreboard players operation #tmp bw.tmp  = #wave bw.wave
scoreboard players operation #tmp bw.tmp  *= #reward.wave bw.cfg
scoreboard players operation #tmp bw.tmp  += #reward.base bw.cfg
scoreboard players operation @a bw.gold   += #tmp bw.tmp

# Flawless bonus: no enemies leaked this wave
execute if score #wave_leaks bw.tmp matches 0 run scoreboard players operation @a bw.gold += #reward.bonus bw.cfg
execute if score #wave_leaks bw.tmp matches 0 run tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"FLAWLESS! +50g bonus — no leaks!","color":"aqua","bold":true}]
execute unless score #wave_leaks bw.tmp matches 0 run tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"Wave cleared! Gold bonus awarded.","color":"green"}]

title @a times 5 40 15
title @a title {"text":"Wave Clear!","color":"green","bold":true}
title @a subtitle {"text":"Next wave in 10 seconds…","color":"white"}
