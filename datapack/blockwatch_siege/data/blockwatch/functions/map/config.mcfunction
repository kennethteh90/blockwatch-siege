# blockwatch:map/config
# ──────────────────────────────────────────────────────────────────────────────
# COORDINATE REFERENCE — edit placeholders in the files listed to move the map.
# Run /function blockwatch:map/config in-game to print a summary to chat.
# ──────────────────────────────────────────────────────────────────────────────
#
# LANE 1 (Z = 0.5)
#  Placeholder          Default value       File(s) to edit
#  Enemy spawn L1       0.5  64  0.5        enemies/spawn/walker|runner|brute|boss
#  Waypoint 1 L1        20.5 64  0.5        enemies/lane1/move
#  Waypoint 2 L1        40.5 64  0.5        enemies/lane1/move
#  Waypoint 3 L1        60.5 64  0.5        enemies/lane1/move
#  Castle / leak L1     80.5 64  0.5        enemies/lane1/move
#
# LANE 2 (Z = 20.5)
#  Enemy spawn L2       0.5  64  20.5       enemies/spawn/walker|runner|brute
#  Waypoint 1 L2        20.5 64  20.5       enemies/lane2/move
#  Waypoint 2 L2        40.5 64  20.5       enemies/lane2/move
#  Waypoint 3 L2        60.5 64  20.5       enemies/lane2/move
#  Castle / leak L2     80.5 64  20.5       enemies/lane2/move
#
# BUILD PADS — 4 per lane, 8 total
#  Pad 1  (L1, near WP1)    10.5 65  -4.5  map/pads
#  Pad 2  (L1, near WP2)    30.5 65  -4.5  map/pads
#  Pad 3  (L1, near WP3)    50.5 65  -4.5  map/pads
#  Pad 4  (L1, near castle) 70.5 65  -4.5  map/pads
#  Pad 5  (L2, near WP1)    10.5 65  25.5  map/pads
#  Pad 6  (L2, near WP2)    30.5 65  25.5  map/pads
#  Pad 7  (L2, near WP3)    50.5 65  25.5  map/pads
#  Pad 8  (L2, near castle) 70.5 65  25.5  map/pads
#
# GAMEPLAY CONSTANTS — all stored in bw.cfg (edit state/setup_scoreboards)
#  Constant          Default   Notes
#  waves.max         10        Victory fires when #wave exceeds this
#  t.build           600       Build phase duration (30 s)
#  t.intermiss       200       Intermission duration (10 s)
#  t.endgame         200       Victory/defeat display before lobby return
#  gold.start        100       Starting gold per player
#  castle.max        20        Starting castle HP
#  reward.base       25g       Flat gold reward each intermission
#  reward.wave       5g/wave   Scales with completed wave number
#  reward.bonus      50g       Flawless (zero-leak) bonus
#  cost.arrow        50g       Arrow Tower placement cost
#  cost.frost        75g       Frost Tower placement cost
#  cost.bomb         100g      Bomb Tower placement cost
#  sell.arrow        35g       Arrow Tower sell refund (~70%)
#  sell.frost        52g       Frost Tower sell refund (~70%)
#  sell.bomb         70g       Bomb Tower sell refund (~70%)
#  rate.arrow        20 ticks  Arrow Tower fire interval (1 s)
#  rate.frost        25 ticks  Frost Tower fire interval (1.25 s)
#  rate.bomb         60 ticks  Bomb Tower fire interval (3 s)
#  frost.dur         60 ticks  Duration enemies stay frozen (3 s)
#  sp.interval       40 ticks  Ticks between each enemy spawn (2 s)
#
# HARDCODED VALUES — require literal numbers in MC 1.20.4; cannot use config scores
#  Arrow range       distance=..8           towers/arrow/attack
#  Arrow damage      damage @s 5            towers/arrow/hit
#  Frost range       distance=..6           towers/frost/attack
#  Frost damage      damage @s 3            towers/frost/hit
#  Bomb range        distance=..10          towers/bomb/attack
#  Bomb AoE damage   damage @s 15           towers/bomb/attack
#  Walker speed      ^0.15/tick             enemies/lane1|2/move
#  Runner speed      ^0.25/tick             enemies/lane1|2/move
#  Brute speed       ^0.08/tick             enemies/lane1|2/move
#  Boss speed        ^0.06/tick             enemies/lane1|2/move
#  WP arrival radius distance=..1.5         enemies/lane1|2/move
# ──────────────────────────────────────────────────────────────────────────────

tellraw @s [{"text":"─── Blockwatch Config ───\n","color":"gold"},{"text":"L1 ","color":"yellow"},{"text":"spawn(0.5,64,0.5) → 20.5 → 40.5 → 60.5 → castle(80.5,64,0.5)\n","color":"gray"},{"text":"L2 ","color":"yellow"},{"text":"spawn(0.5,64,20.5) → 20.5 → 40.5 → 60.5 → castle(80.5,64,20.5)\n","color":"gray"},{"text":"Pads L1 ","color":"aqua"},{"text":"(10.5,65,-4.5) (30.5,65,-4.5) (50.5,65,-4.5) (70.5,65,-4.5)\n","color":"gray"},{"text":"Pads L2 ","color":"aqua"},{"text":"(10.5,65,25.5) (30.5,65,25.5) (50.5,65,25.5) (70.5,65,25.5)\n","color":"gray"},{"text":"Constants ","color":"green"},{"text":"see state/setup_scoreboards (bw.cfg objective)","color":"gray"}]
