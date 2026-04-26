# blockwatch:towers/frost/attack_l3
# L3 Frost: range 6 (same), 5 HP damage, 5s freeze.

execute as @e[tag=bw.enemy,sort=nearest,limit=1,distance=..6] run function blockwatch:towers/frost/hit_l3
