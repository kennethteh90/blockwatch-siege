# Blockwatch: Siege — Deployment Guide

## What to Install

Only one folder needs to be copied into your world:

```
datapack/blockwatch_siege/
```

Everything else in this repository (design docs, prompts, TESTING.md) is development material and does not go into Minecraft.

---

## Method 1: Singleplayer World Save

### Step 1 — Find your world folder

| OS | Path |
|----|------|
| Windows | `%APPDATA%\.minecraft\saves\<WorldName>\` |
| macOS | `~/Library/Application Support/minecraft/saves/<WorldName>/` |
| Linux | `~/.minecraft/saves/<WorldName>/` |

### Step 2 — Copy the datapack

```
<WorldName>/
  datapacks/
    blockwatch_siege/        ← copy this entire folder here
      pack.mcmeta
      data/
        ...
```

### Step 3 — Load in-game

Open the world, then run:
```
/reload
```

Confirm chat shows `[Blockwatch: Siege] Reloaded. v0.1.0`.

> If you already had the world open, `/reload` is sufficient — you do not need to restart the game.

---

## Method 2: Dedicated Server

### Step 1 — Copy the datapack

```
<server-root>/
  world/
    datapacks/
      blockwatch_siege/     ← copy here
```

### Step 2 — Reload

Either restart the server or, if the server is running, run from console:
```
reload confirm
```

Or from an in-game operator account:
```
/reload
```

### Step 3 — Recommended gamerules

Run these after the first `/reload` to prevent side effects during play:

```
/gamerule doDaylightCycle false
/gamerule doWeatherCycle false
/gamerule doMobSpawning false
/gamerule doFireTick false
/gamerule naturalRegeneration false
/gamerule keepInventory true
```

> These are also applied automatically by `map/setup.mcfunction`, which is called during `state/new_match`. Running them manually ahead of time prevents any gap between world load and first match.

---

## Method 3: Zip Distribution (Share with Others)

To share the datapack as a standalone file:

1. Navigate into `datapack/`.
2. Zip `blockwatch_siege/` — the zip must contain `blockwatch_siege/pack.mcmeta` at its root (not a nested extra folder).
3. Rename to `blockwatch_siege.zip`.
4. Recipients drop the zip directly into their world's `datapacks/` folder — Minecraft reads zipped datapacks natively.

Verify the zip structure:
```
blockwatch_siege.zip
  blockwatch_siege/
    pack.mcmeta
    data/
      ...
```

---

## Coordinate Setup (Custom Maps)

The default coordinates assume a **flat world at Y=64** with the lane running along the X axis. If you are deploying to a custom map, update coordinates before first use.

Run in-game to see all hardcoded coordinate values:
```
/function blockwatch:map/config
```

See `design/placeholders.md` for the complete table of every hardcoded value and which file to edit.

Key files to update for a new map:
- `map/pads.mcfunction` — 8 pad positions
- `enemies/spawn/walker|runner|brute|boss.mcfunction` — spawn points per lane
- `enemies/lane1/move.mcfunction` — all waypoints for lane 1
- `enemies/lane2/move.mcfunction` — all waypoints for lane 2

---

## Multiplayer Setup

The datapack is co-op compatible. Each player has their own spendable `bw.gold` balance, but kill rewards and intermission payouts are mirrored to active match participants only. Castle HP and wave state are global.

Players online when `/function blockwatch:state/new_match` is run are tagged as the participants for that match. Late joiners can watch, but they do not receive match gold, triggers, or HUD updates until the next match starts.

Shared castle HP also scales from that participant count:
- 1 player: `#castle.max`
- each extra participant adds `#castle.per_player`

For multiplayer servers, ensure all players have operator level ≥ 2 if you want them to use debug functions, or restrict debug access by removing the `debug/` functions from the datapack before distribution.

---

## First Match Checklist

After install and `/reload`:

- [ ] Chat shows `[Blockwatch: Siege] Reloaded. v0.1.0`
- [ ] Run `/function blockwatch:state/new_match`
- [ ] 8 pad armor stands appear in the world
- [ ] Build timer counts down in the sidebar
- [ ] Place at least one tower (`/trigger bw.place set 1` near a pad)
- [ ] Wait for combat or run `/function blockwatch:state/set_combat`
- [ ] Enemies appear and walk toward the castle
- [ ] Towers fire automatically
- [ ] Wave completes, intermission triggers, gold is awarded

---

## Removal / Uninstall

To fully remove Blockwatch: Siege from a world:

1. Delete `datapacks/blockwatch_siege/` from the world folder.
2. Run `/reload` in-game.
3. Clean up scoreboards (paste into chat or a command block):

```
/scoreboard objectives remove bw.state
/scoreboard objectives remove bw.wave
/scoreboard objectives remove bw.castle_hp
/scoreboard objectives remove bw.timer
/scoreboard objectives remove bw.gold
/scoreboard objectives remove bw.cfg
/scoreboard objectives remove bw.tmp
/scoreboard objectives remove bw.place
/scoreboard objectives remove bw.sell
/scoreboard objectives remove bw.enemy_type
/scoreboard objectives remove bw.lane
/scoreboard objectives remove bw.wp
/scoreboard objectives remove bw.cd
/scoreboard objectives remove bw.slow
/scoreboard objectives remove bw.tower_type
/scoreboard objectives remove bw.board
/scoreboard objectives remove bw.pad_id
```

4. Kill any lingering entities:
```
/kill @e[tag=bw.enemy]
/kill @e[tag=bw.tower]
/kill @e[tag=bw.pad]
```
