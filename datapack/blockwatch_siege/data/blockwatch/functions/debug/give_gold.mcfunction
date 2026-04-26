# blockwatch:debug/give_gold
# Grants the team bank 100 gold. Works in any state.
# Usage: /function blockwatch:debug/give_gold

scoreboard players add #gold bw.gold 100
tellraw @s [{"text":"[Debug] ","color":"aqua"},{"text":"+100 team gold → ","color":"white"},{"score":{"name":"#gold","objective":"bw.gold"},"color":"yellow"},{"text":" total","color":"gray"}]
