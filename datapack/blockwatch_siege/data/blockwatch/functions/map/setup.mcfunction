# blockwatch:map/setup
# Configures the world and initializes map entities for a new match.
# Called from state/new_match.

gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule keepInventory true
gamerule naturalRegeneration false
time set day
weather clear

# Kill any towers left over from a previous match, then spawn fresh pads
kill @e[tag=bw.tower]
function blockwatch:map/pads

tellraw @a[tag=bw.playing] {"text":"[Siege] Map ready. /trigger bw.place 1 (Arrow 50g)  2 (Frost 75g)  3 (Bomb 100g). Sell: /trigger bw.sell 1","color":"gray"}
