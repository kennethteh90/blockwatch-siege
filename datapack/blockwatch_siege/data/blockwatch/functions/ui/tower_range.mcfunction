# blockwatch:ui/tower_range
# Draws a particle ring around each placed tower once per second.
# Called from tick.mcfunction when #ui_tick bw.tmp = 0.
# Bomb L3 uses a larger ring (radius 12 vs 10).

execute as @e[tag=bw.tower.arrow] at @s run function blockwatch:ui/range/arrow
execute as @e[tag=bw.tower.frost] at @s run function blockwatch:ui/range/frost
execute as @e[tag=bw.tower.bomb] unless score @s bw.tower_level matches 3 at @s run function blockwatch:ui/range/bomb
execute as @e[tag=bw.tower.bomb]   if score @s bw.tower_level matches 3 at @s run function blockwatch:ui/range/bomb_l3
