# blockwatch:towers/arrow/attack
# Context: as = tower, at = tower position (inherited from arrow/tick).
# Targets the nearest enemy within 8 blocks and deals 5 HP (2.5 hearts) of arrow damage.
# Range: 8 blocks  ← PLACEHOLDER: edit distance=..8 to change
# Damage: 5 HP     ← PLACEHOLDER: edit the literal 5 below to change

# Switch to the target enemy so @s refers to it — avoids double selector evaluation
execute as @e[tag=bw.enemy,sort=nearest,limit=1,distance=..8] run function blockwatch:towers/arrow/hit
