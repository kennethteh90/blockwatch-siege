# blockwatch:abilities/airstrike
# Context: as = player, at = player.
# Deals 20 HP damage to all living enemies. Cooldown: #cd.airstrike (120t / 6s).

execute if score @s bw.airstrike_cd matches 1.. run tellraw @s [{"text":"[Siege] ","color":"gold"},{"text":"Airstrike on cooldown!","color":"red"}]
execute if score @s bw.airstrike_cd matches 1.. run return 0

execute as @e[tag=bw.enemy] run scoreboard players remove @s bw.hp 20
execute as @e[tag=bw.enemy] if score @s bw.hp matches ..0 run function blockwatch:enemies/on_kill

scoreboard players operation @s bw.airstrike_cd = #cd.airstrike bw.cfg
particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 3
tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"Airstrike! ","color":"aqua","bold":true},{"text":"All enemies hit for 20 damage.","color":"aqua"}]
