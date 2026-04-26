# blockwatch:abilities/freeze
# Context: as = player, at = player.
# Freezes all living enemies for 5 s (100t). Cooldown: #cd.freeze (200t / 10s).

execute if score @s bw.freeze_cd matches 1.. run tellraw @s [{"text":"[Siege] ","color":"gold"},{"text":"Freeze burst on cooldown!","color":"red"}]
execute if score @s bw.freeze_cd matches 1.. run return 0

execute as @e[tag=bw.enemy] if score @s bw.hp matches 1.. run tag @s add bw.frozen
execute as @e[tag=bw.enemy] if score @s bw.hp matches 1.. run scoreboard players set @s bw.slow 100

scoreboard players operation @s bw.freeze_cd = #cd.freeze bw.cfg
particle minecraft:snowflake ~ ~1 ~ 5 1 5 0.1 100 force
tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"Freeze burst! ","color":"aqua","bold":true},{"text":"All enemies frozen for 5s.","color":"aqua"}]
