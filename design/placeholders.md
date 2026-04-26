# Blockwatch: Siege — Placeholder Coordinates & Hardcoded Values

All values listed here cannot be changed via `bw.cfg` scoreboards — they are literal numbers
embedded directly in command syntax. Edit the files listed below to relocate the map or
tune values that are not exposed through the config system.

Run `/function blockwatch:map/config` in-game to see the current values printed to chat.

---

## Spawn Points

Enemy spawn positions. One set per lane, one per enemy type (all share the same spawn point within a lane).

| Lane | X | Y | Z | Files |
|------|---|---|---|-------|
| Lane 1 | 0.5 | 64 | 0.5 | `enemies/spawn/walker.mcfunction` line 5 |
| Lane 1 | 0.5 | 64 | 0.5 | `enemies/spawn/runner.mcfunction` line 5 |
| Lane 1 | 0.5 | 64 | 0.5 | `enemies/spawn/brute.mcfunction` line 5 |
| Lane 1 | 0.5 | 64 | 0.5 | `enemies/spawn/boss.mcfunction` line 4 |
| Lane 2 | 0.5 | 64 | 20.5 | `enemies/spawn/walker.mcfunction` line 6 |
| Lane 2 | 0.5 | 64 | 20.5 | `enemies/spawn/runner.mcfunction` line 6 |
| Lane 2 | 0.5 | 64 | 20.5 | `enemies/spawn/brute.mcfunction` line 6 |

> The Boss always spawns in lane 1 and ignores `#sp_lane`.

---

## Lane Waypoints

Enemies advance through 4 waypoints. WP4 is the castle — reaching it calls `enemies/leak`.

### Lane 1 (Z = 0.5)

| Waypoint | X | Y | Z | Purpose | Files |
|----------|---|---|---|---------|-------|
| WP1 | 20.5 | 64 | 0.5 | Turn/checkpoint | `enemies/lane1/move.mcfunction` lines 6–27, 30 |
| WP2 | 40.5 | 64 | 0.5 | Turn/checkpoint | `enemies/lane1/move.mcfunction` lines 6–27, 31 |
| WP3 | 60.5 | 64 | 0.5 | Turn/checkpoint | `enemies/lane1/move.mcfunction` lines 6–27, 32 |
| WP4 (castle) | 80.5 | 64 | 0.5 | Leak trigger | `enemies/lane1/move.mcfunction` line 35 |

### Lane 2 (Z = 20.5)

| Waypoint | X | Y | Z | Purpose | Files |
|----------|---|---|---|---------|-------|
| WP1 | 20.5 | 64 | 20.5 | Turn/checkpoint | `enemies/lane2/move.mcfunction` lines 6–27, 30 |
| WP2 | 40.5 | 64 | 20.5 | Turn/checkpoint | `enemies/lane2/move.mcfunction` lines 6–27, 31 |
| WP3 | 60.5 | 64 | 20.5 | Turn/checkpoint | `enemies/lane2/move.mcfunction` lines 6–27, 32 |
| WP4 (castle) | 80.5 | 64 | 20.5 | Leak trigger | `enemies/lane2/move.mcfunction` line 35 |

---

## Build Pad Positions

Armor stands that mark valid tower placement locations.

| Pad ID | X | Y | Z | Lane | File |
|--------|---|---|---|------|------|
| 1 | 10.5 | 65 | -4.5 | Lane 1 | `map/pads.mcfunction` line 9 |
| 2 | 30.5 | 65 | -4.5 | Lane 1 | `map/pads.mcfunction` line 13 |
| 3 | 50.5 | 65 | -4.5 | Lane 1 | `map/pads.mcfunction` line 17 |
| 4 | 70.5 | 65 | -4.5 | Lane 1 | `map/pads.mcfunction` line 21 |
| 5 | 10.5 | 65 | 25.5 | Lane 2 | `map/pads.mcfunction` line 26 |
| 6 | 30.5 | 65 | 25.5 | Lane 2 | `map/pads.mcfunction` line 30 |
| 7 | 50.5 | 65 | 25.5 | Lane 2 | `map/pads.mcfunction` line 34 |
| 8 | 70.5 | 65 | 25.5 | Lane 2 | `map/pads.mcfunction` line 38 |

---

## Hardcoded Selector Literals

