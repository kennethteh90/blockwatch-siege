# Map Customization Guide

Every coordinate in Blockwatch: Siege is a PLACEHOLDER. This guide lists exactly which files to edit to relocate any part of the map.

Run `/function blockwatch:map/config` in-game to print a summary of all current values.

---

## Step 1 — Lane Paths

Each lane is a straight path with 3 waypoints and a castle/leak zone at the end.

**Lane 1** — edit `enemies/lane1/move.mcfunction`
- Waypoint 1: `facing 20.5 64.0 0.5` (×4 lines, one per enemy type)
- Waypoint 2: `facing 40.5 64.0 0.5`
- Waypoint 3: `facing 60.5 64.0 0.5`
- Castle: `facing 80.5 64.0 0.5` (×4 lines)
- Arrival checks: `positioned 20.5 64 0.5`, `40.5 64 0.5`, `60.5 64 0.5`
- Leak check: `positioned 80.5 64 0.5`

**Lane 2** — edit `enemies/lane2/move.mcfunction` (same structure, Z=20.5)

---

## Step 2 — Enemy Spawn Points

Edit `enemies/spawn/walker.mcfunction`, `runner.mcfunction`, `brute.mcfunction`:
```
execute if score #sp_lane bw.tmp matches 1 run summon ... 0.5 64 0.5 ...
execute if score #sp_lane bw.tmp matches 2 run summon ... 0.5 64 20.5 ...
```
The boss (`enemies/spawn/boss.mcfunction`) always spawns in lane 1.

---

## Step 3 — Build Pads

Edit `map/pads.mcfunction`. Each pad is an armor stand summon with coordinates:

| Pad | Default Position   |
|-----|--------------------|
| 1   | 10.5  65  -4.5     |
| 2   | 30.5  65  -4.5     |
| 3   | 50.5  65  -4.5     |
| 4   | 70.5  65  -4.5     |
| 5   | 10.5  65  25.5     |
| 6   | 30.5  65  25.5     |
| 7   | 50.5  65  25.5     |
| 8   | 70.5  65  25.5     |

Players must stand within 4 blocks of a pad to build (see `map/pad_interact.mcfunction`, `distance=..4`).

---

## Step 4 — Gameplay Constants

All tunable values live in `state/setup_scoreboards.mcfunction` under the `bw.cfg` section. Edit the `scoreboard players set` lines:

```mcfunction
scoreboard players set #waves.max    bw.cfg 10    # change total wave count
scoreboard players set #t.build      bw.cfg 600   # build phase ticks (600 = 30s)
scoreboard players set #cost.arrow   bw.cfg 50    # Arrow Tower cost
# ... etc
```

Changes take effect on the next `/reload`.

---

## Step 5 — Hardcoded Values

These require editing the literal number directly in the listed file:

| Value            | File                        | What to change              |
|------------------|-----------------------------|-----------------------------|
| Arrow range      | `towers/arrow/attack.mcfunction` | `distance=..8`         |
| Arrow damage     | `towers/arrow/hit.mcfunction`    | `damage @s 5`          |
| Frost range      | `towers/frost/attack.mcfunction` | `distance=..6`         |
| Frost damage     | `towers/frost/hit.mcfunction`    | `damage @s 3`          |
| Bomb range       | `towers/bomb/attack.mcfunction`  | `distance=..10`        |
| Bomb AoE damage  | `towers/bomb/attack.mcfunction`  | `damage @s 15`         |
| Walker speed     | `enemies/lane1/move.mcfunction`  | `^0.15` (×4 lines)     |
| Runner speed     | `enemies/lane1/move.mcfunction`  | `^0.25` (×4 lines)     |
| Brute speed      | `enemies/lane1/move.mcfunction`  | `^0.08` (×4 lines)     |
| Boss speed       | `enemies/lane1/move.mcfunction`  | `^0.06` (×4 lines)     |
| WP arrival radius| `enemies/lane1/move.mcfunction`  | `distance=..1.5` (×3)  |
| Pad reach radius | `map/pad_interact.mcfunction`    | `distance=..4` (×3)    |
| Sell reach radius| `towers/sell.mcfunction`         | `distance=..4`         |
| Pad un-occupy    | `towers/do_sell.mcfunction`      | `distance=..2`         |

Repeat lane1 changes in `enemies/lane2/move.mcfunction`.

---

## Adding a Third Lane

1. Create `enemies/lane3/move.mcfunction` (copy lane2, change Z coordinate)
2. Add lane 3 spawn variants in each `enemies/spawn/*.mcfunction`
3. Add 4 more pads in `map/pads.mcfunction`
4. Set `#sp_lane bw.tmp 3` in wave files for the new lane's enemies
5. Add `execute if score @s bw.lane matches 3 run function blockwatch:enemies/lane3/move` in `enemies/move.mcfunction`
