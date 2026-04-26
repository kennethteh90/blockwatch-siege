# blockwatch:ui/actionbar
# Shows a compact combat HUD on the action bar during state 3 (combat).
# Counts living enemies and shows Wave X/10, enemy count, and castle HP.

execute store result score #enemy_count bw.tmp if entity @e[tag=bw.enemy]

title @a[tag=bw.playing] actionbar [{"text":"Wave ","color":"yellow"},{"score":{"name":"#wave","objective":"bw.wave"},"color":"white"},{"text":"/","color":"dark_gray"},{"score":{"name":"#waves.max","objective":"bw.cfg"},"color":"white"},{"text":"  Enemies: ","color":"gray"},{"score":{"name":"#enemy_count","objective":"bw.tmp"},"color":"red"},{"text":"  Castle: ","color":"gray"},{"score":{"name":"#castle_hp","objective":"bw.castle_hp"},"color":"green"},{"text":" HP","color":"dark_gray"}]
