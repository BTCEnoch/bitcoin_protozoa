# Scaling Functions and Stat Formulas

This document defines the scaling functions and stat formulas for the Bitcoin Protozoa particle roles.

## Particle Scaling Overview

Each creature has 500 particles distributed across five roles:
- CORE: 40-220 particles
- CONTROL: 40-220 particles
- MOVEMENT: 40-220 particles
- DEFENSE: 40-220 particles
- ATTACK: 40-220 particles

The distribution follows these rules:
- Each role receives 40 base particles (200 total)
- Each role receives at least 3 additional particles
- No role can receive more than 180 additional particles
- The remaining particles are distributed randomly

The effectiveness of particles scales with count, but with diminishing returns above 150 particles.

## Effective Particle Calculation

To implement diminishing returns, we use an "effective particle count" calculation:

```
if (actualCount <= 150) {
    effectiveCount = actualCount;
} else {
    effectiveCount = 150 + (actualCount - 150) * 0.5;
}
```

This means:
- 150 particles = 150 effective particles (100% efficiency)
- 200 particles = 175 effective particles (87.5% efficiency)
- 220 particles = 185 effective particles (84.1% efficiency)

## Role-Specific Scaling Functions

### CORE Scaling

CORE particles primarily affect health, stability, and energy regeneration.

#### Health Points (HP)
```
baseHP = 100;
hpPerParticle = 10;
HP = baseHP + (effectiveCoreParticles * hpPerParticle);
```

Example values:
- 40 particles: 100 + (40 * 10) = 500 HP
- 100 particles: 100 + (100 * 10) = 1,100 HP
- 150 particles: 100 + (150 * 10) = 1,600 HP
- 200 particles: 100 + (175 * 10) = 1,850 HP
- 220 particles: 100 + (185 * 10) = 1,950 HP

#### Stability Rating
```
baseStability = 20;
stabilityPerParticle = 0.5;
stability = baseStability + (effectiveCoreParticles * stabilityPerParticle);
```

Example values:
- 40 particles: 20 + (40 * 0.5) = 40 stability
- 100 particles: 20 + (100 * 0.5) = 70 stability
- 150 particles: 20 + (150 * 0.5) = 95 stability
- 200 particles: 20 + (175 * 0.5) = 107.5 stability
- 220 particles: 20 + (185 * 0.5) = 112.5 stability

#### Energy Regeneration
```
baseRegen = 5;
regenPerParticle = 0.1;
energyRegen = baseRegen + (effectiveCoreParticles * regenPerParticle);
```

Example values:
- 40 particles: 5 + (40 * 0.1) = 9 energy regen
- 100 particles: 5 + (100 * 0.1) = 15 energy regen
- 150 particles: 5 + (150 * 0.1) = 20 energy regen
- 200 particles: 5 + (175 * 0.1) = 22.5 energy regen
- 220 particles: 5 + (185 * 0.1) = 23.5 energy regen

### CONTROL Scaling

CONTROL particles primarily affect ability power, control duration, and cooldown reduction.

#### Ability Power (AP)
```
baseAP = 50;
apPerParticle = 1;
abilityPower = baseAP + (effectiveControlParticles * apPerParticle);
```

Example values:
- 40 particles: 50 + (40 * 1) = 90 AP
- 100 particles: 50 + (100 * 1) = 150 AP
- 150 particles: 50 + (150 * 1) = 200 AP
- 200 particles: 50 + (175 * 1) = 225 AP
- 220 particles: 50 + (185 * 1) = 235 AP

#### Control Duration
```
baseDuration = 2; // seconds
durationPerParticle = 0.02; // seconds
controlDuration = baseDuration + (effectiveControlParticles * durationPerParticle);
```

Example values:
- 40 particles: 2 + (40 * 0.02) = 2.8 seconds
- 100 particles: 2 + (100 * 0.02) = 4 seconds
- 150 particles: 2 + (150 * 0.02) = 5 seconds
- 200 particles: 2 + (175 * 0.02) = 5.5 seconds
- 220 particles: 2 + (185 * 0.02) = 5.7 seconds

#### Cooldown Reduction (CDR)
```
baseCDR = 0;
cdrPerParticle = 0.1; // percentage points
maxCDR = 40; // percentage cap
rawCDR = baseCDR + (effectiveControlParticles * cdrPerParticle);
cooldownReduction = min(rawCDR, maxCDR);
```

