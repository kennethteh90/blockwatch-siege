# blockwatch:enemies/debuff_tick
# Context: as = enemy entity.
# Decrements frost slow countdown; removes bw.frozen when it expires.

execute if entity @s[tag=bw.frozen] run scoreboard players remove @s bw.slow 1
execute if entity @s[tag=bw.frozen] if score @s bw.slow matches ..0 run tag @s remove bw.frozen
