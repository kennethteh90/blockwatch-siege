# blockwatch:map/pads
# Summons 8 invisible armor-stand pad markers — 4 per lane.
# Kills existing pads first to prevent duplicates on re-setup.
# Coordinates → see map/config. PLACEHOLDER: match your map.

kill @e[tag=bw.pad]

# ── Lane 1 pads (Z = -4.5, 6 blocks south of lane path) ─────────────────────
summon minecraft:armor_stand 10.5 65 -4.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.1","bw.init"],CustomName:'{"text":"[1] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 1
tag @e[tag=bw.init] remove bw.init

summon minecraft:armor_stand 30.5 65 -4.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.2","bw.init"],CustomName:'{"text":"[2] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 2
tag @e[tag=bw.init] remove bw.init

summon minecraft:armor_stand 50.5 65 -4.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.3","bw.init"],CustomName:'{"text":"[3] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 3
tag @e[tag=bw.init] remove bw.init

summon minecraft:armor_stand 70.5 65 -4.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.4","bw.init"],CustomName:'{"text":"[4] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 4
tag @e[tag=bw.init] remove bw.init

# ── Lane 2 pads (Z = 25.5, 5 blocks north of lane path) ─────────────────────
summon minecraft:armor_stand 10.5 65 25.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.5","bw.init"],CustomName:'{"text":"[5] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 5
tag @e[tag=bw.init] remove bw.init

summon minecraft:armor_stand 30.5 65 25.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.6","bw.init"],CustomName:'{"text":"[6] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 6
tag @e[tag=bw.init] remove bw.init

summon minecraft:armor_stand 50.5 65 25.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.7","bw.init"],CustomName:'{"text":"[7] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 7
tag @e[tag=bw.init] remove bw.init

summon minecraft:armor_stand 70.5 65 25.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["bw.pad","bw.pad.8","bw.init"],CustomName:'{"text":"[8] Arrow-50g  Frost-75g  Bomb-100g","color":"yellow"}',CustomNameVisible:1b}
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.pad_id 8
tag @e[tag=bw.init] remove bw.init