Example values:
- 40 particles: min(0 + (40 * 0.1), 40) = 4% CDR
- 100 particles: min(0 + (100 * 0.1), 40) = 10% CDR
- 150 particles: min(0 + (150 * 0.1), 40) = 15% CDR
- 200 particles: min(0 + (175 * 0.1), 40) = 17.5% CDR
- 220 particles: min(0 + (185 * 0.1), 40) = 18.5% CDR

### MOVEMENT Scaling

MOVEMENT particles primarily affect speed, evasion, and maneuverability.

#### Movement Speed
```
baseSpeed = 100; // percentage of base speed
speedPerParticle = 0.5; // percentage points
movementSpeed = baseSpeed + (effectiveMovementParticles * speedPerParticle);
```

Example values:
- 40 particles: 100 + (40 * 0.5) = 120% speed
- 100 particles: 100 + (100 * 0.5) = 150% speed
- 150 particles: 100 + (150 * 0.5) = 175% speed
- 200 particles: 100 + (175 * 0.5) = 187.5% speed
- 220 particles: 100 + (185 * 0.5) = 192.5% speed

#### Evasion Rating
```
baseEvasion = 5; // percentage
evasionPerParticle = 0.15; // percentage points
maxEvasion = 50; // percentage cap
rawEvasion = baseEvasion + (effectiveMovementParticles * evasionPerParticle);
evasion = min(rawEvasion, maxEvasion);
```

Example values:
- 40 particles: min(5 + (40 * 0.15), 50) = 11% evasion
- 100 particles: min(5 + (100 * 0.15), 50) = 20% evasion
- 150 particles: min(5 + (150 * 0.15), 50) = 27.5% evasion
- 200 particles: min(5 + (175 * 0.15), 50) = 31.25% evasion
- 220 particles: min(5 + (185 * 0.15), 50) = 32.75% evasion

#### Maneuverability
```
baseManeuverability = 10;
maneuverabilityPerParticle = 0.2;
maneuverability = baseManeuverability + (effectiveMovementParticles * maneuverabilityPerParticle);
```

Example values:
- 40 particles: 10 + (40 * 0.2) = 18 maneuverability
- 100 particles: 10 + (100 * 0.2) = 30 maneuverability
- 150 particles: 10 + (150 * 0.2) = 40 maneuverability
- 200 particles: 10 + (175 * 0.2) = 45 maneuverability
- 220 particles: 10 + (185 * 0.2) = 47 maneuverability

### DEFENSE Scaling

DEFENSE particles primarily affect damage reduction, resistance, and shield strength.

#### Damage Reduction
```
baseDR = 10; // percentage
drPerParticle = 0.15; // percentage points
maxDR = 60; // percentage cap
rawDR = baseDR + (effectiveDefenseParticles * drPerParticle);
damageReduction = min(rawDR, maxDR);
```

Example values:
- 40 particles: min(10 + (40 * 0.15), 60) = 16% DR
- 100 particles: min(10 + (100 * 0.15), 60) = 25% DR
- 150 particles: min(10 + (150 * 0.15), 60) = 32.5% DR
- 200 particles: min(10 + (175 * 0.15), 60) = 36.25% DR
- 220 particles: min(10 + (185 * 0.15), 60) = 37.75% DR

#### Resistance Rating
```
baseResistance = 5;
resistancePerParticle = 0.2;
resistance = baseResistance + (effectiveDefenseParticles * resistancePerParticle);
```

Example values:
- 40 particles: 5 + (40 * 0.2) = 13 resistance
- 100 particles: 5 + (100 * 0.2) = 25 resistance
- 150 particles: 5 + (150 * 0.2) = 35 resistance
- 200 particles: 5 + (175 * 0.2) = 40 resistance
- 220 particles: 5 + (185 * 0.2) = 42 resistance

#### Shield Strength
```
baseShield = 0;
shieldPerParticle = 2;
shieldStrength = baseShield + (effectiveDefenseParticles * shieldPerParticle);
```

Example values:
- 40 particles: 0 + (40 * 2) = 80 shield
- 100 particles: 0 + (100 * 2) = 200 shield
- 150 particles: 0 + (150 * 2) = 300 shield
- 200 particles: 0 + (175 * 2) = 350 shield
- 220 particles: 0 + (185 * 2) = 370 shield

