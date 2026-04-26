# Blockwatch: Siege — Testing Guide

## Installation

1. Locate your world's save folder:
   - **Windows:** `%APPDATA%\.minecraft\saves\<WorldName>\datapacks\`
   - **macOS:** `~/Library/Application Support/minecraft/saves/<WorldName>/datapacks/`
   - **Linux:** `~/.minecraft/saves/<WorldName>/datapacks/`
2. Copy the `datapack/blockwatch_siege/` folder into `datapacks/`.
3. Open the world (or run `/reload` if already loaded).
4. Confirm chat shows: `[Blockwatch: Siege] Reloaded. v0.1.0`

Expected state after reload: **Lobby (state = 1)**. All `bw.*` scoreboards are created and all `bw.cfg` constants are set.

---

## Test Sequence

Run each step in order. Use `/function blockwatch:debug/status` after each step to inspect live scores.

### 1. Fresh Install

```
/reload
```
Expected:
- Chat: `[Blockwatch: Siege] Reloaded. v0.1.0`
- `#state bw.state = 1` (Lobby)
- `#wave bw.wave = 0`
- `#castle_hp bw.castle_hp = 20`

### 2. Start a Match

```
/function blockwatch:state/new_match
```
Expected:
- State transitions: new_match → set_build → state 2
- Each player starts with 100 gold (`bw.gold`)
- `#castle_hp = 20`
- `#timer` ≈ 600 (30 s countdown begins)
- 8 pad armor stands visible in world (4 per lane)
- Chat: `[Siege] Build phase — 30 s. Walk near a pad and /trigger bw.place set 1 (Arrow), 2 (Frost), 3 (Bomb)`

### 3. Place an Arrow Tower

Stand within 4 blocks of a pad and run:
```
/trigger bw.place set 1
```
Expected:
- Costs 50g (gold decreases from 100 → 50)
- Pad name disappears (CustomNameVisible = 0b — pad is now occupied)
- Arrow Tower armor stand appears at the pad location
- Cannot place again on the same pad

### 4. Place a Frost Tower and Bomb Tower

```
/trigger bw.place set 2    (near a different pad, costs 75g)
/trigger bw.place set 3    (near a third pad, costs 100g)
```
Expected gold sequence starting from 50g: 50 → -25g (blocked, insufficient funds if broke).  
Use `/function blockwatch:debug/give_gold` first if needed to top up to 150g.

### 5. Sell a Tower

Stand within 4 blocks of a placed tower and run:
```
/trigger bw.sell set 1
```
Expected:
- Gold increases by the tower's sell value (Arrow: 35g, Frost: 52g, Bomb: 70g)
- Tower armor stand is removed
- Pad becomes unoccupied (CustomNameVisible restored)
- Can now place a new tower on that pad

### 6. Enter Combat

Wait for the build timer to expire **or** run:
```
/function blockwatch:state/set_combat
```
Expected:
- State = 3
- Wave 1 spawn announcements appear in chat
- Enemies appear at spawn point (X=0.5, Y=64, Z=0.5 for lane 1)
- Enemies begin moving along the lane path
- Arrow Tower fires every ~1s (20 ticks) at enemies within 8 blocks
- Frost Tower fires every ~1.25s (25 ticks), slowing targets
- Bomb Tower fires every ~3s (60 ticks), AoE damage

### 7. Skip to End of Wave

```
/function blockwatch:debug/skip_wave
```
Expected:
- All enemies die
- Wave check triggers intermission
- Chat: gold reward announcement
- If no enemy leaked: `FLAWLESS! +50g bonus` message
- State = 4 (Intermission, 10 s timer)

### 8. Test a Leak

Let an enemy reach X=80.5 without being killed:
- Castle HP decreases by 1
- `#wave_leaks bw.tmp` increments (no flawless bonus this wave)
- If HP reaches 0: defeat state

Verify via:
```
/function blockwatch:debug/status
```

### 9. Test Defeat

```
/function blockwatch:debug/force_defeat
```
Expected:
- State = 6
- Chat: `[Siege] DEFEAT — the castle has fallen!`
- `#timer` counts down then returns to lobby (state = 1)

### 10. Test Victory

```
/function blockwatch:state/new_match
/function blockwatch:debug/force_victory
```
Expected:
- State = 5
- Chat: `[Siege] VICTORY — all waves cleared!`
- `#timer` counts down then returns to lobby

---

## Debug Command Reference

| Command | Effect |
|---------|--------|
| `/function blockwatch:debug/status` | Print all live scores to caller |
| `/function blockwatch:debug/give_gold` | Add 100g to caller |
| `/function blockwatch:debug/skip_wave` | Kill all enemies, trigger wave-complete check |
| `/function blockwatch:debug/reset` | Hard reset to lobby (kills all entities, resets scores) |
| `/function blockwatch:debug/force_victory` | Jump directly to victory state |
| `/function blockwatch:debug/force_defeat` | Jump directly to defeat state |
| `/function blockwatch:map/config` | Print all hardcoded coordinates to chat |

---

## Scoreboard Inspection

Display a scoreboard in-game to watch scores live:

```
/scoreboard objectives setdisplay sidebar bw.state
/scoreboard objectives setdisplay sidebar bw.tmp
/scoreboard objectives setdisplay sidebar bw.gold
```

Reset display:
```
/scoreboard objectives setdisplay sidebar
```

Useful fake-player reads:
```
/scoreboard players get #state      bw.state
/scoreboard players get #wave       bw.wave
/scoreboard players get #castle_hp  bw.castle_hp
/scoreboard players get #timer      bw.timer
/scoreboard players get #sp_idx     bw.tmp
/scoreboard players get #sp_done    bw.tmp
/scoreboard players get #wave_leaks bw.tmp
/scoreboard players get #sp_lane    bw.tmp
```

---

## Common Issues

**Towers not firing**
- Confirm state = 3 (Combat). Towers only tick in `towers/tick`, called from `tick.mcfunction` when state = 3.
- Confirm enemies have the `bw.enemy` tag: `/execute as @e[tag=bw.enemy] run say I am an enemy`

**Pads not appearing**
- Confirm `map/pads` ran via `new_match`. Check for duplicate runs: `kill @e[tag=bw.pad]` runs first, so multiple reloads are safe.
- Verify you are in the right world area (X=10–70, Y=65, Z=-4.5 and Z=25.5 by default).

**Gold not deducting / tower not placed**
- Confirm you are within 4 blocks of an unoccupied pad.
- Confirm the trigger was enabled this tick (state must be 2 or 4 for sell; state 2 for place).
- Check gold balance: `/scoreboard players get @s bw.gold`

**Enemies not moving**
- Confirm `bw.lane` is set on the entity. A missing lane score causes `enemies/move` to skip both lane branches silently.
- Check `bw.wp` — if 0, the entity has no waypoint and won't advance.

**Sell leaves pad occupied**
- This was a critical bug fixed in the current version. If pads stay occupied after selling, confirm `towers/sell.mcfunction` contains `at @s` in the execute chain: `execute as @e[tag=bw.tower,...] at @s run function blockwatch:towers/do_sell`

**Flawless bonus not awarding**
- Check `#wave_leaks bw.tmp` before wave ends. If > 0, no bonus. A `skip_wave` call after a leak sets `#sp_done` but does not reset leaks.
