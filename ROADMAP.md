# Blockwatch: Siege Roadmap

This roadmap turns the baseline audit into an execution order. The early milestones focus on match integrity and release safety first, then move into gameplay depth and content.

## Baseline Audit Summary

### Highest-priority logic and security concerns

1. Match lifecycle hardening
   - ensure `/reload`, `new_match`, and debug reset all return the arena to a known-clean state
   - prevent old entities, cooldowns, and triggers from leaking across runs

2. Release safety
   - ship a release artifact without developer-only debug commands
   - make release packaging repeatable instead of relying on manual folder editing

3. Economy clarity
   - keep one documented co-op model
   - current behavior is personal spending with mirrored rewards to all online players
   - future change: decide whether to stay here or move to a truly shared bank

4. Automated regression coverage
   - keep structural tests in CI
   - add targeted tests for packaging, wave coverage, and state-machine integrity

## Milestone Plan

## v1.1 Foundation

- harden match reset behavior and reload safety
- remove dead or misleading UX elements
- add a release packaging script that strips `functions/debug`
- add CI coverage for release packaging
- sync README, deploy docs, and design notes to the current implementation

Definition of done:
- starting a fresh match never inherits leftover arena state
- `/reload` returns the pack to a safe lobby baseline
- a public build can be produced from one script invocation

## v1.2 Systems

- decide and codify the long-term co-op economy model
- add stronger state-machine assertions around victory, defeat, and wave transitions
- add player-count scaling for castle HP and possibly rewards
- improve tower targeting rules beyond nearest-enemy only

Definition of done:
- co-op behavior is explicit in code and docs
- core systems have guardrails against edge-case breakage

## v1.3 Tactical Depth

- add one new support or utility tower
- add one new enemy that changes lane-planning decisions
- give the boss a more distinctive mechanic than raw stats plus shockwave
- improve pre-wave communication for lane splits and special threats

Definition of done:
- players make meaningfully different build choices between runs
- wave 10 feels like a finale, not just a larger health bar

## v1.4 Replayability

- map modifiers or difficulty mutators
- alternate lane layouts or map variants
- challenge modes such as no-sell, boss rush, or hard economy
- optional score tracking for leaks, clear speed, and flawless runs

Definition of done:
- the pack supports repeat play without feeling solved after one clear

## Candidate Backlog

- anti-boss tower
- support tower that buffs nearby towers
- shielded enemy that resists Bomb splash
- stealth enemy that requires Frost or special reveal logic
- split-path boss or lane-switching event
- mid-wave emergency ability pickups
- map authoring helpers for coordinates and pad placement
