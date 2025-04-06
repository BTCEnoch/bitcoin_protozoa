# Phase 1: Standardization and Alignment

This document details the first phase of implementing the trait and role balancing system for Bitcoin Protozoa, focusing on standardization and alignment of terminology and concepts.

## 1.1 Terminology Standardization

### Current Terminology Issues

We currently have some inconsistencies in terminology between our role structure and the balancing system:

| Our Role Structure | Balancing System |
|--------------------|------------------|
| CORE               | Core             |
| CONTROL            | Control          |
| MOVEMENT           | Motion           |
| DEFENSE            | Defense          |
| ATTACK             | Attack           |

### Standardization Approach

We will standardize on the following terminology throughout all documentation and code:

| Standard Term | Description |
|---------------|-------------|
| CORE          | Central, stabilizing force; provides durability and constitution |
| CONTROL       | Directive force; provides intelligence and control effects |
| MOVEMENT      | Locomotive force; provides agility and speed |
| DEFENSE       | Protective force; provides damage mitigation and resilience |
| ATTACK        | Offensive force; provides damage and combat strength |

### Implementation Tasks

1. **Update Balancing System Document**
   - Replace "Motion" with "MOVEMENT" throughout
   - Ensure consistent capitalization (all uppercase for role names)
   - Update any role descriptions to match our standard definitions

2. **Review All Documentation**
   - Scan all documentation for inconsistent terminology
   - Update to use standard terms
   - Ensure consistent capitalization

3. **Create Terminology Reference**
   - Create a central reference document for terminology
   - Include standard terms, definitions, and usage examples
   - Link from other documentation

## 1.2 Trait Structure Alignment

### Current Structure vs. Balancing System

| Aspect | Our Structure | Balancing System |
|--------|---------------|------------------|
| Rarity Tiers | 6 tiers (Common, Uncommon, Rare, Epic, Legendary, Mythic) | 5 tiers (Common, Uncommon, Rare, Epic, Legendary) |
| Distribution | 4-3-2-2-2-2 per role | Based on probabilities (50%, 30%, 15%, 4%, 1%) |
| Organization | By role | By trait category |

### Alignment Approach

We will extend the balancing system to include the Mythic tier:

1. **Rarity Tiers**
   - Keep our 6-tier system (Common, Uncommon, Rare, Epic, Legendary, Mythic)
   - Add Mythic tier to balancing system with 0.5% probability
   - Adjust other probabilities: Common (49.5%), Uncommon (30%), Rare (15%), Epic (4%), Legendary (1%), Mythic (0.5%)

2. **Point Values**
   - Keep existing point values for Common through Legendary
   - Assign 50 points to Mythic tier
   - Update points-based evaluation to include Mythic tier

3. **Trait Categories**
   - Create a mapping between our role-based traits and the 5 trait categories
   - Each role will have traits that map to different categories
   - This allows us to maintain our role-based organization while aligning with the category-based balancing

### Implementation Tasks

1. **Update Balancing System**
   - Add Mythic tier with 0.5% probability
   - Adjust other probabilities
   - Define point value for Mythic tier

2. **Create Trait Mapping**
   - Create a mapping document that shows how each role-based trait maps to a trait category
   - Example: CORE "Pulsating Sphere" → Special Formations category
   - Ensure all 150 traits (75 formation + 75 behavior) are mapped

3. **Update Trait Documentation**
   - Add category information to trait documentation
   - Ensure trait descriptions align with their categories

## 1.3 Role Distribution Alignment

### Current Structure vs. Balancing System

Our role structure aligns well functionally with the balancing system, but we need to define specific scaling functions and formulas.

### Alignment Approach

1. **Scaling Functions**
   - Define how effectiveness scales with particle count
   - Implement diminishing returns for counts above 150
   - Create role-specific scaling functions if needed

2. **Stat Formulas**
   - Define base stats for each role at 40 particles
   - Create formulas for how stats scale with particle count
   - Ensure balanced progression from minimum to maximum

3. **Class System**
   - Decide whether to implement the optional class system
   - If implementing, define class determination rules
   - Create class-specific bonuses and abilities

### Implementation Tasks

1. **Define Scaling Functions**
   - Create mathematical functions for scaling effectiveness
   - Document diminishing returns implementation
   - Test with various particle counts

2. **Create Stat Formulas**
   - Define base stats for each role
   - Create formulas for derived stats
   - Test with various particle distributions

3. **Design Class System**
   - Decide on class system implementation
   - If implementing, define class determination rules
   - Document class-specific features

## Deliverables

1. **Updated Documentation**
   - Standardized terminology across all documents
   - Updated balancing system document with 6 rarity tiers
   - Trait category mapping document

2. **Technical Specifications**
   - Scaling function specifications
   - Stat formula specifications
   - Class system design (if implementing)

3. **Implementation Guidelines**
   - Coding standards for implementation
   - Testing requirements
   - Integration guidelines

## Timeline

- Terminology Standardization: 2-3 days
- Trait Structure Alignment: 3-5 days
- Role Distribution Alignment: 3-5 days
- Documentation and Review: 2-3 days
- Total: 10-16 days (2-3 weeks)

## Dependencies

- Access to all existing documentation
- Agreement on standardization approach
- Consensus on trait structure alignment
- Decision on class system implementation
