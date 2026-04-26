# blockwatch:state/set_defeat
# Transition → state 6 (defeat). Castle HP reached zero.
# tick.mcfunction will auto-return to lobby after the timer runs out.

scoreboard players set #state bw.state 6
scoreboard players operation #timer bw.timer = #t.endgame bw.cfg

title @a times 10 80 30
title @a title {"text":"Defeat","color":"dark_red","bold":true}
title @a subtitle {"text":"The castle has fallen!","color":"red"}

tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"Defeat! The castle fell on wave ","color":"red"},{"score":{"name":"#wave","objective":"bw.wave"},"color":"yellow"},{"text":". Returning to lobby in 10s.","color":"red"}]
