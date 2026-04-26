# Wave Balance Table

Spawn interval: 2 s (40 ticks, `#sp.interval bw.cfg`)  
Gold reward per wave: 25 base + 5×wave_number + 50 flawless bonus (all in `bw.cfg`)

## Enemy Stats

| Type   | HP  | Speed (blk/tick) | Notes                            |
|--------|-----|-----------------|----------------------------------|
| Walker | 20  | 0.15            | Zombie — cannon fodder           |
| Runner | 15  | 0.25            | Cave spider — fast, fragile      |
| Brute  | 100 | 0.08            | Iron golem — tanky, slow         |
| Boss   | 200 | 0.06            | Ravager — wave 10 only, lane 1   |

## Wave Table

| Wave | Composition                                      | Lane  | Enemies | Min Reward* |
|------|--------------------------------------------------|-------|---------|-------------|
| 1    | 5 Walkers                                        | L1    | 5       | 30g         |
| 2    | 4 Walkers + 3 Runners                            | L1    | 7       | 35g         |
| 3    | 3 Walkers + 2 Runners + 1 Brute                 | L1    | 6       | 40g         |
| 4    | 4 Walkers + 4 Runners                            | L1    | 8       | 45g         |
| 5    | 3 Walkers + 3 Runners + 2 Brutes                | L1    | 8       | 50g         |
| 6    | 6 Runners + 2 Brutes                             | L1    | 8       | 55g         |
| 7    | 4 Walkers + 4 Runners + 3 Brutes                | Dual  | 11      | 60g         |
| 8    | 5 Runners + 4 Brutes                             | Dual  | 9       | 65g         |
| 9    | 3 Walkers + 5 Runners + 3 Brutes                | Dual  | 11      | 70g         |
| 10   | 4 Walkers + 4 Runners + 2 Brutes + 1 Boss       | Dual  | 11      | 75g         |

\* Flawless (zero leaks): +50g bonus.

## Gold Economy

Starting gold: **100g**  
Total base rewards if all waves are flawless: 100 + (30+35+40+45+50+55+60+65+70+75) + (50×10) = **1,025g**

Tower costs: Arrow 50g | Frost 75g | Bomb 100g  
Sell refund (~70%): Arrow 35g | Frost 52g | Bomb 70g

## Tower Effectiveness Guide

| Threat                  | Best Tower  | Reasoning                              |
|-------------------------|-------------|----------------------------------------|
| Large packs (w1-4)      | Arrow       | Cost-efficient at 50g                  |
| Runners (w2-6)          | Frost       | Freeze negates speed advantage         |
| Brutes (w3-9)           | Arrow+Bomb  | Arrow sustain + Bomb burst             |
| Dual-lane clusters (w7+)| Bomb        | AoE hits both lanes if centrally placed|
| Wave 10 Boss            | Bomb+Arrow  | Bomb burst, Arrow chips while Bomb reloads |
