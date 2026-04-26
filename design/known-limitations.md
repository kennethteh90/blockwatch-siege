# Known Limitations

## 1. Literal numbers in attack commands

`/damage @s N` and `distance=..N` require literal integers in MC 1.20.4 — they cannot read from a scoreboard. This means tower range and damage **cannot** be driven by `bw.cfg` constants without a macro (1.20.2+ `$` syntax not used here). Edit `towers/<type>/attack.mcfunction` and `towers/<type>/hit.mcfunction` directly to change these values.

## 2. NoAI entities teleport, not walk

Enemies move via `tp @s ^ ^ ^speed` every tick. They do not use pathfinding, so they:
- Cannot navigate around obstacles (maps must have clear straight lanes)
- Do not trigger pressure plates or tripwires by walking
- Cannot be knocked back by explosions or projectiles
- May clip through thin walls at high speeds (runner at 0.25 blk/tick can skip a 1-block gap)

## 3. Single-target tower attack (Arrow and Frost)

Arrow and Frost towers fire at `sort=nearest,limit=1`. They cannot hit multiple targets in one shot. A large cluster of enemies will be hit one at a time. Bomb Tower is the only AoE option.

## 4. Sell finds pads by proximity, not ownership

`do_sell.mcfunction` finds the nearest pad within 2 blocks. If two pads are placed very close together, the wrong pad could be un-occupied. Default pad spacing (20 blocks) avoids this.

## 5. Co-op gold awards all players equally

`scoreboard players operation @a bw.gold += #tmp bw.tmp` gives every online player the same reward. There is no contribution tracking or split-by-kill gold.

## 6. Frozen flag on dead entities

If a frozen enemy is killed by a Bomb Tower mid-freeze, the entity is removed but `bw.frozen` was on it — no cleanup needed. However if `kill` fails for any reason the debuff countdown still runs harmlessly.

## 7. No mid-wave build phase

Players cannot build or sell during combat (state 3). The sell trigger is only enabled in states 2 and 4. This is by design but means poor positioning cannot be corrected until intermission.

## 8. Boss always spawns in lane 1

`enemies/spawn/boss.mcfunction` hard-codes lane 1 and ignores `#sp_lane bw.tmp`. This is intentional (boss is a lane 1 threat), but means dual-lane maps cannot direct the boss to lane 2 without editing the file.

## 9. No per-player castle HP in co-op

Castle HP is a single shared counter (`#castle_hp bw.castle_hp`). A 4-player co-op game has the same castle HP as a solo game. Increase `#castle.max bw.cfg` to compensate for larger player counts.
