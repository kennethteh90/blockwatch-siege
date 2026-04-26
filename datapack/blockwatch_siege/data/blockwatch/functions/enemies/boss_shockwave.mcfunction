# blockwatch:enemies/boss_shockwave
# Context: at = boss position.
# Fires a shockwave: visual burst + delays all towers within 6 blocks by 20 ticks.
# Lane 1 pad towers are ~5 blocks from the lane center — they are in range.
# Lane 2 towers (~25 blocks away on Z) are never in range. Spread towers to stay safe.

particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1
particle minecraft:cloud             ~ ~0.5 ~ 3 0 3 0.05 50

execute as @e[tag=bw.tower,distance=..6] run scoreboard players add @s bw.cd 20

tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"Boss shockwave! ","color":"red","bold":true},{"text":"Nearby towers disrupted for 1s.","color":"red"}]
