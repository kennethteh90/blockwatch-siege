# blockwatch:tick
# Runs every game tick. Routes to all active systems by state.
# State 0 (uninitialized) is a no-op — no branch below matches it.

# ── Build phase (state 2): countdown → combat ─────────────────────────────────
execute if score #state bw.state matches 2 run scoreboard players remove #timer bw.timer 1
execute if score #state bw.state matches 2 if score #timer bw.timer matches ..0 run function blockwatch:state/set_combat

# ── Pad placement trigger (state 2 only) ──────────────────────────────────────
# value 1=Arrow, 2=Frost, 3=Bomb — re-enabled every tick so players can repeat
execute if score #state bw.state matches 2 run scoreboard players enable @a bw.place
execute if score #state bw.state matches 2 as @a if score @s bw.place matches 1.. at @s run function blockwatch:map/pad_interact
execute if score #state bw.state matches 2 as @a if score @s bw.place matches 1.. run scoreboard players reset @s bw.place

# ── Sell trigger (states 2 and 4 — any time between waves) ────────────────────
execute if score #state bw.state matches 2 run scoreboard players enable @a bw.sell
execute if score #state bw.state matches 4 run scoreboard players enable @a bw.sell
execute if score #state bw.state matches 2 as @a if score @s bw.sell matches 1.. at @s run function blockwatch:towers/sell
execute if score #state bw.state matches 4 as @a if score @s bw.sell matches 1.. at @s run function blockwatch:towers/sell
execute if score #state bw.state matches 2 as @a if score @s bw.sell matches 1.. run scoreboard players reset @s bw.sell
execute if score #state bw.state matches 4 as @a if score @s bw.sell matches 1.. run scoreboard players reset @s bw.sell

# ── Upgrade trigger (states 2 and 4 — any time between waves) ─────────────────
execute if score #state bw.state matches 2 run scoreboard players enable @a bw.upgrade
execute if score #state bw.state matches 4 run scoreboard players enable @a bw.upgrade
execute if score #state bw.state matches 2 as @a if score @s bw.upgrade matches 1.. at @s run function blockwatch:towers/upgrade
execute if score #state bw.state matches 4 as @a if score @s bw.upgrade matches 1.. at @s run function blockwatch:towers/upgrade
execute if score #state bw.state matches 2 as @a if score @s bw.upgrade matches 1.. run scoreboard players reset @s bw.upgrade
execute if score #state bw.state matches 4 as @a if score @s bw.upgrade matches 1.. run scoreboard players reset @s bw.upgrade

# ── Combat phase (state 3) ─────────────────────────────────────────────────────
execute if score #state bw.state matches 3 run function blockwatch:waves/spawner
execute if score #state bw.state matches 3 run function blockwatch:towers/tick
execute if score #state bw.state matches 3 run function blockwatch:enemies/tick

# ── Player abilities (state 3 — combat only) ──────────────────────────────────
execute if score #state bw.state matches 3 run scoreboard players enable @a bw.ability
execute if score #state bw.state matches 3 as @a if score @s bw.ability matches 1.. at @s run function blockwatch:abilities/use
execute if score #state bw.state matches 3 as @a if score @s bw.ability matches 1.. run scoreboard players reset @s bw.ability
execute if score #state bw.state matches 3 as @a if score @s bw.airstrike_cd matches 1.. run scoreboard players remove @s bw.airstrike_cd 1
execute if score #state bw.state matches 3 as @a if score @s bw.freeze_cd matches 1.. run scoreboard players remove @s bw.freeze_cd 1

execute if score #state bw.state matches 3 run function blockwatch:waves/check_complete

# ── Intermission (state 4): countdown → next wave or victory ──────────────────
execute if score #state bw.state matches 4 run scoreboard players remove #timer bw.timer 1
# Advance wave counter when timer hits zero; then branch on whether waves are exhausted
execute if score #state bw.state matches 4 if score #timer bw.timer matches ..0 run scoreboard players add #wave bw.wave 1
execute if score #state bw.state matches 4 if score #timer bw.timer matches ..0 if score #wave bw.wave > #waves.max bw.cfg run function blockwatch:state/set_victory
execute if score #state bw.state matches 4 if score #timer bw.timer matches ..0 unless score #wave bw.wave > #waves.max bw.cfg run function blockwatch:state/set_build

# ── End-game auto-return to lobby (states 5 and 6) ────────────────────────────
execute if score #state bw.state matches 5..6 run scoreboard players remove #timer bw.timer 1
execute if score #state bw.state matches 5..6 if score #timer bw.timer matches ..0 run function blockwatch:state/set_lobby

# ── Defeat condition ────────────────────────────────────────────────────────────
execute if score #state bw.state matches 2..4 if score #castle_hp bw.castle_hp matches ..0 run function blockwatch:state/set_defeat

# ── HUD ────────────────────────────────────────────────────────────────────────
execute if score #state bw.state matches 1.. run function blockwatch:ui/sidebar
execute if score #state bw.state matches 3 run function blockwatch:ui/actionbar

# ── Tower range rings (once per second in states 2–4) ─────────────────────────
execute if score #state bw.state matches 2..4 run scoreboard players add #ui_tick bw.tmp 1
execute if score #ui_tick bw.tmp matches 20.. run scoreboard players set #ui_tick bw.tmp 0
execute if score #ui_tick bw.tmp matches 0 if score #state bw.state matches 2..4 run function blockwatch:ui/tower_range
