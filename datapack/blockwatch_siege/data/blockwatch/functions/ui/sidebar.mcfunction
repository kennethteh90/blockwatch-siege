# blockwatch:ui/sidebar
# Rebuilds sidebar values every tick. The bw.board display objective was set in
# setup_scoreboards; this function only updates the scores within it.
#
# Ordering strategy — each category lives in a non-overlapping score band:
#   999999       : header (static)
#   100001–100010: Wave  (100000 + wave number)
#    50001–50020 : Castle HP (50000 + current hp)
#        0–9999  : per-player Gold (raw bw.gold value)
#
# This keeps labels stable even when the underlying values change.

# ── Header ───────────────────────────────────────────────────────────────────
scoreboard players set "§6§lBlockwatch: Siege" bw.board 999999

# ── Wave (band: 100000 + wave) ────────────────────────────────────────────────
scoreboard players operation "§eWave" bw.board  = #wave bw.wave
scoreboard players add       "§eWave" bw.board  100000

# ── Castle HP (band: 50000 + hp) ─────────────────────────────────────────────
scoreboard players operation "§cCastle HP" bw.board  = #castle_hp bw.castle_hp
scoreboard players add       "§cCastle HP" bw.board  50000

# ── Per-player Gold (band: 0–9999) ───────────────────────────────────────────
# Each player's name appears with their gold score. Sorted among themselves.
execute as @a[tag=bw.playing] run scoreboard players operation @s bw.board = @s bw.gold
