# Claude Bootstrap Prompt — Blockwatch: Siege

Paste the block below into a new Claude Code session to orient Claude on the project
before asking implementation questions.

---

## Paste This Into Claude

You are helping develop **Blockwatch: Siege**, a wave-based tower defense minigame
implemented as a Minecraft Java Edition datapack.

- Namespace: `blockwatch`
- Datapack folder: `blockwatch_siege`
- Target version: Minecraft 1.20.4 (`pack_format: 26`)

### Function Tree (active pipeline only)

```
data/blockwatch/functions/
  load.mcfunction              ← scoreboard init + lobby, runs on /reload
  tick.mcfunction              ← FSM router, runs every tick
  state/
    setup_scoreboards.mcfunction ← registers all bw.* objectives + bw.cfg constants
    set_lobby.mcfunction         ← state 1
    set_build.mcfunction         ← state 2 (tower placement, 30s)
    set_combat.mcfunction        ← state 3 (wave spawner starts)
    set_intermission.mcfunction  ← state 4 (gold reward, flawless bonus)
    set_victory.mcfunction       ← state 5
    set_defeat.mcfunction        ← state 6
    new_match.mcfunction         ← resets game, starts build phase
  map/
    setup.mcfunction           ← gamerules, spawns pads
    pads.mcfunction            ← summons 8 pad armor stands (4 per lane)
    pad_interact.mcfunction    ← handles /trigger bw.place (1|2|3)
    config.mcfunction          ← prints coordinate reference to chat
  towers/
    tick.mcfunction            ← iterates all tower types
    sell.mcfunction            ← handles /trigger bw.sell 1
    do_sell.mcfunction         ← executes as tower, refunds + removes
    arrow/tick|attack|hit|place.mcfunction
    frost/tick|attack|hit|place.mcfunction
    bomb/tick|attack|place.mcfunction
  enemies/
    tick.mcfunction            ← debuff_tick + move per enemy
    move.mcfunction            ← frozen guard, routes to lane1|2/move
    lane1/move.mcfunction      ← Z=0.5 waypoint logic
    lane2/move.mcfunction      ← Z=20.5 waypoint logic
    debuff_tick.mcfunction     ← frost slow countdown
    leak.mcfunction            ← damage castle, record leak, kill entity
    spawn/walker|runner|brute|boss.mcfunction
  waves/
    spawner.mcfunction         ← tick-based enemy spawner
    spawn_next.mcfunction      ← dispatches to wave_01..wave_10
    spawn.mcfunction           ← announces wave composition
    check_complete.mcfunction  ← triggers intermission when all dead
    wave_01..wave_10.mcfunction← spawn tables with lane assignment
  ui/
    sidebar.mcfunction         ← score-band sidebar (bw.board)
    actionbar.mcfunction       ← combat HUD (Wave X/10, enemies, castle HP)
  debug/
    status.mcfunction          ← print active scores to caller
    give_gold.mcfunction       ← +100g
    skip_wave.mcfunction       ← kill all enemies, end wave
    reset.mcfunction           ← hard reset to lobby
    force_victory.mcfunction   ← jump to victory state
    force_defeat.mcfunction    ← jump to defeat state
```

### Scoreboard Convention

All objectives use the `bw.` prefix. Never use `bs.*` (old scaffold namespace, deleted).

| Objective      | Key Fake Players                        | Meaning                    |
|----------------|-----------------------------------------|----------------------------|
| `bw.state`     | `#state`                                | FSM state (0–6)            |
| `bw.wave`      | `#wave`                                 | Current wave number        |
| `bw.castle_hp` | `#castle_hp`                            | Remaining castle HP        |
| `bw.timer`     | `#timer`                                | Phase countdown (ticks)    |
| `bw.gold`      | per-player                              | Player gold balance        |
| `bw.cfg`       | `#waves.max`, `#cost.arrow`, etc.       | All gameplay constants     |
| `bw.tmp`       | `#sp_idx`, `#sp_done`, `#wave_leaks`, etc. | Scratch / spawner state |
| `bw.place`     | per-player trigger                      | Place trigger (1|2|3)      |
| `bw.sell`      | per-player trigger                      | Sell trigger (value 1)     |
| `bw.enemy_type`| per-entity (1=Walker,2=Runner,3=Brute,4=Boss) | Enemy kind          |
| `bw.lane`      | per-entity (1 or 2)                     | Which lane this enemy uses |
| `bw.wp`        | per-entity (1–4)                        | Current waypoint index     |
| `bw.cd`        | per-tower entity                        | Attack cooldown ticks      |
| `bw.slow`      | per-enemy entity                        | Frost slow countdown ticks |
| `bw.tower_type`| per-tower (1=Arrow,2=Frost,3=Bomb)      | Tower kind                 |
| `bw.board`     | fake-player score bands                 | Sidebar display objective  |

