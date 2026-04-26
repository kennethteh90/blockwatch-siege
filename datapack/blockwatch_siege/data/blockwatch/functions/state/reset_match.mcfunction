# blockwatch:state/reset_match
# Clears active match entities and transient scores without changing the next state.
# Safe to call before load, before new_match, or from debug/reset.

kill @e[tag=bw.enemy]
kill @e[tag=bw.tower]
kill @e[tag=bw.pad]

clear @a minecraft:nether_star{display:{Name:'{"text":"Wave Token","color":"yellow","italic":false}',Lore:['{"text":"Use to launch the next wave","color":"gray","italic":false}']}}

scoreboard players set #wave       bw.wave      0
scoreboard players set #castle_hp  bw.castle_hp 0
scoreboard players set #timer      bw.timer     0
scoreboard players set #sp_idx     bw.tmp       0
scoreboard players set #sp_cd      bw.tmp       0
scoreboard players set #sp_done    bw.tmp       0
scoreboard players set #sp_lane    bw.tmp       1
scoreboard players set #wave_leaks bw.tmp       0
scoreboard players set #ui_tick    bw.tmp       0
scoreboard players set @a bw.gold          0
scoreboard players set @a bw.airstrike_cd  0
scoreboard players set @a bw.freeze_cd     0
scoreboard players reset @a bw.board

scoreboard players reset @a bw.place
scoreboard players reset @a bw.sell
scoreboard players reset @a bw.upgrade
scoreboard players reset @a bw.ability

tag @a remove bw.playing
tag @a remove bw.placing
tag @a remove bw.selling
tag @a remove bw.upgrading
