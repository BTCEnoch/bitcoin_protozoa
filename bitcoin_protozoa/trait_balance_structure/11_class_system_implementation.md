# Class System Implementation

<!-- AI-INDEX-START -->
## AI Navigation Guide

This document details the implementation of the class system for Bitcoin Protozoa, focusing on how particle distributions determine classes and subclasses, and how these affect gameplay.

### Key Sections:
1. **Main Classes**: [Main Classes](#main-classes) - The five primary classes (Healer, Caster, Striker, Tank, Rogue)
2. **Subclass System**: [Subclass System](#subclass-system) - How subclasses are determined by particle distribution
3. **Class Skills**: [Class Skills](#class-skills) - Abilities for each class
4. **Role Subclasses**:
   - [CORE Subclasses](#core-subclasses) - Healer subclasses
   - [CONTROL Subclasses](#control-subclasses) - Caster subclasses
   - [ATTACK Subclasses](#attack-subclasses) - Striker subclasses
   - [DEFENSE Subclasses](#defense-subclasses) - Tank subclasses
   - [MOVEMENT Subclasses](#movement-subclasses) - Rogue subclasses

### Important Concepts:
- Particle count ranges determine rarity tier
- Each main class has 15 subclasses distributed across 6 rarity tiers
- Subclasses are further modified by the ordering of secondary roles
<!-- AI-INDEX-END -->

This document details the implementation of the class system for Bitcoin Protozoa, focusing on how particle distributions determine classes and subclasses, and how these affect gameplay.

## Table of Contents

1. [Overview](#overview)
2. [Main Classes](#main-classes)
3. [Subclass System](#subclass-system)
4. [Class Skills](#class-skills)
5. [Subclass Modifiers](#subclass-modifiers)
6. [Integration with Traits](#integration-with-traits)
7. [Implementation Guidelines](#implementation-guidelines)

## Overview

The Bitcoin Protozoa class system transforms particle distributions into meaningful gameplay roles. Each creature is assigned a main class based on its dominant particle group, with subclasses determined by the ranking of the remaining groups. This creates a rich variety of 120 unique subclasses, each with distinct gameplay characteristics.

## Main Classes

The main class is determined by the particle group with the highest count:

| Dominant Group | Main Class | Primary Focus |
|----------------|------------|---------------|
| CORE | Healer | Restoration and support |
| CONTROL | Caster | Utility and crowd control |
| ATTACK | Striker | Damage and offense |
| DEFENSE | Tank | Protection and durability |
| MOVEMENT | Rogue | Speed and evasion |

Each main class has a set of base skills and characteristics that define its primary role in gameplay.

## Subclass System

The subclass is determined by the full ranking of all five particle groups:

1. **Main Class**: Determined by the highest group
2. **Subclass**: Determined by the order of the remaining four groups

Each main class has 15 subclasses distributed across rarity tiers, for a total of 75 unique subclasses (5 × 15).

### Subclass Distribution by Rarity

| Rarity | Subclasses per Main Class | Total Subclasses | Percentage |
|--------|---------------------------|------------------|------------|
| Common | 4 | 20 | 40% |
| Uncommon | 3 | 15 | 30% |
| Rare | 3 | 15 | 20% |
| Epic | 2 | 10 | 8% |
| Legendary | 2 | 10 | 1.5% |
| Mythic | 1 | 5 | 0.5% |
| **Total** | **15** | **75** | **100%** |

### Class Determination Diagram

```
                      ┌───────────────────────┐
                      │   Particle Groups     │
                      │   CORE: 120          │
                      │   CONTROL: 80        │
                      │   ATTACK: 100        │
                      │   DEFENSE: 110       │
                      │   MOVEMENT: 90       │
                      └──────────┬────────────┘
                                 │
                                 ▼
                      ┌───────────────────────┐
                      │   Sort by Count       │
                      │   (Highest to Lowest) │
                      └──────────┬────────────┘
                                 │
                                 ▼
                      ┌───────────────────────┐
                      │   Ranked Groups       │
                      │   1. CORE             │
                      │   2. DEFENSE          │
                      │   3. ATTACK           │
                      │   4. MOVEMENT         │
                      │   5. CONTROL          │
                      └──────────┬────────────┘
                                 │
                                 ▼
          ┌─────────────────────┴─────────────────────┐
          │                                           │
          ▼                                           ▼
┌───────────────────────┐                 ┌───────────────────────┐
│   Main Class          │                 │   Subclass            │
│   (From Highest)      │                 │   (From Remaining)    │
│                       │                 │                       │
│   CORE → Healer       │                 │   DEFENSE-ATTACK-     │
│                       │                 │   MOVEMENT-CONTROL    │
└───────────────────────┘                 └───────────────────────┘
                                                     │
                                                     ▼
                                         ┌───────────────────────┐
                                         │   Final Class         │
                                         │                       │
                                         │   Guardian Healer     │
                                         │   with Striker Agility│
                                         │   and Arcane Support  │
                                         └───────────────────────┘
```

### Example Subclass Naming

For a creature with CORE as the highest group, followed by DEFENSE, CONTROL, ATTACK, and MOVEMENT:

- Main Class: Healer (from CORE)
- Subclass: Guardian Healer (from DEFENSE being second)
- Full Classification: Guardian Healer with Control Precision and Mobile Strike (representing the full order)

### Subclass Uniqueness

Even subclasses that share the same top three groups but differ in the fourth and fifth positions will have distinct gameplay characteristics. For example:

- **Subclass A**: Healer with DEFENSE > CONTROL > ATTACK > MOVEMENT
- **Subclass B**: Healer with DEFENSE > CONTROL > MOVEMENT > ATTACK

Both are Guardian Healers with Control Precision, but Subclass A has a minor attack bonus and slight movement perk, while Subclass B has a minor movement bonus and slight attack perk.

## Class Skills

Each main class has a set of base skills that define its primary role:

### Healer (CORE)
- **Heal**: Restores health to allies
- **Restore**: Removes debuffs from allies (dispel-type skill)
- **Stabilize**: Provides damage reduction to allies
- **Crowd Control Effects**:
  - **Silence**: Prevents enemies from using abilities
  - **Confuse**: Causes enemies to act unpredictably or attack allies
  - **Blind**: Reduces enemy accuracy or vision

Crowd control effects vary by subclass rarity tier, with higher rarity subclasses having longer durations and stronger effects.

### Caster (CONTROL)
- **Arcane Bolt**: Deals damage and applies a control effect
- **Manipulate**: Alters the battlefield or enemy behavior
- **Enhance**: Boosts ally effectiveness

### Striker (ATTACK)
- **Strike**: Deals high damage to a single target
- **Barrage**: Deals moderate damage to multiple targets
- **Penetrate**: Ignores a portion of enemy defense
- **Crowd Control Effects**:
  - **Stun**: Temporarily prevents enemy movement and actions
  - **Daze**: Disorients enemies, reducing accuracy
  - **Fear**: Causes enemies to flee or be unable to attack

Crowd control effects vary by subclass rarity tier, with higher rarity subclasses having longer durations and stronger effects.

### Tank (DEFENSE)
- **Shield**: Absorbs damage for allies
- **Taunt**: Forces enemies to attack the tank
- **Fortify**: Increases own defense temporarily
- **Crowd Control Effects**:
  - **Stun**: Temporarily prevents enemy movement and actions
  - **Knockback**: Pushes enemies away
  - **Taunt**: Forces enemies to attack the tank

Crowd control effects vary by subclass rarity tier, with higher rarity subclasses having longer durations and stronger effects.

### Rogue (MOVEMENT)
- **Dash**: Quickly repositions
- **Evade**: Increases dodge chance
- **Ambush**: Deals bonus damage from advantageous positions
- **Crowd Control Effects**:
  - **Daze**: Disorients enemies, reducing accuracy
  - **Stun**: Temporarily prevents enemy movement and actions
  - **Knockback**: Pushes enemies away

Crowd control effects vary by subclass rarity tier, with higher rarity subclasses having longer durations and stronger effects.

## Subclass Modifiers

The ranking of all five particle groups influences how the base skills function:

### Subclass Modifier Table

The following table shows how each group modifies skills based on its position in the ranking:

| Group Position | CORE | CONTROL | ATTACK | DEFENSE | MOVEMENT |
|----------------|------|---------|--------|---------|----------|
| **2nd (Major)** | +Healing (50%) | +Crowd Control (5s) | +Damage (30%) | +Shield (50%) | +Speed (30%) |
| **3rd (Secondary)** | +Regen (2%/s) | +Debuff (3s) | +Penetration (15%) | +Resistance (20%) | +Evasion (15%) |
| **4th (Minor)** | +Stability (10%) | +Utility (5%) | +Crit Chance (5%) | +Reflect (10%) | +Dash (10%) |
| **5th (Subtle)** | +Energy (5%) | +Focus (3%) | +Bleed (2%) | +Thorns (3%) | +Agility (5%) |

### Second-Highest Group (Major Modifier)
- **CORE**: Adds healing or regeneration effects
- **CONTROL**: Adds crowd control or utility effects
- **ATTACK**: Adds damage or offensive effects
- **DEFENSE**: Adds protection or damage reduction effects
- **MOVEMENT**: Adds speed or mobility effects

### Third-Highest Group (Secondary Modifier)
- **CORE**: Adds a minor healing or stability effect
- **CONTROL**: Adds a minor control or utility effect
- **ATTACK**: Adds a minor damage or penetration effect
- **DEFENSE**: Adds a minor protection or resistance effect
- **MOVEMENT**: Adds a minor speed or evasion effect

### Fourth-Highest Group (Minor Modifier)
- Provides a small bonus related to the group's function
- Typically 25-50% as effective as the third-highest group's modifier

### Fifth-Highest Group (Subtle Perk)
- Provides a very small bonus or unique perk
- May activate under specific conditions or with low probability

### Example Skill Modification

For a Healer with DEFENSE > CONTROL > ATTACK > MOVEMENT ranking:

**Heal Skill**:
- Base Effect: Restores 100 health
- DEFENSE (2nd): Adds a shield (50% of healing amount)
- CONTROL (3rd): Adds a minor slow effect to nearby enemies
- ATTACK (4th): Adds a small damage reflection (10% for 3 seconds)
- MOVEMENT (5th): Grants a tiny speed boost after casting (5% for 2 seconds)

## Behavior Pool

Each particle group has a pool of 15 behaviors that can be assigned to subclasses:

### Behavior Distribution

- **Role-Specific**: Behaviors are tailored to the group's function (e.g., support for CORE)
- **Main Class Category-Relevant**: Aligned with the group's overarching theme
- **Random Assignment**: Behaviors are randomly assigned to subclasses within each group

### Behavior Examples by Group

#### CORE Behaviors
- Regenerative Pulse: Heals nearby allies over time
- Energy Redistribution: Transfers health to allies with low health
- Stabilizing Aura: Reduces damage taken by nearby allies

#### CONTROL Behaviors
- Mind Link: Shares buffs between linked allies
- Tactical Analysis: Reveals enemy weaknesses
- Arcane Disruption: Interrupts enemy abilities

#### ATTACK Behaviors
- Predatory Instinct: Increases damage against low-health targets
- Berserker Rage: Increases damage as health decreases
- Precision Strike: Increases critical hit chance

#### DEFENSE Behaviors
- Reflective Shield: Returns a portion of damage to attackers
- Adaptive Armor: Increases resistance to the most recent damage type
- Guardian's Resolve: Intercepts damage targeted at nearby allies

#### MOVEMENT Behaviors
- Evasive Maneuvers: Increases dodge chance when moving
- Swift Strikes: Increases attack speed after moving
- Momentum: Increases damage based on distance traveled

## ATTACK Subclasses

The ATTACK role focuses on dealing damage and offensive capabilities. Subclasses are determined by particle count ranges and the ordering of the other four roles.

### Common Tier (43-95 particles)

#### Skirmisher
- **Primary**: Quick Slash - Rapid melee strike, 2-second cooldown
- **Secondary**: Lunge Strike - Forward thrust, 8-second cooldown
- **Unique**: Feint - Briefly boosts evasion by misdirecting foes
- **CC**: Daze - Next hit disorients for 1 second
- **Formation Trait**: Loose Cluster - Scattered particles for agility

#### Brawler
- **Primary**: Heavy Punch - Strong melee blow, 3-second cooldown
- **Secondary**: Slam - Area smash, 10-second cooldown
- **Unique**: Rage Surge - Temporarily increases damage output
- **CC**: Stun - Slam stuns for 1 second
- **Formation Trait**: Dense Fist - Tightly packed particles for impact

#### Foot Soldier
- **Primary**: Spear Thrust - Quick stab with a spear, 2-second cooldown
- **Secondary**: Polearm Sweep - Swings spear to hit multiple enemies, 10-second cooldown
- **Unique**: Formation Boost - Gains attack speed near allies, 15-second cooldown
- **CC**: Push Back - Knocks enemies back with a shield bash, 20-second cooldown
- **Formation Trait**: Phalanx Line - Particles align in a straight line, like a spear wall

#### Spellblade
- **Primary**: Arcane Cut - Melee strike with minor magical damage, 2-second cooldown
- **Secondary**: Flame Slash - Fiery melee arc, 10-second cooldown
- **Unique**: Mana Shield - Absorbs minor damage briefly, 30-second cooldown
- **CC**: Stun - Flame Slash stuns for 1 second, 25-second cooldown
- **Formation Trait**: Glowing Edges - Particles emit energy at the perimeter, like a charged blade

### Uncommon Tier (96-110 particles)

#### Warrior
- **Primary**: Sword Strike - Reliable melee attack, 2-second cooldown
- **Secondary**: Whirlwind - Spinning attack hitting nearby, 12-second cooldown
- **Unique**: Battle Cry - Boosts allied damage briefly, 30-second cooldown
- **CC**: Daze - Whirlwind dazes for 1.5 seconds, 20-second cooldown
- **Formation Trait**: Balanced Ring - Evenly spaced particles for stability, like a shield wall

#### Vanguard
- **Primary**: Greatsword Slash - Powerful swing, 3-second cooldown
- **Secondary**: Overhead Crush - Heavy downward strike, 15-second cooldown
- **Unique**: Battle Hardened - Gains damage reduction after taking hits, 25-second cooldown
- **CC**: Intimidate - Fears nearby enemies for 1.5 seconds, 20-second cooldown
- **Formation Trait**: Charging Bull - Particles form a wedge shape, like a charging formation

#### Battlemage
- **Primary**: Thunder Slash - Electrified melee strike, 2-second cooldown
- **Secondary**: Shockwave - Electrical burst around self, 12-second cooldown
- **Unique**: Elemental Charge - Next attack gains bonus damage, 30-second cooldown
- **CC**: Stun - Shockwave stuns for 1.5 seconds, 20-second cooldown
- **Formation Trait**: Pulsing Core - Particles oscillate with energy, like a capacitor

### Rare Tier (111-125 particles)

#### Berserker
- **Primary**: Frenzied Slash - Fast melee combo (2 hits), 2-second cooldown
- **Secondary**: Blood Rage - Massive area slash, 15-second cooldown
- **Unique**: Reckless Might - Damage increases as health drops, 25-second cooldown
- **CC**: Fear - Blood Rage terrifies for 2 seconds, 20-second cooldown
- **Formation Trait**: Jagged Mass - Spiky, chaotic particle arrangement, like a whirling blade

#### Samurai
- **Primary**: Katana Strike - Precise slash, 2-second cooldown
- **Secondary**: Iaido - Quick draw attack, 15-second cooldown
- **Unique**: Bushido Code - Enters focus, increasing critical hit chance, 30-second cooldown
- **CC**: Disorient - Iaido disorients, reducing accuracy for 2 seconds, 20-second cooldown
- **Formation Trait**: Zen Circle - Particles form a perfect circle, symbolizing balance

#### Pyromancer
- **Primary**: Fire Slash - Flaming melee strike, 2-second cooldown
- **Secondary**: Inferno Burst - Releases fire around self, damaging nearby, 12-second cooldown
- **Unique**: Blazing Aura - Nearby enemies take burn damage, 25-second cooldown
- **CC**: Stun - Inferno Burst stuns for 1.5 seconds, 20-second cooldown
- **Formation Trait**: Flaming Halo - Particles orbit with heat, like a fire ring

### Epic Tier (126-141 particles)

#### Gladiator
- **Primary**: Chain Strike - Two-stage melee combo, 2-second cooldown
- **Secondary**: Arena Sweep - Wide-area attack, 15-second cooldown
- **Unique**: Crowd Roar - Gains damage per enemy hit, 25-second cooldown
- **CC**: Daze - Arena Sweep dazes for 2 seconds, 20-second cooldown
- **Formation Trait**: Circular Wall - Particles form a protective ring, like an arena barrier

#### Paladin
- **Primary**: Mace Swing - Melee attack, 3-second cooldown
- **Secondary**: Holy Smite - Melee attack with holy damage, 15-second cooldown
- **Unique**: Lay on Hands - Heals self or ally, 30-second cooldown
- **CC**: Hammer of Justice - Stuns with a hammer blow for 2 seconds, 20-second cooldown
- **Formation Trait**: Holy Cross - Particles arrange in a cross shape, emitting light

### Legendary Tier (142-151 particles)

#### Warlord
- **Primary**: Command Strike - Three-stage melee combo, 2-second cooldown
- **Secondary**: War Banner - Area attack boosting allies, 20-second cooldown
- **Unique**: Rallying Call - Heals and buffs nearby allies, 30-second cooldown
- **CC**: Fear - War Banner fears for 3 seconds, 20-second cooldown
- **Formation Trait**: Standard Bearer - Particles form a tall, flag-like structure

#### Assassin
- **Primary**: Shadow Stab - Stealthy melee combo, 2-second cooldown
- **Secondary**: Backstab - High-damage finisher, 15-second cooldown
- **Unique**: Vanish - Becomes invisible briefly, 30-second cooldown
- **CC**: Stun - Backstab stuns for 2.5 seconds, 20-second cooldown
- **Formation Trait**: Phantom Shift - Particles flicker in and out, like a mirage

### Mythic Tier (152-220 particles)

#### Godslayer
- **Primary**: Divine Rend - Four-stage melee combo, 2-second cooldown
- **Secondary**: Heaven's Fall - Massive area strike, 25-second cooldown
- **Unique**: Mortal Strike - Reduces enemy healing, 30-second cooldown
- **CC**: Fear - Heaven's Fall terrifies for 4 seconds, 20-second cooldown
- **Formation Trait**: Celestial Blade - Particles form a sword-like shape, glowing intensely

## DEFENSE Subclasses

The DEFENSE role focuses on tanking, damage mitigation, and ally protection. Subclasses are determined by particle count ranges and the ordering of the other four roles.

### Common Tier (43-95 particles)

#### Sentinel
- **Primary**: Shield Bash - Melee strike, 2-second cooldown
- **Secondary**: Barrier Wall - Blocks 10% incoming damage, 10-second cooldown
- **Unique**: Hold Ground - +5% damage reduction for 5 seconds, 20-second cooldown
- **CC**: Stagger - Bash slows enemies by 20% for 3 seconds, 15-second cooldown
- **Formation Trait**: Shield Line - Particles align in a flat plane, like a shield wall

#### Guard
- **Primary**: Hammer Strike - Heavy melee hit, 3-second cooldown
- **Secondary**: Stone Skin - Reduces damage taken by 10% for 5 seconds, 12-second cooldown
- **Unique**: Protect Ally - Redirects 10% damage from an ally to self, 20-second cooldown
- **CC**: Taunt - Forces one enemy to attack for 2 seconds, 15-second cooldown
- **Formation Trait**: Solid Core - Tight particle cluster, like a rock

#### Warden
- **Primary**: Mace Swing - Steady melee attack, 2-second cooldown
- **Secondary**: Iron Stance - +10% max HP shield, 10-second cooldown
- **Unique**: Vigilance - +5% resistance to CC for 5 seconds, 20-second cooldown
- **CC**: Daze - Swing dazes for 1 second, 15-second cooldown
- **Formation Trait**: Circular Guard - Particles orbit tightly, like a defensive ring

#### Bulwark
- **Primary**: Slam - Ground-pound melee, 3-second cooldown
- **Secondary**: Fortify - +10% defense for 5 seconds, 12-second cooldown
- **Unique**: Brace - Absorbs next hit up to 10% max HP, 20-second cooldown
- **CC**: Knockback - Slam pushes enemies back, 15-second cooldown
- **Formation Trait**: Thick Shell - Particles form a dense outer layer, like armor plating

### Uncommon Tier (96-110 particles)

#### Defender
- **Primary**: Axe Chop - Strong melee strike, 2-second cooldown
- **Secondary**: Steel Wall - Blocks 15% incoming damage, 10-second cooldown
- **Unique**: Shield Ally - Grants an ally a 10% max HP shield, 20-second cooldown
- **CC**: Stun - Chop stuns for 1.5 seconds, 15-second cooldown
- **Formation Trait**: Reinforced Line - Particles stack in a sturdy row, like a barricade

#### Protector
- **Primary**: Flail Swing - Wide melee attack, 3-second cooldown
- **Secondary**: Hardened Skin - Reduces damage by 15% for 5 seconds, 12-second cooldown
- **Unique**: Rally Point - +10% defense to nearby allies, 20-second cooldown
- **CC**: Taunt - Forces enemies to attack for 3 seconds, 15-second cooldown
- **Formation Trait**: Protective Spiral - Particles spiral inward, like a shield funnel

#### Ironclad
- **Primary**: Hammer Smash - Heavy melee blow, 2-second cooldown
- **Secondary**: Iron Fortress - +15% max HP shield, 10-second cooldown
- **Unique**: Counterstrike - Reflects 10% damage taken, 20-second cooldown
- **CC**: Daze - Smash dazes for 1.5 seconds, 15-second cooldown
- **Formation Trait**: Armored Lattice - Particles interlock like chainmail

### Rare Tier (111-125 particles)

#### Barricade
- **Primary**: Greatshield Slam - Defensive melee hit, 2-second cooldown
- **Secondary**: Bastion Wall - Blocks 20% incoming damage, 10-second cooldown
- **Unique**: Stand Firm - +15% damage reduction for 5 seconds, 20-second cooldown
- **CC**: Stun - Slam stuns for 2 seconds, 15-second cooldown
- **Formation Trait**: Towering Shield - Particles stack vertically, like a tower shield

#### Juggernaut
- **Primary**: Maul Strike - Crushing melee attack, 3-second cooldown
- **Secondary**: Titan Skin - Reduces damage by 20% for 5 seconds, 12-second cooldown
- **Unique**: Unbreakable - Immune to CC for 5 seconds, 20-second cooldown
- **CC**: Knockback - Strike pushes enemies back, 15-second cooldown
- **Formation Trait**: Heavy Mass - Particles clump densely, like a boulder

#### Knight Templar
- **Primary**: Sword Slash - Precise melee strike, 2-second cooldown
- **Secondary**: Holy Ward - +20% max HP shield, 10-second cooldown
- **Unique**: Sanctified Ground - +10% defense to allies in range, 20-second cooldown
- **CC**: Taunt - Forces enemies to attack for 3 seconds, 15-second cooldown
- **Formation Trait**: Sacred Circle - Particles form a glowing ring, like a holy barrier

### Epic Tier (126-141 particles)

#### Fortress
- **Primary**: Hammer Crush - Powerful melee blow, 2-second cooldown
- **Secondary**: Citadel Wall - Blocks 25% incoming damage, 10-second cooldown
- **Unique**: Iron Will - +20% damage reduction for 5 seconds, 20-second cooldown
- **CC**: Stun - Crush stuns for 2.5 seconds, 15-second cooldown
- **Formation Trait**: Bastion Core - Particles form a fortified central mass, like a castle keep

#### Crusader
- **Primary**: Blade Strike - Holy melee attack, 2-second cooldown
- **Secondary**: Divine Aegis - Reduces damage by 25% for 5 seconds, 12-second cooldown
- **Unique**: Martyr's Gift - Redirects 20% damage from allies to self, 20-second cooldown
- **CC**: Daze - Strike dazes for 2 seconds, 15-second cooldown
- **Formation Trait**: Radiant Cross - Particles arrange in a cross, emitting protective light

### Legendary Tier (142-151 particles)

#### Colossus
- **Primary**: Titan Smash - Devastating melee hit, 2-second cooldown
- **Secondary**: Unyielding Fortress - Blocks 30% incoming damage, 10-second cooldown
- **Unique**: Giant's Might - +25% max HP for 5 seconds, 20-second cooldown
- **CC**: Knockback - Smash pushes enemies back, 15-second cooldown
- **Formation Trait**: Monolith Form - Particles stack into a towering pillar, like a statue

#### Paladin Lord
- **Primary**: Sacred Blade - Holy melee strike, 2-second cooldown
- **Secondary**: Celestial Shield - +30% max HP shield, 10-second cooldown
- **Unique**: Holy Vow - Grants allies 15% damage reduction, 20-second cooldown
- **CC**: Stun - Blade stuns for 3 seconds, 15-second cooldown
- **Formation Trait**: Divine Bastion - Particles form a glowing fortress shape

### Mythic Tier (152-220 particles)

#### Indomitable
- **Primary**: Eternal Strike - Unstoppable melee attack, 2-second cooldown
- **Secondary**: Invincible Aegis - Reduces damage by 40% for 5 seconds, 12-second cooldown
- **Unique**: Last Stand - Revives with 50% HP once per battle, 60-second cooldown
- **CC**: Taunt - Forces all enemies to attack for 4 seconds, 15-second cooldown
- **Formation Trait**: Eternal Citadel - Particles form an impregnable fortress, glowing with power

## MOVEMENT Subclasses

The MOVEMENT role focuses on agility, evasion, and hybrid capabilities. Subclasses are determined by particle count ranges and the ordering of the other four roles.

### Common Tier (43-95 particles)

#### Scout
- **Primary**: Quick Shot - Fast ranged attack, 2-second cooldown
- **Secondary**: Trap - Deploys a slowing snare, 10-second cooldown
- **Unique**: Recon - Briefly reveals hidden enemies for the party, 20-second cooldown
- **CC**: Daze - Shot disorients foes for 1 second, 15-second cooldown
- **Formation Trait**: Fin-like Extensions - Particles extend outward, boosting speed

#### Thief
- **Primary**: Dagger Strike - Swift melee hit, 2-second cooldown
- **Secondary**: Backstab - High-damage stealth attack, 10-second cooldown
- **Unique**: Pickpocket - Steals minor resources from enemies, aiding party economy, 20-second cooldown
- **CC**: Stun - Backstab stuns for 1 second, 15-second cooldown
- **Formation Trait**: Shadow Cloak - Particles dim for stealth

#### Acrobat
- **Primary**: Tumbling Strike - Melee hit with a dodge roll, 2-second cooldown
- **Secondary**: Flip Kick - Repels enemies, 10-second cooldown
- **Unique**: Evasive Maneuver - Grants +10% dodge chance to self for 5 seconds, 20-second cooldown
- **CC**: Knockback - Flip Kick pushes foes back, 15-second cooldown
- **Formation Trait**: Elastic Tendrils - Particles stretch like springs

#### Archer
- **Primary**: Arrow Shot - Basic ranged attack, 2-second cooldown
- **Secondary**: Volley - Fires multiple arrows, 12-second cooldown
- **Unique**: Steady Aim - Next shot gains bonus damage, 20-second cooldown
- **CC**: Daze - Volley dazes for 1 second, 15-second cooldown
- **Formation Trait**: Linear Stretch - Particles align like a bowstring

### Uncommon Tier (96-110 particles)

#### Ranger
- **Primary**: Swift Shot - Quick ranged attack, 2-second cooldown
- **Secondary**: Trap Arrow - Damages and slows, 10-second cooldown
- **Unique**: Nature's Call - Summons vines to lash enemies, aiding party control, 20-second cooldown
- **CC**: Fear - Trap Arrow makes foes flee for 1 second, 15-second cooldown
- **Formation Trait**: Camouflaged Spread - Particles blend into terrain

#### Swashbuckler
- **Primary**: Rapier Thrust - Precise melee strike, 2-second cooldown
- **Secondary**: Parry - Blocks next attack, 10-second cooldown
- **Unique**: Riposte - Counters after parry with bonus damage, 20-second cooldown
- **CC**: Disarm - Thrust disarms for 2 seconds, 15-second cooldown
- **Formation Trait**: Flowing Lines - Particles move fluidly

#### Shadowstep
- **Primary**: Shadow Strike - Teleporting melee attack, 2-second cooldown
- **Secondary**: Smoke Bomb - Creates a blinding cloud, 12-second cooldown
- **Unique**: Vanish - Grants brief invisibility, 20-second cooldown
- **CC**: Blind - Smoke Bomb blinds for 1.5 seconds, 15-second cooldown
- **Formation Trait**: Flickering Shadows - Particles phase like a mirage

### Rare Tier (111-125 particles)

#### Sharpshooter
- **Primary**: Piercing Shot - High-damage ranged attack, 3-second cooldown
- **Secondary**: Snipe - Long-range precision shot, 15-second cooldown
- **Unique**: Eagle Eye - Boosts range and accuracy, 20-second cooldown
- **CC**: Daze - Snipe dazes for 2 seconds, 15-second cooldown
- **Formation Trait**: Focused Line - Particles align tightly

#### Ninja
- **Primary**: Shuriken Throw - Quick ranged attack, 2-second cooldown
- **Secondary**: Shadow Clone - Deploys a decoy, 12-second cooldown
- **Unique**: Stealth Strike - Bonus damage from stealth, 20-second cooldown
- **CC**: Stun - Throw stuns for 1.5 seconds, 15-second cooldown
- **Formation Trait**: Blurred Edges - Particles vibrate rapidly

#### Duelist
- **Primary**: Rapier Combo - Two-stage melee attack, 2-second cooldown
- **Secondary**: Lunge - Forward dash attack, 10-second cooldown
- **Unique**: En Garde - +15% critical hit chance for 5 seconds, 20-second cooldown
- **CC**: Disarm - Combo disarms for 2 seconds, 15-second cooldown
- **Formation Trait**: Elegant Spiral - Particles twist gracefully

### Epic Tier (126-141 particles)

#### Sniper
- **Primary**: Long Shot - Powerful ranged attack, 3-second cooldown
- **Secondary**: Headshot - Critical-damage shot, 18-second cooldown
- **Unique**: Camouflage - Reduces enemy detection, 20-second cooldown
- **CC**: Stun - Headshot stuns for 2 seconds, 15-second cooldown
- **Formation Trait**: Stealth Point - Particles collapse inward

#### Assassin
- **Primary**: Poison Dagger - Melee with damage-over-time, 2-second cooldown
- **Secondary**: Garrote - Choking attack, 12-second cooldown
- **Unique**: Marked for Death - Target takes +20% damage, boosting party DPS, 20-second cooldown
- **CC**: Silence - Garrote silences for 2 seconds, 15-second cooldown
- **Formation Trait**: Hidden Blade - Particles form a sharp edge

### Legendary Tier (142-151 particles)

#### Blademaster
- **Primary**: Blade Dance - Three-stage melee combo, 2-second cooldown
- **Secondary**: Whirlwind Strike - Spinning attack, 15-second cooldown
- **Unique**: Master's Focus - +25% critical damage for 5 seconds, 20-second cooldown
- **CC**: Daze - Strike dazes for 2.5 seconds, 15-second cooldown
- **Formation Trait**: Razor's Edge - Particles align sharply

#### Phantom
- **Primary**: Ghost Strike - Teleporting melee attack, 2-second cooldown
- **Secondary**: Spectral Shot - Ranged stealth attack, 12-second cooldown
- **Unique**: Ethereal Form - Briefly intangible, evading damage, 20-second cooldown
- **CC**: Fear - Shot fears for 2 seconds, 15-second cooldown
- **Formation Trait**: Wraith Cloak - Particles shimmer faintly

### Mythic Tier (152-220 particles)

#### Windwalker
- **Primary**: Gale Slash - Four-stage melee combo, 2-second cooldown
- **Secondary**: Tempest Fury - Area whirlwind attack, 20-second cooldown
- **Unique**: Storm's Blessing - +30% movement speed for all allies, enhancing party mobility, 20-second cooldown
- **CC**: Knockback - Fury repels enemies, 15-second cooldown
- **Formation Trait**: Zephyr Wings - Particles form wing-like shapes

## Integration with Traits

The class system integrates with the trait system in several ways:

### Formation Traits
- Affect the spatial arrangement of particles, which can enhance class abilities
- Example: A "Spherical Shell" formation for a Tank enhances the Shield ability

### Behavior Traits
- Affect how particles interact, which can modify class behaviors
- Example: "Reactive Armor" behavior for a Tank improves damage reflection

### Mutation Traits
- Provide direct bonuses to stats or abilities
- Can enhance class-specific skills or provide new capabilities
- Example: "+15% Defense" mutation makes a Tank's Shield ability more effective

## Implementation Guidelines

### 1. Class Determination

```typescript
function determineClass(particleGroups: Record<string, number>): {
  mainClass: string;
  subclass: string;
  ranking: string[];
} {
  // Sort groups by particle count (descending)
  const ranking = Object.entries(particleGroups)
    .sort((a, b) => b[1] - a[1])
    .map(([group]) => group);

  // Determine main class from highest group
  const mainClassMap: Record<string, string> = {
    'CORE': 'Healer',
    'CONTROL': 'Caster',
    'ATTACK': 'Striker',
    'DEFENSE': 'Tank',
    'MOVEMENT': 'Rogue'
  };

  const mainClass = mainClassMap[ranking[0]];

  // Determine subclass name based on second highest
  const subclassPrefixMap: Record<string, string> = {
    'CORE': 'Vital',
    'CONTROL': 'Arcane',
    'ATTACK': 'Battle',
    'DEFENSE': 'Guardian',
    'MOVEMENT': 'Swift'
  };

  const subclass = `${subclassPrefixMap[ranking[1]]} ${mainClass}`;

  return { mainClass, subclass, ranking };
}
```

### 2. Skill Modification

```typescript
function modifySkill(
  skill: Skill,
  ranking: string[],
  traits: Trait[]
): Skill {
  const modifiedSkill = { ...skill };

  // Apply second group modifier (major)
  applyGroupModifier(modifiedSkill, ranking[1], 1.0, traits);

  // Apply third group modifier (secondary)
  applyGroupModifier(modifiedSkill, ranking[2], 0.6, traits);

  // Apply fourth group modifier (minor)
  applyGroupModifier(modifiedSkill, ranking[3], 0.3, traits);

  // Apply fifth group modifier (subtle)
  applyGroupModifier(modifiedSkill, ranking[4], 0.1, traits);

  return modifiedSkill;
}
```

### 3. Trait Integration

```typescript
function applyTraitsToClass(
  creature: Creature,
  traits: Trait[]
): void {
  // Apply formation traits
  const formationTraits = traits.filter(t => t.type === 'formation');
  formationTraits.forEach(trait => {
    applyFormationTraitToClass(creature, trait);
  });

  // Apply behavior traits
  const behaviorTraits = traits.filter(t => t.type === 'behavior');
  behaviorTraits.forEach(trait => {
    applyBehaviorTraitToClass(creature, trait);
  });

  // Apply mutation traits
  const mutationTraits = traits.filter(t => t.type === 'mutation');
  mutationTraits.forEach(trait => {
    applyMutationTraitToClass(creature, trait);
  });
}
```

### 4. Testing and Balance

- Test each main class with various subclass configurations
- Ensure all 120 subclasses have unique gameplay characteristics
- Balance skill modifiers to ensure no subclass is overpowered
- Verify trait interactions with classes work as expected