### ATTACK Scaling

ATTACK particles primarily affect damage output, critical chance, and penetration.

#### Damage Output
```
baseDamage = 20;
damagePerParticle = 0.8;
damageOutput = baseDamage + (effectiveAttackParticles * damagePerParticle);
```

Example values:
- 40 particles: 20 + (40 * 0.8) = 52 damage
- 100 particles: 20 + (100 * 0.8) = 100 damage
- 150 particles: 20 + (150 * 0.8) = 140 damage
- 200 particles: 20 + (175 * 0.8) = 160 damage
- 220 particles: 20 + (185 * 0.8) = 168 damage

#### Critical Chance
```
baseCrit = 5; // percentage
critPerParticle = 0.1; // percentage points
maxCrit = 40; // percentage cap
rawCrit = baseCrit + (effectiveAttackParticles * critPerParticle);
criticalChance = min(rawCrit, maxCrit);
```

Example values:
- 40 particles: min(5 + (40 * 0.1), 40) = 9% crit
- 100 particles: min(5 + (100 * 0.1), 40) = 15% crit
- 150 particles: min(5 + (150 * 0.1), 40) = 20% crit
- 200 particles: min(5 + (175 * 0.1), 40) = 22.5% crit
- 220 particles: min(5 + (185 * 0.1), 40) = 23.5% crit

#### Penetration
```
basePen = 0; // percentage
penPerParticle = 0.15; // percentage points
maxPen = 50; // percentage cap
rawPen = basePen + (effectiveAttackParticles * penPerParticle);
penetration = min(rawPen, maxPen);
```

Example values:
- 40 particles: min(0 + (40 * 0.15), 50) = 6% pen
- 100 particles: min(0 + (100 * 0.15), 50) = 15% pen
- 150 particles: min(0 + (150 * 0.15), 50) = 22.5% pen
- 200 particles: min(0 + (175 * 0.15), 50) = 26.25% pen
- 220 particles: min(0 + (185 * 0.15), 50) = 27.75% pen

## Combined Stat Formulas

Some stats are influenced by multiple roles. Here are formulas for combined stats:

### Total Health
```
totalHP = coreHP * (1 + (defenseParticles / 1000));
```

### Effective Damage
```
effectiveDamage = attackDamage * (1 + (controlParticles / 1000));
```

### Movement Efficiency
```
movementEfficiency = movementSpeed * (1 - (coreParticles / 1000));
```

### Ability Effectiveness
```
abilityEffectiveness = controlAP * (1 + (attackParticles / 1000));
```

### Defense Effectiveness
```
defenseEffectiveness = defenseDR * (1 + (coreParticles / 1000));
```

## Class System Thresholds

If implementing the class system, these are the thresholds for class determination:

### Dominant Class (150+ particles)
- CORE: Tank class
- CONTROL: Mage class
- MOVEMENT: Scout class
- DEFENSE: Guardian class
- ATTACK: Striker class

### Hybrid Class (Two roles with 130+ particles)
- CORE + CONTROL: Battlemage
- CORE + MOVEMENT: Juggernaut
- CORE + DEFENSE: Sentinel
- CORE + ATTACK: Berserker
- CONTROL + MOVEMENT: Spellblade
- CONTROL + DEFENSE: Enchanter
- CONTROL + ATTACK: Warlock
- MOVEMENT + DEFENSE: Ranger
- MOVEMENT + ATTACK: Assassin
- DEFENSE + ATTACK: Paladin

### Balanced Class (No role > 130 particles)
- Versatile

## Implementation Notes

1. **Capping and Flooring**
   - All stats should have minimum and maximum values
   - Apply caps after all calculations
   - Ensure no stat can go below its minimum value

2. **Rounding**
   - Round all final stat values to appropriate precision
   - HP, shield, and damage should be integers
   - Percentages can be displayed with 1 decimal place

3. **Scaling Adjustments**
   - These formulas may need adjustment based on testing
   - Balance testing should verify that all roles are viable
   - Extreme distributions should be powerful but not overwhelming

4. **Visualization**
   - Stats should be clearly displayed in the UI
   - Consider color-coding stats based on their value relative to average
   - Show both raw and effective particle counts
