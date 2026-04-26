# blockwatch:enemies/spawn/brute
# Spawns one Brute (iron golem, 100 HP) in the lane set by #sp_lane bw.tmp.
# Spawn positions  ← PLACEHOLDER: match your map (see map/config)

execute if score #sp_lane bw.tmp matches 1 run summon minecraft:iron_golem 0.5 64 0.5 {NoAI:1b,PersistenceRequired:1b,Silent:1b,Tags:["bw.enemy","bw.enemy.brute","bw.init"],Attributes:[{Name:"minecraft:generic.max_health",Base:100.0d},{Name:"minecraft:generic.armor",Base:0.0d}],Health:100.0f}
execute if score #sp_lane bw.tmp matches 2 run summon minecraft:iron_golem 0.5 64 20.5 {NoAI:1b,PersistenceRequired:1b,Silent:1b,Tags:["bw.enemy","bw.enemy.brute","bw.init"],Attributes:[{Name:"minecraft:generic.max_health",Base:100.0d},{Name:"minecraft:generic.armor",Base:0.0d}],Health:100.0f}

execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.enemy_type 3
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.wp 1
execute as @e[tag=bw.init,limit=1] run scoreboard players operation @s bw.lane = #sp_lane bw.tmp
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.hp 100
tag @e[tag=bw.init] remove bw.init
