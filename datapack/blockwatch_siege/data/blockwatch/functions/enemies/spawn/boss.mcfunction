# blockwatch:enemies/spawn/boss
# Spawns the Wave 10 Boss (ravager, 200 HP) always in lane 1.
# Boss speed: 0.06 blocks/tick — tanky and slow.

summon minecraft:ravager 0.5 64 0.5 {NoAI:1b,PersistenceRequired:1b,Silent:1b,Tags:["bw.enemy","bw.enemy.boss","bw.init"],Attributes:[{Name:"minecraft:generic.max_health",Base:200.0d},{Name:"minecraft:generic.armor",Base:0.0d}],Health:200.0f}

execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.enemy_type 4
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.wp 1
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.lane 1
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.hp 200
execute as @e[tag=bw.init,limit=1] run scoreboard players set @s bw.cd 100
tag @e[tag=bw.init] remove bw.init
