# blockwatch:state/set_build
# Transition → state 2 (build phase). Duration read from #t.build bw.cfg.

scoreboard players set #state bw.state 2
scoreboard players operation #timer bw.timer = #t.build bw.cfg

title @a[tag=bw.playing] times 5 40 10
title @a[tag=bw.playing] title {"text":"Build Phase","color":"green","bold":true}
title @a[tag=bw.playing] subtitle [{"text":"Wave ","color":"white"},{"score":{"name":"#wave","objective":"bw.wave"},"color":"yellow"},{"text":" — 30 s  |  bw.place 1|2|3  bw.sell 1  bw.upgrade 1","color":"white"}]

tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"Build phase! Place: /trigger bw.place 1 (Arrow 50g)  2 (Frost 75g)  3 (Bomb 100g)","color":"green"}]
tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"Upgrade: /trigger bw.upgrade set 1 (near tower)  |  Sell: /trigger bw.sell set 1","color":"green"}]
tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"Abilities (in combat): /trigger bw.ability set 1 (Airstrike 6s)  set 2 (Freeze 10s)","color":"aqua"}]
function blockwatch:ui/wave_preview
