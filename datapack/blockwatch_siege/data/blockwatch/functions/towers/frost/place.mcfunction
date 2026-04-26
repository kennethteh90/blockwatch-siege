# blockwatch:towers/frost/place
# Context: as = target empty pad, at = pad position.
# Called from map/pad_interact; player is tagged bw.placing.

tag @s add bw.occupied
data modify entity @s CustomNameVisible set value 0b

summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.tower","bw.tower.frost","bw.init"],CustomName:'{"text":"* Frost","color":"aqua"}',CustomNameVisible:1b}

execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.tower_type  2
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.tower_level 1
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.cd          0
tag @e[tag=bw.init] remove bw.init

scoreboard players operation #gold bw.gold -= #cost.frost bw.cfg
tellraw @a[tag=bw.placing,limit=1] [{"text":"[Siege] ","color":"gold"},{"text":"Frost Tower placed! (-75g team gold)  Range 6  DMG 3  Freezes 3s","color":"aqua"}]
