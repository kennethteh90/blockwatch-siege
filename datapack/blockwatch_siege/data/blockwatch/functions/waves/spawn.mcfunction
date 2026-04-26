# blockwatch:waves/spawn
# Called from state/set_combat at wave start. Announces composition.

execute if score #wave bw.wave matches 1  run tellraw @a {"text":"  > Wave 1:  5 Walkers","color":"gray"}
execute if score #wave bw.wave matches 2  run tellraw @a {"text":"  > Wave 2:  4 Walkers + 3 Runners","color":"gray"}
execute if score #wave bw.wave matches 3  run tellraw @a {"text":"  > Wave 3:  3 Walkers + 2 Runners + 1 Brute","color":"gray"}
execute if score #wave bw.wave matches 4  run tellraw @a {"text":"  > Wave 4:  4 Walkers + 4 Runners","color":"gray"}
execute if score #wave bw.wave matches 5  run tellraw @a {"text":"  > Wave 5:  3 Walkers + 3 Runners + 2 Brutes","color":"gray"}
execute if score #wave bw.wave matches 6  run tellraw @a {"text":"  > Wave 6:  6 Runners + 2 Brutes","color":"gray"}
execute if score #wave bw.wave matches 7  run tellraw @a [{"text":"  > Wave 7: ","color":"yellow"},{"text":"DUAL LANE — 4 Walkers + 4 Runners + 3 Brutes","color":"gray"}]
execute if score #wave bw.wave matches 8  run tellraw @a [{"text":"  > Wave 8: ","color":"yellow"},{"text":"DUAL LANE — 5 Runners + 4 Brutes","color":"gray"}]
execute if score #wave bw.wave matches 9  run tellraw @a [{"text":"  > Wave 9: ","color":"yellow"},{"text":"DUAL LANE — 3 Walkers + 5 Runners + 3 Brutes","color":"gray"}]
execute if score #wave bw.wave matches 10 run tellraw @a [{"text":"  > Wave 10: ","color":"red"},{"text":"THE SIEGE — 4 Walkers + 4 Runners + 2 Brutes + 1 BOSS","color":"dark_red","bold":true}]
