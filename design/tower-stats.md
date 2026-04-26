# Tower Stats

All cost/rate/sell constants live in `bw.cfg` (set in `state/setup_scoreboards.mcfunction`).  
**Range and damage values are hardcoded literals** — see Known Limitations.

## Arrow Tower

| Stat      | Value      | Config key      | Hardcoded? |
|-----------|------------|-----------------|------------|
| Cost      | 50g        | `#cost.arrow`   | No         |
| Sell      | 35g        | `#sell.arrow`   | No         |
| Rate      | 20t (1s)   | `#rate.arrow`   | No         |
| Range     | 8 blk      | —               | Yes        |
| Damage    | 5 HP       | —               | Yes        |
| Target    | Nearest enemy in range |    |            |

Best for: early waves (cost-efficient), sustained single-target DPS.

## Frost Tower

| Stat      | Value      | Config key      | Hardcoded? |
|-----------|------------|-----------------|------------|
| Cost      | 75g        | `#cost.frost`   | No         |
| Sell      | 52g        | `#sell.frost`   | No         |
| Rate      | 25t (1.25s)| `#rate.frost`   | No         |
| Freeze    | 60t (3s)   | `#frost.dur`    | No         |
| Range     | 6 blk      | —               | Yes        |
| Damage    | 3 HP       | —               | Yes        |
| Target    | Nearest enemy in range |    |            |

**Freeze mechanic**: applies `bw.frozen` tag + sets `bw.slow = #frost.dur`. `enemies/move` returns early if `bw.frozen` is set. `enemies/debuff_tick` decrements `bw.slow` each tick and removes the tag at 0.

Best for: neutralizing Runners; chokepoint stalling; support alongside Bomb.

## Bomb Tower

| Stat      | Value      | Config key     | Hardcoded? |
|-----------|------------|----------------|------------|
| Cost      | 100g       | `#cost.bomb`   | No         |
| Sell      | 70g        | `#sell.bomb`   | No         |
| Rate      | 60t (3s)   | `#rate.bomb`   | No         |
| Range     | 10 blk     | —              | Yes        |
| Damage    | 15 HP AoE  | —              | Yes        |
| Target    | ALL enemies in range (AoE) | |         |

**AoE mechanic**: `execute as @e[tag=bw.enemy,distance=..10] run damage @s 15`. One explosion hits every enemy within range in a single tick.

Best for: clearing clusters on dual-lane waves 7-10; burst damage on Brute groups.

## Sell System

All towers refund ~70% on sell via `/trigger bw.sell 1`. Player must be within 4 blocks.  
`towers/sell.mcfunction` → `towers/do_sell.mcfunction`

The sold tower's pad has its name label visibility restored so the pad is available for a new tower.

## Implementation Notes

- All towers: invisible `Marker` armor stands tagged `bw.tower` + `bw.tower.<type>`
- `bw.tower_type` score: 1=Arrow, 2=Frost, 3=Bomb
- Attack dispatch: `towers/tick` iterates by tag, calls `<type>/tick` → `<type>/attack` → `<type>/hit`
- Rate control: `bw.cd` score decrements each tick; resets to `#rate.<type> bw.cfg` on fire
- No upgrades implemented (single tier per type)
