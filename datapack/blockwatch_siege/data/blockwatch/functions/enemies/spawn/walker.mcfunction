# blockwatch:enemies/spawn/walker
# Spawns one Walker (zombie, 20 HP) in the lane set by #sp_lane bw.tmp.
# Spawn positions  ← PLACEHOLDER: match your map (see map/config)

execute if score #sp_lane bw.tmp matches 1 run summon minecraft:zombie 0.5 64 0.5 {NoAI:1b,PersistenceRequired:1b,Silent:1b,Tags:["bw.enemy","bw.enemy.walker","bw.init"],Attributes:[{Name:"minecraft:generic.max_health",Base:20.0d},{Name:"minecraft:generic.armor",Base:0.0d}],Health:20.0f}
execute if score #sp_lane bw.tmp matches 2 run summon minecraft:zombie 0.5 64 20.5 {NoAI:1b,PersistenceRequired:1b,Silent:1b,Tags:["bw.enemy","bw.enemy.walker","bw.init"],Attributes:[{Name:"minecraft:generic.max_health",Base:20.0d},{Name:"minecraft:generic.armor",Base:0.0d}],Health:20.0f}

execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.enemy_type 1
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.wp 1
execute as @e[tag=bw.init,limit=1] run scoreboard players operation @s bw.lane = #sp_lane bw.tmp
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.hp 20
tag @e[tag=bw.init] remove bw.init
