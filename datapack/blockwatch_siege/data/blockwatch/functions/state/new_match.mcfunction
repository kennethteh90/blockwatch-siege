# blockwatch:state/new_match
# Resets all game state and starts a fresh match.
# Call from lobby via command block, button, or /function directly.

function blockwatch:map/setup

scoreboard players set #wave     bw.wave  1
scoreboard players operation #castle_hp bw.castle_hp = #castle.max bw.cfg
scoreboard players set #timer    bw.timer 0

scoreboard players operation @a bw.gold = #gold.start bw.cfg

give @a minecraft:nether_star{display:{Name:'{"text":"Wave Token","color":"yellow","italic":false}',Lore:['{"text":"Use to launch the next wave","color":"gray","italic":false}']}} 1

function blockwatch:state/set_build
