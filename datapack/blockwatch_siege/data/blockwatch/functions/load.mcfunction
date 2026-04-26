# blockwatch:load
# Entry point on /reload. Sets up every scoreboard objective and drops into lobby.

function blockwatch:state/setup_scoreboards
function blockwatch:state/set_lobby

tellraw @a [{"text":"[Blockwatch: Siege] ","color":"gold","bold":true},{"text":"Reloaded. ","color":"white"},{"text":"v0.1.0","color":"gray"}]
