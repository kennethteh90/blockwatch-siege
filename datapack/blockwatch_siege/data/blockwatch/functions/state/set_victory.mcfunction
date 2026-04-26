# blockwatch:state/set_victory
# Transition → state 5 (victory). All 10 waves survived.
# tick.mcfunction will auto-return to lobby after the timer runs out.

scoreboard players set #state bw.state 5
scoreboard players operation #timer bw.timer = #t.endgame bw.cfg

title @a times 10 80 30
title @a title {"text":"Victory!","color":"gold","bold":true}
title @a subtitle {"text":"The castle stands — all waves defeated!","color":"yellow"}

tellraw @a [{"text":"[Siege] ","color":"gold"},{"text":"Victory! All waves defeated. Returning to lobby in 10s.","color":"yellow"}]

# Celebratory fireworks at each surviving player
execute as @a at @s run summon minecraft:firework_rocket ~ ~1 ~ {FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Explosions:[{Type:1b,Colors:[I;16711680,16776960],FadeColors:[I;16776960],Flicker:1b}],Flight:2b}}}}
