# blockwatch:state/setup_scoreboards
# Registers every bw.* objective.
# `add` is a no-op when an objective already exists — harmless on /reload.

# ── Game data ─────────────────────────────────────────────────────────────────
scoreboard objectives add bw.gold        dummy "Gold"
scoreboard objectives add bw.wave        dummy "Wave"
scoreboard objectives add bw.castle_hp   dummy "Castle HP"
scoreboard objectives add bw.state       dummy "State"
scoreboard objectives add bw.timer       dummy "Timer"

# ── Entity metadata ───────────────────────────────────────────────────────────
scoreboard objectives add bw.pad_id      dummy "Pad ID"
scoreboard objectives add bw.tower_type  dummy "Tower Type"
scoreboard objectives add bw.tower_level dummy "Tower Level"
scoreboard objectives add bw.enemy_type  dummy "Enemy Type"
scoreboard objectives add bw.lane        dummy "Lane"
scoreboard objectives add bw.wp          dummy "Waypoint"
scoreboard objectives add bw.cd          dummy "Cooldown"
scoreboard objectives add bw.slow        dummy "Slow Ticks"

# ── Scratch space ──────────────────────────────────────────────────────────────
scoreboard objectives add bw.tmp         dummy "Tmp"

# ── Interaction triggers ───────────────────────────────────────────────────────
scoreboard objectives add bw.place       trigger "Place Tower"
scoreboard objectives add bw.sell        trigger "Sell Tower"
scoreboard objectives add bw.upgrade      trigger "Upgrade Tower"
scoreboard objectives add bw.ability     trigger "Ability"
scoreboard objectives add bw.hp          dummy   "HP"
scoreboard objectives add bw.airstrike_cd dummy  "Airstrike CD"
scoreboard objectives add bw.freeze_cd   dummy   "Freeze CD"

# ── Centralized config (all gameplay constants in one place) ───────────────────
scoreboard objectives add bw.cfg         dummy "Config"

# Total waves
scoreboard players set #waves.max    bw.cfg 10

# Phase durations (ticks)
scoreboard players set #t.build      bw.cfg 600
scoreboard players set #t.intermiss  bw.cfg 200
scoreboard players set #t.endgame    bw.cfg 200

# Starting values
scoreboard players set #gold.start   bw.cfg 100
scoreboard players set #castle.max   bw.cfg 20

# Between-wave gold: base + (reward.wave * wave_number)
scoreboard players set #reward.base  bw.cfg 25
scoreboard players set #reward.wave  bw.cfg 5
# Flawless bonus (no leaks that wave)
scoreboard players set #reward.bonus bw.cfg 50

# Tower costs (gold)
scoreboard players set #cost.arrow   bw.cfg 50
scoreboard players set #cost.frost   bw.cfg 75
scoreboard players set #cost.bomb    bw.cfg 100

# Tower sell refunds (~70% of cost)
scoreboard players set #sell.arrow   bw.cfg 35
scoreboard players set #sell.frost   bw.cfg 52
scoreboard players set #sell.bomb    bw.cfg 70

# Tower attack intervals (ticks); fire-rate and range literals stay hardcoded in attack files
scoreboard players set #rate.arrow   bw.cfg 20
scoreboard players set #rate.frost   bw.cfg 25
scoreboard players set #rate.bomb    bw.cfg 60

# Frost slow duration (ticks)
scoreboard players set #frost.dur    bw.cfg 60

# Ticks between each enemy spawn
scoreboard players set #sp.interval  bw.cfg 40

# Kill-gold rewards (per enemy type on death)
scoreboard players set #reward.walker bw.cfg  4
scoreboard players set #reward.runner bw.cfg  7
scoreboard players set #reward.brute  bw.cfg 15
scoreboard players set #reward.boss   bw.cfg 40

# Tower upgrade costs (gold)
scoreboard players set #upg.cost.1    bw.cfg 30
scoreboard players set #upg.cost.2    bw.cfg 50

# Level 2 attack rates (ticks)
scoreboard players set #rate.arrow.2  bw.cfg 14
scoreboard players set #rate.frost.2  bw.cfg 18
scoreboard players set #rate.bomb.2   bw.cfg 45

# Level 3 attack rates (ticks)
scoreboard players set #rate.arrow.3  bw.cfg 10
scoreboard players set #rate.frost.3  bw.cfg 12
scoreboard players set #rate.bomb.3   bw.cfg 30

# Level 3 frost slow duration (ticks) — longer than base #frost.dur
scoreboard players set #frost.dur.3   bw.cfg 100

# Level-aware sell refunds (~70% of all invested gold per level)
scoreboard players set #sell.arrow.2  bw.cfg 56
scoreboard players set #sell.arrow.3  bw.cfg 91
scoreboard players set #sell.frost.2  bw.cfg 73
scoreboard players set #sell.frost.3  bw.cfg 108
scoreboard players set #sell.bomb.2   bw.cfg 91
scoreboard players set #sell.bomb.3   bw.cfg 126

# Player ability cooldowns (ticks)
scoreboard players set #cd.airstrike  bw.cfg 120
scoreboard players set #cd.freeze     bw.cfg 200

# ── Sidebar display objective ──────────────────────────────────────────────────
scoreboard objectives add bw.board       dummy "§6Blockwatch: Siege"
scoreboard objectives setdisplay sidebar bw.board

# ── Initialize global fake-player values ───────────────────────────────────────
scoreboard players set #state     bw.state     0
scoreboard players set #wave      bw.wave      0
scoreboard players set #castle_hp bw.castle_hp 0
scoreboard players set #timer     bw.timer     0
