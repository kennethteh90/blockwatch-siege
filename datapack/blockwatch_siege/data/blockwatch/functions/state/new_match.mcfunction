# blockwatch:state/new_match
# Resets all game state and starts a fresh match.
# Call from lobby via command block, button, or /function directly.

function blockwatch:state/reset_match
function blockwatch:map/setup

scoreboard players set #wave     bw.wave  1
scoreboard players operation #castle_hp bw.castle_hp = #castle.max bw.cfg
scoreboard players set #timer    bw.timer 0

scoreboard players operation @a bw.gold = #gold.start bw.cfg

function blockwatch:state/set_build
