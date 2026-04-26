# blockwatch:map/pad_interact
# Runs as the triggering player (at their position) during build phase.
# bw.place trigger value: 1=Arrow Tower, 2=Frost Tower, 3=Bomb Tower.

# Guard: must be near an empty pad to do anything
execute unless entity @e[tag=bw.pad,tag=!bw.occupied,distance=..4] run tellraw @s {"text":"[Siege] Stand within 4 blocks of an empty pad (yellow label) to build.","color":"red"}
execute unless entity @e[tag=bw.pad,tag=!bw.occupied,distance=..4] run return 0

tag @s add bw.placing

# Arrow Tower (value 1, 50g) ← PLACEHOLDER cost matches #cost.arrow bw.cfg
execute if score @s bw.place matches 1 unless score #gold bw.gold >= #cost.arrow bw.cfg run tellraw @s {"text":"[Siege] Team bank is too low. Arrow Tower costs 50g.","color":"red"}
execute if score @s bw.place matches 1 if score #gold bw.gold >= #cost.arrow bw.cfg as @e[tag=bw.pad,tag=!bw.occupied,sort=nearest,limit=1,distance=..4] run function blockwatch:towers/arrow/place

# Frost Tower (value 2, 75g)
execute if score @s bw.place matches 2 unless score #gold bw.gold >= #cost.frost bw.cfg run tellraw @s {"text":"[Siege] Team bank is too low. Frost Tower costs 75g.","color":"red"}
execute if score @s bw.place matches 2 if score #gold bw.gold >= #cost.frost bw.cfg as @e[tag=bw.pad,tag=!bw.occupied,sort=nearest,limit=1,distance=..4] run function blockwatch:towers/frost/place

# Bomb Tower (value 3, 100g)
execute if score @s bw.place matches 3 unless score #gold bw.gold >= #cost.bomb bw.cfg run tellraw @s {"text":"[Siege] Team bank is too low. Bomb Tower costs 100g.","color":"red"}
execute if score @s bw.place matches 3 if score #gold bw.gold >= #cost.bomb bw.cfg as @e[tag=bw.pad,tag=!bw.occupied,sort=nearest,limit=1,distance=..4] run function blockwatch:towers/bomb/place

tag @s remove bw.placing