Values embedded inside selector arguments or `/damage` commands — cannot be read from scoreboards in MC 1.20.4.

### Tower Ranges (`distance=..N`)

| Tower | Range (blocks) | Literal | File |
|-------|---------------|---------|------|
| Arrow | 8 | `distance=..8` | `towers/arrow/attack.mcfunction` line 8 |
| Frost | 6 | `distance=..6` | `towers/frost/attack.mcfunction` line 5 |
| Bomb | 10 | `distance=..10` | `towers/bomb/attack.mcfunction` line 8 |

### Tower Damage (`damage @s N`)

| Tower | Damage (HP) | Literal | File |
|-------|------------|---------|------|
| Arrow | 5 | `damage @s 5` | `towers/arrow/hit.mcfunction` |
| Frost | 3 | `damage @s 3` | `towers/frost/hit.mcfunction` |
| Bomb | 15 | `damage @s 15` | `towers/bomb/attack.mcfunction` line 8 |

### Enemy Speeds (`tp @s ^ ^ ^N`)

| Enemy | Speed (blocks/tick) | Literal | File |
|-------|--------------------|---------|----|
| Walker | 0.15 | `^0.15` | `enemies/lane1/move.mcfunction`, `enemies/lane2/move.mcfunction` |
| Runner | 0.25 | `^0.25` | `enemies/lane1/move.mcfunction`, `enemies/lane2/move.mcfunction` |
| Brute | 0.08 | `^0.08` | `enemies/lane1/move.mcfunction`, `enemies/lane2/move.mcfunction` |
| Boss | 0.06 | `^0.06` | `enemies/lane1/move.mcfunction`, `enemies/lane2/move.mcfunction` |

### Interaction Radii

| Interaction | Radius | Literal | File |
|-------------|--------|---------|------|
| Pad detection (place) | 4 blocks | `distance=..4` | `map/pad_interact.mcfunction` lines 2–6 |
| Tower detection (sell) | 4 blocks | `distance=..4` | `towers/sell.mcfunction` line 4 |
| Pad de-occupation (sell) | 2 blocks | `distance=..2` | `towers/do_sell.mcfunction` lines 4–5 |
| Waypoint arrival | 1.5 blocks | `distance=..1.5` | `enemies/lane1/move.mcfunction` lines 30–35, `enemies/lane2/move.mcfunction` lines 30–35 |

---

## Config-Driven Values (NOT placeholders)

These values ARE tuneable without editing mcfunction files — change them in `state/setup_scoreboards.mcfunction` under the `bw.cfg` section.

| Constant | Fake Player | Default | Meaning |
|----------|-------------|---------|---------|
| Max waves | `#waves.max` | 10 | Number of waves before victory |
| Build phase | `#t.build` | 600 ticks (30 s) | Build window duration |
| Intermission | `#t.intermiss` | 200 ticks (10 s) | Rest between waves |
| End screen | `#t.endgame` | 200 ticks (10 s) | Victory/defeat display time |
| Starting gold | `#gold.start` | 100g | Gold each player starts with |
| Castle HP | `#castle.max` | 20 | Starting castle hit points |
| Base reward | `#reward.base` | 25g | Gold awarded each intermission |
| Wave bonus | `#reward.wave` | 5g | Additional gold × wave number |
| Flawless bonus | `#reward.bonus` | 50g | Extra gold for zero-leak wave |
| Arrow cost | `#cost.arrow` | 50g | Place cost |
| Frost cost | `#cost.frost` | 75g | Place cost |
| Bomb cost | `#cost.bomb` | 100g | Place cost |
| Arrow sell | `#sell.arrow` | 35g | Sell refund |
| Frost sell | `#sell.frost` | 52g | Sell refund |
| Bomb sell | `#sell.bomb` | 70g | Sell refund |
| Arrow rate | `#rate.arrow` | 20 ticks (1 s) | Attack cooldown |
| Frost rate | `#rate.frost` | 25 ticks (1.25 s) | Attack cooldown |
| Bomb rate | `#rate.bomb` | 60 ticks (3 s) | Attack cooldown |
| Frost duration | `#frost.dur` | 60 ticks (3 s) | How long frost slow lasts |
| Spawn interval | `#sp.interval` | 40 ticks (2 s) | Ticks between enemy spawns |
