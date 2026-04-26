# blockwatch:enemies/on_kill
# Context: as = the dying enemy entity.
# Awards kill gold to all players, notifies chat, then removes the entity.

execute if score @s bw.enemy_type matches 1 run scoreboard players operation #gold bw.gold += #reward.walker bw.cfg
execute if score @s bw.enemy_type matches 1 run tellraw @a[tag=bw.playing] [{"text":"[+","color":"green"},{"score":{"name":"#reward.walker","objective":"bw.cfg"},"color":"green"},{"text":"g]","color":"green"},{"text":" Walker","color":"dark_gray"}]

execute if score @s bw.enemy_type matches 2 run scoreboard players operation #gold bw.gold += #reward.runner bw.cfg
execute if score @s bw.enemy_type matches 2 run tellraw @a[tag=bw.playing] [{"text":"[+","color":"green"},{"score":{"name":"#reward.runner","objective":"bw.cfg"},"color":"green"},{"text":"g]","color":"green"},{"text":" Runner","color":"dark_gray"}]

execute if score @s bw.enemy_type matches 3 run scoreboard players operation #gold bw.gold += #reward.brute bw.cfg
execute if score @s bw.enemy_type matches 3 run tellraw @a[tag=bw.playing] [{"text":"[+","color":"green"},{"score":{"name":"#reward.brute","objective":"bw.cfg"},"color":"green"},{"text":"g] ","color":"green"},{"text":"Brute down!","color":"yellow","bold":true}]

execute if score @s bw.enemy_type matches 4 run scoreboard players operation #gold bw.gold += #reward.boss bw.cfg
execute if score @s bw.enemy_type matches 4 run tellraw @a[tag=bw.playing] [{"text":"★ BOSS DEFEATED ★","color":"gold","bold":true},{"text":"  [+","color":"green"},{"score":{"name":"#reward.boss","objective":"bw.cfg"},"color":"green"},{"text":"g]","color":"green"}]

kill @s
