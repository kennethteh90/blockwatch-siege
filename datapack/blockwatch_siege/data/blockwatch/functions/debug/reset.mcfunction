# blockwatch:debug/reset
# Hard-resets to a clean lobby state via blockwatch:state/reset_match.

function blockwatch:state/reset_match

tellraw @a [{"text":"[Debug] ","color":"aqua"},{"text":"Full reset — returning to lobby.","color":"white"}]
function blockwatch:state/set_lobby
