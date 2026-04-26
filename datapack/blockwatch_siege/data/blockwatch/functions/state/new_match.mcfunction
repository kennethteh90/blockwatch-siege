# blockwatch:state/new_match
# Resets all game state and starts a fresh match.
# Call from lobby via command block, button, or /function directly.

function blockwatch:state/reset_match
tag @a add bw.playing
function blockwatch:map/setup

scoreboard players set #wave     bw.wave  1
scoreboard players set #timer    bw.timer 0

scoreboard players operation @a[tag=bw.playing] bw.gold = #gold.start bw.cfg

# Shared castle HP scales by match size: base HP + bonus per extra participant.
scoreboard players set #players bw.tmp 0
execute as @a[tag=bw.playing] run scoreboard players add #players bw.tmp 1
execute if score #players bw.tmp matches ..0 run scoreboard players set #players bw.tmp 1
scoreboard players operation #castle_hp bw.castle_hp = #players bw.tmp
scoreboard players remove #castle_hp bw.castle_hp 1
scoreboard players operation #castle_hp bw.castle_hp *= #castle.per_player bw.cfg
scoreboard players operation #castle_hp bw.castle_hp += #castle.max bw.cfg

tellraw @a[tag=bw.playing] [
  {"text":"[Siege] ","color":"gold"},
  {"text":"Participants: ","color":"gray"},
  {"score":{"name":"#players","objective":"bw.tmp"},"color":"yellow"},
  {"text":"  Castle HP: ","color":"gray"},
  {"score":{"name":"#castle_hp","objective":"bw.castle_hp"},"color":"green"}
]

function blockwatch:state/set_build