### Entity Tags

| Tag              | Applied to   | Meaning                     |
|------------------|--------------|-----------------------------|
| `bw.enemy`       | Mobs         | All active enemy units      |
| `bw.enemy.walker`| Zombie       | Walker subtype              |
| `bw.enemy.runner`| Cave spider  | Runner subtype              |
| `bw.enemy.brute` | Iron golem   | Brute subtype               |
| `bw.enemy.boss`  | Ravager      | Boss (wave 10)              |
| `bw.tower`       | Armor stands | All placed towers           |
| `bw.tower.arrow` | Armor stand  | Arrow Tower                 |
| `bw.tower.frost` | Armor stand  | Frost Tower                 |
| `bw.tower.bomb`  | Armor stand  | Bomb Tower                  |
| `bw.pad`         | Armor stands | Build pad markers           |
| `bw.occupied`    | Pad stands   | Pad has a tower on it       |
| `bw.placing`     | Players      | Temporary: placing a tower  |
| `bw.selling`     | Players      | Temporary: selling a tower  |
| `bw.frozen`      | Enemies      | Frozen by Frost Tower       |
| `bw.init`        | New entities | Temporary: just summoned    |

### Game States

| # | Name         | Description                                         |
|---|--------------|-----------------------------------------------------|
| 0 | Uninit       | No-op; scoreboards not yet set up                   |
| 1 | Lobby        | Waiting for /function blockwatch:state/new_match    |
| 2 | Build        | Tower placement window (30 s, /trigger bw.place)   |
| 3 | Combat       | Enemies spawning and marching; towers auto-attack   |
| 4 | Intermission | Rest between waves (10 s); gold + flawless bonus    |
| 5 | Victory      | All 10 waves cleared                                |
| 6 | Defeat       | Castle HP reached 0                                 |

### Design Documents

- `design/game-overview.md`     — concept, FSM, scoreboards, map requirements
- `design/wave-balance.md`      — enemy types, 10-wave table, gold economy
- `design/tower-stats.md`       — 3 tower types, sell system, implementation notes
- `design/map-customization.md` — how to change coordinates for a custom map
- `design/placeholders.md`      — all hardcoded coordinates in one table
- `design/known-limitations.md` — 10 documented engine limitations

### Current Status

**MVP complete.** All systems are implemented and functional:
- 3 tower types (Arrow / Frost / Bomb) with sell
- 4 enemy types (Walker / Runner / Brute / Boss)
- 2 lanes, 8 build pads
- 10 waves with boss on wave 10
- Flawless bonus, config-driven constants, dual-lane spawning

### What I Need Help With

<!-- Replace this with your specific request. Examples:
  "Add a wave_11 endless mode that loops with scaling difficulty"
  "Implement tower upgrade tiers using bw.tower_level"
  "Add a per-kill gold reward using a loot table or advancement"
  "Make the sidebar hide Castle HP in lobby state"
-->

---

## Tips

- Always use the full namespaced path (`blockwatch:state/set_combat`, not `set_combat`).
- All gameplay constants are fake players in `bw.cfg` — edit via `state/setup_scoreboards`.
- Range and damage values in tower attack files are hardcoded literals (MC 1.20.4 limitation).
- Paste the relevant `.mcfunction` contents when asking Claude to modify a file.
- Run `/function blockwatch:debug/status` in-game to inspect live score values.
- Run `/function blockwatch:map/config` to print coordinate reference to chat.
