# blockwatch:state/set_lobby
# Transition → state 1 (lobby). Called on load, after victory, and after defeat.
# Clears any active match first so the lobby never inherits arena state.

function blockwatch:state/reset_match
scoreboard players set #state bw.state 1
scoreboard players set #timer bw.timer 0

title @a times 10 60 20
title @a title  {"text":"Blockwatch: Siege","color":"gold","bold":true}
title @a subtitle {"text":"Waiting for players…","color":"gray"}

tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"Lobby. Run ","color":"white"},{"text":"/function blockwatch:state/new_match","color":"aqua"},{"text":" to start.","color":"white"}]
