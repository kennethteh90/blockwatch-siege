# blockwatch:ui/wave_preview
# Called once from set_build to show the upcoming wave composition in chat.
# #wave already holds the next wave number when build phase starts.

execute if score #wave bw.wave matches 1  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 1: ","color":"yellow"},{"text":"5× Walker","color":"green"},{"text":"  │ Lane 1","color":"gray"}]
execute if score #wave bw.wave matches 2  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 2: ","color":"yellow"},{"text":"4× Walker · 3× Runner","color":"green"},{"text":"  │ Lane 1","color":"gray"}]
execute if score #wave bw.wave matches 3  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 3: ","color":"yellow"},{"text":"3× Walker · 2× Runner · 1× Brute","color":"green"},{"text":"  │ Lane 1","color":"gray"}]
execute if score #wave bw.wave matches 4  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 4: ","color":"yellow"},{"text":"4× Walker · 4× Runner","color":"green"},{"text":"  │ Lane 1","color":"gray"}]
execute if score #wave bw.wave matches 5  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 5: ","color":"yellow"},{"text":"3× Walker · 3× Runner · 2× Brute","color":"green"},{"text":"  │ Lane 1","color":"gray"}]
execute if score #wave bw.wave matches 6  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 6: ","color":"yellow"},{"text":"6× Runner · 2× Brute","color":"green"},{"text":"  │ Lane 1","color":"gray"}]
execute if score #wave bw.wave matches 7  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 7: ","color":"yellow"},{"text":"4× Walker · 4× Runner · 3× Brute","color":"green"},{"text":"  │ Dual lane","color":"gray"}]
execute if score #wave bw.wave matches 8  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 8: ","color":"yellow"},{"text":"5× Runner · 4× Brute","color":"green"},{"text":"  │ Dual lane","color":"gray"}]
execute if score #wave bw.wave matches 9  run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ Wave 9: ","color":"yellow"},{"text":"3× Walker · 5× Runner · 3× Brute","color":"green"},{"text":"  │ Dual lane","color":"gray"}]
execute if score #wave bw.wave matches 10 run tellraw @a[tag=bw.playing] [{"text":"[Siege] ","color":"gold"},{"text":"▼ FINAL WAVE 10: ","color":"red","bold":true},{"text":"4× Walker · 4× Runner · 2× Brute · ","color":"green"},{"text":"BOSS","color":"dark_red","bold":true},{"text":"  │ Dual lane","color":"gray"}]
