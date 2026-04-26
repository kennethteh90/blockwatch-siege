# blockwatch:debug/skip_wave
# Immediately ends the current combat wave. Only valid during state 3 (combat).

execute unless score #state bw.state matches 3 run tellraw @s {"text":"[Debug] skip_wave only works during state 3 (combat).","color":"red"}
execute unless score #state bw.state matches 3 run return 0

scoreboard players set #sp_done bw.tmp 1
kill @e[tag=bw.enemy]
tellraw @a [{"text":"[Debug] ","color":"aqua"},{"text":"Wave skipped.","color":"white"}]
