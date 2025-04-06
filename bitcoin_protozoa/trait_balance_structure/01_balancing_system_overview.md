# Bitcoin Protozoa Balancing System

This document outlines the balancing system for Bitcoin Protozoa, where creatures are defined by 500 particles distributed across five groups: CORE, CONTROL, ATTACK, DEFENSE, and MOVEMENT. These groups determine a creature's stats, traits, abilities, and perks. The system ensures fairness while preserving the thrill of rare luck, making it possible—though astronomically unlikely—to generate a creature with the maximum potential in every category. Players are incentivized to collect diverse creatures to counter various builds, fostering a rock-paper-scissors combat dynamic.

## 1. Particle Distribution

### Overview
Each creature has 500 particles allocated across five groups:

- **CORE**: Constitution/HP (durability)
- **CONTROL**: Intelligence (ability power, control effects)
- **ATTACK**: Damage (offensive strength)
- **DEFENSE**: Damage mitigation (resilience)
- **MOVEMENT**: Agility (speed, evasion)

### Distribution Method
- **Base Allocation**: Each group receives a guaranteed 40 particles (totaling 200 particles).
- **Additional Particles**: The remaining 300 particles are distributed using direct allocation rather than percentages.
  - Each group receives at least 3 additional particles.
  - No group can receive more than 180 additional particles.
  - The remaining particles are distributed randomly.
- **Range per Group**: 40 (base) + 3 to 180 (additional), totaling 43 to 220 particles.
- **Example**: A distribution might assign [73, 63, 83, 53, 28] additional particles, resulting in [113, 103, 123, 93, 68] total particles.

### Balancing Mechanisms
- **Diminishing Returns**: Beyond 150 particles in a group, each additional particle contributes less (e.g., 0.5x effectiveness), capping practical benefits at high values.
- **Minimum Viability**: Even with 43 particles, a group remains functional due to base stat formulas (e.g., HP = CORE × 10 + 100).
- **Rarity of Extremes**: A creature with 220 particles in one group requires a highly skewed random distribution, with odds of approximately 1 in 1 million.

## 2. Trait Categories and Rarity

### Trait Categories
Each creature receives one trait per category, with five categories:

1. **Stat Buffs**: Enhances a stat (e.g., +15% Attack).
2. **Special Formations**: Alters combat positioning (e.g., shield allies).
3. **Special Abilities**: Unique skills (e.g., poison, teleport).
4. **Special Behaviors**: Reactive effects (e.g., retaliate when hit).
5. **Strange Occurrences**: Rare, situational effects (e.g., revive once per battle).

### Rarity Levels
Traits are assigned across six rarity tiers:

- **Common**: Minor boosts (e.g., +5% HP, 49.5% chance).
- **Uncommon**: Moderate boosts (e.g., +10% DEFENSE, 30% chance).
- **Rare**: Significant boosts (e.g., +20% MOVEMENT, 15% chance).
- **Epic**: Powerful effects (e.g., chain lightning, 4% chance).
- **Legendary**: Game-changing effects (e.g., double damage for 5 seconds, 1% chance).
- **Mythic**: Extraordinary effects (e.g., time manipulation, 0.5% chance).

### Assignment and Rarity Odds
- **Independent Rolls**: Each category's trait is rolled separately.
- **Adjusted Odds for Rarity**:
  - Common: 49.5%
  - Uncommon: 30%
  - Rare: 15%
  - Epic: 4%
  - Legendary: 1%
  - Mythic: 0.5%
- **Perfect Creature Odds**: A creature with five Mythic traits has a 0.5% × 0.5% × 0.5% × 0.5% × 0.5% = 1 in 3.2 trillion chance.

## 3. Mutation Perks

### Overview
Mutation perks are rare bonuses that enhance a creature beyond its base traits, adding depth and unpredictability.

### Types of Mutation Perks
- **Stat Buffs**: +10% to +25% to a random stat.
- **Special Abilities**: Unique skills (e.g., invisibility for 3 seconds).
- **Particle Additions**: +5 to +20 particles to a random group.

### Assignment and Rarity
- **Chance of Perks**:
  - 50% chance of 1 perk.
  - 10% chance of 2 perks.
  - 1% chance of 3 perks.
- **Perk Rarity**:
  - Common: 59.5% (e.g., +5% HP).
  - Uncommon: 25% (e.g., +10% MOVEMENT).
  - Rare: 10% (e.g., +10 particles).
  - Epic: 4% (e.g., +15 particles).
  - Legendary: 1% (e.g., +20 particles).
  - Mythic: 0.5% (e.g., +25 particles, max 1 per creature).
- **Caps**: Total particle additions capped at +50 particles across all perks.

### Balancing Mechanisms
- **Diminishing Returns**: Particle additions beyond 150 in a group have 0.5x effect.
- **Max Perks**: Limited to 3 perks, with a 1 in 8 billion chance of three Mythic perks.

