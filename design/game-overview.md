# Blockwatch: Siege — Game Overview

## Concept

Wave-based tower defense for 1-4 players on a Minecraft Java Edition map. Players spend gold to place towers on fixed pads during build phases, then defend a castle across 10 escalating waves. A boss ravager appears on wave 10.

## Core Loop

```
new_match
  └─ set_build (30s)       ← /trigger bw.place 1|2|3   /trigger bw.sell 1
       └─ set_combat        ← enemies march; towers auto-attack
            └─ check_complete (all enemies dead + wave fully spawned)
                 └─ set_intermission (10s) ← gold reward; flawless +50g
                      ├─ set_build (if wave ≤ 10)  ────────────────────┐
                      └─ set_victory (if wave > 10) ────────────────────┘
            set_defeat (castle HP ≤ 0, checked every tick)
```

## Map Layout

### Two Parallel Lanes

```
[Spawn] ──→ WP1 ──→ WP2 ──→ WP3 ──→ [Castle]   LANE 1  Z = 0.5
[Spawn] ──→ WP1 ──→ WP2 ──→ WP3 ──→ [Castle]   LANE 2  Z = 20.5
                                      X = 80.5
```

- Default waypoints at X = 20.5, 40.5, 60.5 (configurable in lane1|2/move)
- 4 build pads per lane, 8 total
- Enemies navigate via `tp ^ ^ ^speed` toward waypoints; no pathfinding

### Three Tower Types

| Tower  | Trigger | Cost  | Range | DMG       | Rate   |
|--------|---------|-------|-------|-----------|--------|
| Arrow  | 1       | 50g   | 8 blk | 5 HP      | 1 s    |
| Frost  | 2       | 75g   | 6 blk | 3 HP      | 1.25 s |
| Bomb   | 3       | 100g  | 10 blk| 15 HP AoE | 3 s    |

### Four Enemy Types

| Enemy  | HP  | Speed     | First Wave | Lane       |
|--------|-----|-----------|------------|------------|
| Walker | 20  | 0.15 b/t  | 1          | Any        |
| Runner | 15  | 0.25 b/t  | 2          | Any        |
| Brute  | 100 | 0.08 b/t  | 3          | Any        |
| Boss   | 200 | 0.06 b/t  | 10         | Lane 1     |

## State Machine

| State | Name         | Description                           |
|-------|--------------|---------------------------------------|
| 0     | Uninit       | No-op; scoreboards not yet set up     |
| 1     | Lobby        | Waiting for `new_match` call          |
| 2     | Build        | Tower placement window (30 s)         |
| 3     | Combat       | Enemies spawning; towers firing       |
| 4     | Intermission | Rest between waves (10 s); gold given |
| 5     | Victory      | All 10 waves cleared                  |
| 6     | Defeat       | Castle HP hit 0                       |

## Scoreboard Reference

| Objective      | Purpose                                          |
|----------------|--------------------------------------------------|
| `bw.state`     | FSM state (fake player `#state`)                 |
| `bw.wave`      | Current wave number                              |
| `bw.castle_hp` | Remaining castle HP (`#castle_hp`)               |
| `bw.timer`     | Countdown ticks for phase durations              |
| `bw.gold`      | Per-player gold balance                          |
| `bw.cfg`       | All gameplay constants (fake players)            |
| `bw.tmp`       | Scratch space: spawner state, leak counter       |
| `bw.place`     | Trigger: place tower (1=Arrow, 2=Frost, 3=Bomb)  |
| `bw.sell`      | Trigger: sell nearest tower (value 1)            |
| `bw.tower_type`| Tower identity score (1/2/3)                    |
| `bw.tower_level`| Tower upgrade level (1-3)                       |
| `bw.enemy_type`| Enemy identity (1=Walker, 2=Runner, 3=Brute, 4=Boss)|
| `bw.lane`      | Enemy lane assignment (1 or 2)                   |
| `bw.wp`        | Enemy current waypoint (1-4)                     |
| `bw.cd`        | Tower attack cooldown (ticks)                    |
| `bw.slow`      | Frost slow countdown (ticks remaining)           |
| `bw.board`     | Sidebar display objective                        |
| `bw.pad_id`    | Build pad ID (1-8)                               |

## Player Count

1–4 players cooperative. Each player keeps their own gold balance, but kill rewards and intermission payouts are granted equally to current match participants only. Castle HP is shared. For larger groups increase `#castle.max bw.cfg`.

## Map Requirements

- Two straight flat corridors, ~80 blocks long, parallel (~20 blocks apart)
- Build pads accessible adjacent to each corridor (4 per side)
- Castle structure at X ≈ 80 covering both lane endpoints
- Spawn zone at X ≈ 0 covering both lane start points
- No terrain height changes along lane paths (entities `tp` at a fixed Y)
