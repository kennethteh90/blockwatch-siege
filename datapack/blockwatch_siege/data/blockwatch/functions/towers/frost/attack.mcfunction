# blockwatch:towers/frost/attack
# Context: as = Frost Tower, at = tower position.
# Range: 6 blocks  ← PLACEHOLDER: edit distance=..6 to change

execute as @e[tag=bw.enemy,sort=nearest,limit=1,distance=..6] run function blockwatch:towers/frost/hit