## 4. Class System

### Overview
Classes add strategic depth by assigning roles based on particle distribution, enhancing combat variety. The system creates 120 unique subclasses, each with distinct gameplay characteristics.

### Main Class Determination
- **Main Class** (determined by highest particle group):
  - CORE: Healer (high HP, healing)
  - CONTROL: Caster (crowd control, utility)
  - ATTACK: Striker (burst damage)
  - DEFENSE: Tank (mitigation, ally protection)
  - MOVEMENT: Rogue (speed, evasion)

### Subclass Determination
- **Subclass** (determined by the full ranking of all five groups):
  - Main class determined by highest group
  - Subclass determined by order of remaining four groups
  - 24 subclasses per main class (4! permutations)
  - 120 total unique subclasses (5 × 24)

### Class Skills and Modifiers
- **Base Skills**: Each main class has 3-5 unique skills (e.g., Healer: Heal, Restore)
- **Subclass Modifiers**: Skills are modified based on group ranking:
  - Second-highest group: Major skill modification
  - Third-highest group: Secondary effect
  - Fourth-highest group: Minor bonus
  - Fifth-highest group: Subtle perk

### Example Subclass
For a Healer with DEFENSE > CONTROL > ATTACK > MOVEMENT ranking:
- Base Heal skill: Restores 100 health
- DEFENSE (2nd): Adds a shield (50% of healing)
- CONTROL (3rd): Adds a minor slow effect to nearby enemies
- ATTACK (4th): Adds a small damage reflection (10% for 3 seconds)
- MOVEMENT (5th): Grants a tiny speed boost after casting (5% for 2 seconds)

### Balancing
- **Unique Gameplay**: All 120 subclasses have distinct characteristics
- **Counterplay**: Tanks counter Strikers, Rogues evade Casters, etc.
- **Skill Synergy**: Traits enhance class skills for further customization

## 5. Points-Based Balancing System

### Overview
A points system quantifies creature power for balance, targeting a range of 100–150 points for most creatures.

### Point Allocation
- **Particles**:
  - ATTACK: 1 point
  - DEFENSE: 0.8 points
  - CORE: 0.6 points
  - CONTROL: 0.7 points
  - MOVEMENT: 0.5 points
- **Traits and Perks**:
  - Common: 1 point
  - Uncommon: 3 points
  - Rare: 7 points
  - Epic: 15 points
  - Legendary: 30 points
  - Mythic: 50 points
- **Classes**: +20 points (dominant), +10 points (hybrid), +0 (versatile).

### Target Range and Outliers
- **Average Creature**: ~120 points (e.g., balanced particles, mixed traits).
- **Rare Outliers**: >200 points possible with extreme particles, Legendary traits, and perks (odds < 1 in 100 million).

## 6. Combat Dynamics and Counterplay

### Design Goals
- **No Perfect Build**: Every creature has strengths and weaknesses.
- **Collection Incentive**: Players need multiple creatures to counter diverse threats.

### Examples of Counterplay
- **Tank (High DEFENSE)**: Beats Strikers but loses to Casters (control bypasses HP).
- **Striker (High ATTACK)**: Shreds Rogues but struggles against Tanks.
- **Rogue (High MOVEMENT)**: Evades Tanks but falls to Strikers' burst damage.

### Rare Luck Impact
A "god-tier" creature (e.g., 220 ATTACK, Legendary traits) dominates most matchups but remains vulnerable to specific counters (e.g., high-CONTROL Casters).

## 7. Testing and Refinement

### Methods
- **RNG Simulations**: Verify distribution curves and rarity odds.
- **Playtesting**: Test extreme builds (e.g., 220 MOVEMENT Rogue) for viability and counters.
- **Adjustments**: Tweak point values or caps if outliers disrupt balance.

### Community Input
- **Beta Phase**: Collect player data on top creatures.
- **Meta Analysis**: Adjust traits or perks if a single build dominates.

## 8. Long-Term Flexibility

### Scalability
- **Modular Traits**: Add new traits or perks without overhauling the system.
- **Class Updates**: Introduce hybrid classes or new roles as needed.

### Rebalancing
- **Seasonal Updates**: Adjust rarity odds or caps based on player trends.
- **Preserve Rarity**: Maintain the allure of near-impossible "perfect" creatures.

## Conclusion

This balancing system for Bitcoin Protozoa achieves a delicate equilibrium: it's streamlined for accessibility, balanced for fairness, and thrilling due to the minuscule chance of generating a top-tier creature (odds on the order of 1 in 3.2 trillion for max particles, five Mythic traits, and three Mythic perks). Players will spend hours hunting for edges—whether it's a 220-ATTACK Striker or a triple-perk Tank—while building diverse collections to counter opponents. The rock-paper-scissors dynamic ensures no single creature reigns supreme, making every find a strategic asset in the ever-evolving meta.
