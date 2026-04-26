# blockwatch:towers/bomb/place
# Context: as = target empty pad, at = pad position.
# Called from map/pad_interact; player is tagged bw.placing.

tag @s add bw.occupied
data modify entity @s CustomNameVisible set value 0b

summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.tower","bw.tower.bomb","bw.init"],CustomName:'{"text":"X Bomb","color":"red"}',CustomNameVisible:1b}

execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.tower_type  3
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.tower_level 1
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.cd          0
tag @e[tag=bw.init] remove bw.init

scoreboard players operation #gold bw.gold -= #cost.bomb bw.cfg
tellraw @a[tag=bw.placing,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Bomb Tower placed! (-100g team gold)  Range 10  DMG 15 AoE  Rate 3s","color":"red"}]
