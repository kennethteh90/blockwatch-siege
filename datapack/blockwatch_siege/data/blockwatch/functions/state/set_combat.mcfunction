# blockwatch:state/set_combat
# Transition → state 3 (combat). Initializes wave spawner and resets leak counter.

scoreboard players set #state bw.state 3
scoreboard players set #timer bw.timer 0

# Spawner state — tick-based spawner reads these each tick
scoreboard players set #sp_idx    bw.tmp 0
scoreboard players set #sp_cd     bw.tmp 0
scoreboard players set #sp_done   bw.tmp 0
scoreboard players set #sp_lane   bw.tmp 1
# Reset per-wave leak counter used for flawless bonus
scoreboard players set #wave_leaks bw.tmp 0
# Refresh ability cooldowns at wave start
scoreboard players set @a bw.airstrike_cd 0
scoreboard players set @a bw.freeze_cd 0

title @a times 5 40 15
title @a title [{"text":"Wave ","color":"red","bold":true},{"score":{"name":"#wave","objective":"bw.wave"},"color":"yellow","bold":true}]
title @a subtitle {"text":"Defend the castle!","color":"white"}

tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"Wave ","color":"red"},{"score":{"name":"#wave","objective":"bw.wave"},"color":"yellow"},{"text":" has begun!","color":"red"}]

function blockwatch:waves/spawn
