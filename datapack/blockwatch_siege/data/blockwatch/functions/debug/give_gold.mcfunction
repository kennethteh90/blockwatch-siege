# blockwatch:debug/give_gold
# Grants the calling player 100 gold. Works in any state.
# Usage: /function blockwatch:debug/give_gold

scoreboard players add @s bw.gold 100
tellraw @s [{"text":"[Debug] ","color":"aqua"},{"text":"+100 gold → ","color":"white"},{"score":{"name":"@s","objective":"bw.gold"},"color":"yellow"},{"text":" total","color":"gray"}]
