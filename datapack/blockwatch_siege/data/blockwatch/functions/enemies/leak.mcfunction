# blockwatch:enemies/leak
# Context: as = enemy that reached the castle.
# Reduces castle HP, records the leak for flawless bonus check, kills the enemy.

scoreboard players remove #castle_hp  bw.castle_hp 1
scoreboard players add    #wave_leaks bw.tmp        1

tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"An enemy breached the castle! HP: ","color":"red"},{"score":{"name":"#castle_hp","objective":"bw.castle_hp"},"color":"white"}]

kill @s
