# Blockwatch: Siege

Wave-based tower defense minigame for Minecraft Java Edition 1.20.4.

## Quick Start

1. Copy `datapack/blockwatch_siege/` into your world's `datapacks/` folder.
2. Open the world and run `/reload`.
3. You should see `[Blockwatch: Siege] Reloaded. v0.1.0` in chat.
4. Start a match: `/function blockwatch:state/new_match`

See [DEPLOY.md](DEPLOY.md) for full installation instructions.  
See [TESTING.md](TESTING.md) for the test checklist and debug command reference.
See [ROADMAP.md](ROADMAP.md) for the staged improvement plan.

## Project Layout

```
blockwatch-siege/
  datapack/blockwatch_siege/     ← install this folder into your world's datapacks/
    pack.mcmeta                  ← pack_format 26 (MC 1.20.4)
    data/
      minecraft/tags/functions/  ← load.json and tick.json hooks
      blockwatch/functions/
        load.mcfunction          ← /reload entry point
        tick.mcfunction          ← FSM router (every tick)
        state/                   ← one function per game state
        map/                     ← pad setup and placement
        towers/                  ← arrow / frost / bomb + sell
        enemies/                 ← movement, spawning, lane routing
        waves/                   ← 10-wave spawn tables
        ui/                      ← sidebar and actionbar HUD
        debug/                   ← developer utilities
  design/                        ← design documents
  prompts/                       ← Claude bootstrap prompt
  TESTING.md                     ← test checklist and debug reference
  DEPLOY.md                      ← installation and sharing guide
```

## Game States

| State | Name         | Description                              |
|-------|--------------|------------------------------------------|
| 0     | Uninit       | Scoreboards not yet loaded               |
| 1     | Lobby        | Waiting for `/function blockwatch:state/new_match` |
| 2     | Build        | 30-second tower placement window         |
| 3     | Combat       | Enemies marching, towers auto-attacking  |
| 4     | Intermission | 10-second rest; gold and flawless bonus  |
| 5     | Victory      | All 10 waves cleared                     |
| 6     | Defeat       | Castle HP reached 0                      |

## Scoreboards (all `bw.*`)

| Objective      | Key values                           | Purpose                   |
|----------------|--------------------------------------|---------------------------|
| `bw.state`     | `#state` 0–6                         | FSM state                 |
| `bw.wave`      | `#wave`                              | Current wave number       |
| `bw.castle_hp` | `#castle_hp`                         | Remaining castle HP       |
| `bw.gold`      | per-player                           | Player gold               |
| `bw.cfg`       | `#waves.max`, `#cost.arrow`, etc.    | All gameplay constants    |
| `bw.tmp`       | `#sp_idx`, `#sp_done`, etc.          | Spawner scratch space     |
| `bw.place`     | trigger (1=Arrow, 2=Frost, 3=Bomb)   | Place tower               |
| `bw.sell`      | trigger (value 1)                    | Sell nearest tower        |
| `bw.upgrade`   | trigger (value 1)                    | Upgrade nearest tower     |
| `bw.ability`   | trigger (1=Airstrike, 2=Freeze)      | Use combat ability        |

## Entity Tags (all `bw.*`)

| Tag             | Entity       | Meaning                  |
|-----------------|--------------|--------------------------|
| `bw.enemy`      | Mobs         | Active enemies           |
| `bw.tower`      | Armor stands | Placed towers            |
| `bw.tower.arrow`| Armor stand  | Arrow Tower              |
| `bw.tower.frost`| Armor stand  | Frost Tower              |
| `bw.tower.bomb` | Armor stand  | Bomb Tower               |
| `bw.pad`        | Armor stands | Build pad markers        |
| `bw.occupied`   | Pad stands   | Pad with a tower on it   |
| `bw.playing`    | Players      | Active participants in the current match |

## Tower Quick Reference

| Tower  | Trigger | Cost  | Sell | Range | Damage | Rate  |
|--------|---------|-------|------|-------|--------|-------|
| Arrow  | 1       | 50g   | 35g  | 8 blk | 5 HP   | 1 s   |
| Frost  | 2       | 75g   | 52g  | 6 blk | 3 HP   | 1.25s |
| Bomb   | 3       | 100g  | 70g  | 10 blk| 15 AoE | 3 s   |

## Pack Format

`pack.mcmeta` targets `pack_format: 26` (Minecraft 1.20.4).
Update for newer versions — see the [Minecraft Wiki](https://minecraft.wiki/w/Data_pack#Pack_format).

## Customization

All coordinate placeholders default to a flat world at Y=64. Edit them before deploying
to a custom map. See `design/map-customization.md` and `design/placeholders.md`.

All gameplay constants (costs, timers, wave count) live in `state/setup_scoreboards.mcfunction`
under the `bw.cfg` section.

Players spend from their own `bw.gold` balances. Kill rewards and intermission payouts are granted
equally to current match participants only.

Shared castle HP scales with participant count at match start:
`#castle.max + (#players - 1) * #castle.per_player`
