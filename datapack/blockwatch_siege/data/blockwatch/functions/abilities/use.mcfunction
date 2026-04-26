# blockwatch:abilities/use
# Context: as = player, at = player. Dispatches to the chosen ability.
# bw.ability 1 = Airstrike, 2 = Freeze burst.

execute if score @s bw.ability matches 1 run function blockwatch:abilities/airstrike
execute if score @s bw.ability matches 2 run function blockwatch:abilities/freeze
