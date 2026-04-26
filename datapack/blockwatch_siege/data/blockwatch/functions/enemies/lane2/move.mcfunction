# blockwatch:enemies/lane2/move
# Z = 20.5 path: spawn(0.5,64,20.5) → WP1(20.5) → WP2(40.5) → WP3(60.5) → castle(80.5,64,20.5)
# Speeds (blocks/tick): walker 0.15 | runner 0.25 | brute 0.08 | boss 0.06

# ── Walker (type 1) ───────────────────────────────────────────────────────────
execute if score @s bw.enemy_type matches 1 if score @s bw.wp matches 1 facing 20.5 64.0 20.5 run tp @s ^ ^ ^0.15
execute if score @s bw.enemy_type matches 1 if score @s bw.wp matches 2 facing 40.5 64.0 20.5 run tp @s ^ ^ ^0.15
execute if score @s bw.enemy_type matches 1 if score @s bw.wp matches 3 facing 60.5 64.0 20.5 run tp @s ^ ^ ^0.15
execute if score @s bw.enemy_type matches 1 if score @s bw.wp matches 4 facing 80.5 64.0 20.5 run tp @s ^ ^ ^0.15

# ── Runner (type 2) ───────────────────────────────────────────────────────────
execute if score @s bw.enemy_type matches 2 if score @s bw.wp matches 1 facing 20.5 64.0 20.5 run tp @s ^ ^ ^0.25
execute if score @s bw.enemy_type matches 2 if score @s bw.wp matches 2 facing 40.5 64.0 20.5 run tp @s ^ ^ ^0.25
execute if score @s bw.enemy_type matches 2 if score @s bw.wp matches 3 facing 60.5 64.0 20.5 run tp @s ^ ^ ^0.25
execute if score @s bw.enemy_type matches 2 if score @s bw.wp matches 4 facing 80.5 64.0 20.5 run tp @s ^ ^ ^0.25

# ── Brute (type 3) ────────────────────────────────────────────────────────────
execute if score @s bw.enemy_type matches 3 if score @s bw.wp matches 1 facing 20.5 64.0 20.5 run tp @s ^ ^ ^0.08
execute if score @s bw.enemy_type matches 3 if score @s bw.wp matches 2 facing 40.5 64.0 20.5 run tp @s ^ ^ ^0.08
execute if score @s bw.enemy_type matches 3 if score @s bw.wp matches 3 facing 60.5 64.0 20.5 run tp @s ^ ^ ^0.08
execute if score @s bw.enemy_type matches 3 if score @s bw.wp matches 4 facing 80.5 64.0 20.5 run tp @s ^ ^ ^0.08

# ── Boss (type 4) ─────────────────────────────────────────────────────────────
execute if score @s bw.enemy_type matches 4 if score @s bw.wp matches 1 facing 20.5 64.0 20.5 run tp @s ^ ^ ^0.06
execute if score @s bw.enemy_type matches 4 if score @s bw.wp matches 2 facing 40.5 64.0 20.5 run tp @s ^ ^ ^0.06
execute if score @s bw.enemy_type matches 4 if score @s bw.wp matches 3 facing 60.5 64.0 20.5 run tp @s ^ ^ ^0.06
execute if score @s bw.enemy_type matches 4 if score @s bw.wp matches 4 facing 80.5 64.0 20.5 run tp @s ^ ^ ^0.06

# ── Waypoint arrival (1.5-block radius) ──────────────────────────────────────
execute if score @s bw.wp matches 1 positioned 20.5 64 20.5 if entity @s[distance=..1.5] run scoreboard players add @s bw.wp 1
execute if score @s bw.wp matches 2 positioned 40.5 64 20.5 if entity @s[distance=..1.5] run scoreboard players add @s bw.wp 1
execute if score @s bw.wp matches 3 positioned 60.5 64 20.5 if entity @s[distance=..1.5] run scoreboard players add @s bw.wp 1

# ── Leak at castle ────────────────────────────────────────────────────────────
execute if score @s bw.wp matches 4 positioned 80.5 64 20.5 if entity @s[distance=..1.5] run function blockwatch:enemies/leak
