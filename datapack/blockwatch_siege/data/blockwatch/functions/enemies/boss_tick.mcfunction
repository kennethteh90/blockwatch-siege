# blockwatch:enemies/boss_tick
# Context: as = boss entity, at = boss position. Runs every combat tick.
# Counts down bw.cd toward a shockwave every 100 ticks (5 seconds).
# bw.cd is repurposed here — boss entities are not towers, so no collision.

scoreboard players remove @s bw.cd 1
execute if score @s bw.cd matches ..0 at @s run function blockwatch:enemies/boss_shockwave
execute if score @s bw.cd matches ..0 run scoreboard players set @s bw.cd 100
