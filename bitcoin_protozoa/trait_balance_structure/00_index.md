# Trait Balance Structure Index

This directory contains documentation for the trait and role balancing system for Bitcoin Protozoa.

> **Note**: This documentation has been reorganized and cleaned up. Redundant documents have been moved to the [archive](archive/) directory. The documents are now numbered sequentially for easier navigation.

## Overview

Bitcoin Protozoa features a complex balancing system where creatures are defined by 500 particles distributed across five roles (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK), each with its own set of formation and behavior traits. This system ensures fairness while preserving the thrill of rare combinations.

## Documents

1. [**Balancing System Overview**](01_balancing_system_overview.md)
   - Comprehensive overview of the balancing system
   - Particle distribution, trait categories, rarity tiers, mutation perks
   - Class system, points-based balancing, combat dynamics

2. [**Trait Balance Analysis**](02_trait_balance_analysis.md)
   - Analysis of current trait structure vs. balancing system
   - Alignment options for rarity tiers and probability distribution
   - Recommendations for trait organization

3. [**Role Distribution Analysis**](03_role_distribution_analysis.md)
   - Analysis of role-based particle distribution
   - Alignment with balancing system terminology
   - Implications for role implementation

4. [**Implementation Plan Outline**](04_implementation_plan_outline.md)
   - High-level implementation plan for the balancing system
   - Phases from standardization to testing and refinement
   - Key tasks and deliverables
   - *Note: The detailed implementation plan is now in [Implementation Plan](12_implementation_plan.md)*

5. [**Phase 1: Standardization**](05_phase1_standardization.md)
   - Detailed plan for terminology standardization
   - Trait structure alignment approach
   - Role distribution alignment approach

6. [**Trait Category Mapping**](archive/06_trait_category_mapping.md) *(Archived)*
   - Mapping of role-based traits to trait categories
   - Analysis of category distribution
   - Recommendations for balancing
   - *Note: Replaced by [Trait Category Mapping Detailed](10_trait_category_mapping_detailed.md)*

7. [**Scaling Functions**](06_scaling_functions.md)
   - Detailed scaling functions for each role
   - Stat formulas and calculations
   - Class system thresholds and implementation notes

8. [**Summary and Recommendations**](07_summary_and_recommendations.md)
   - Key findings from the analysis
   - Recommendations for implementation
   - Implementation priorities

9. [**Particle Distribution Method**](08_particle_distribution_method.md)
   - Improved approach for particle distribution
   - Direct particle allocation instead of percentages
   - Implementation in code

10. [**Trait Redesign Checklist**](09_trait_redesign_checklist.md)
   - Overview of current trait structure
   - Redesign goals and implementation checklist
   - Testing and validation approach

11. [**Trait Category Mapping Detailed**](10_trait_category_mapping_detailed.md)
   - Comprehensive mapping of traits to categories
   - Detailed analysis of trait distribution
   - Implementation guidelines

12. [**Class System Implementation**](11_class_system_implementation.md)
   - Main class and subclass determination
   - Class skills and subclass modifiers
   - Integration with trait system

13. [**Implementation Plan**](12_implementation_plan.md)
   - Detailed phase-by-phase implementation plan
   - Timeline and dependencies
   - Key files and testing strategy

13. [**Documentation Cleanup Summary**](13_documentation_cleanup_summary.md)
   - Summary of changes made to documentation
   - Standardization of terminology and approach
   - Visual aids and enhanced clarity

## Archived Documents

Some documents have been archived as they have been superseded by newer versions. These can be found in the [archive](archive/) directory:

- [**Implementation Plan**](archive/04_implementation_plan.md) - Superseded by [12_implementation_plan.md](12_implementation_plan.md)
- [**Trait Category Mapping**](archive/06_trait_category_mapping.md) - Superseded by [10_trait_category_mapping_detailed.md](10_trait_category_mapping_detailed.md)

## Key Decisions

Based on the analysis in these documents, we've made the following key decisions:

1. **Terminology Standardization**
   - Use CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK consistently
   - Update all documentation to use this terminology

2. **Rarity Tier Approach**
   - Extend balancing system to include Mythic tier (6 tiers total)
   - Adjust probabilities: Common (49.5%), Uncommon (30%), Rare (15%), Epic (4%), Legendary (1%), Mythic (0.5%)
   - Define point value for Mythic tier (50 points)

3. **Trait Organization**
   - Maintain role-based organization of traits
   - Create mapping between role-based traits and trait categories
   - Use this mapping for balancing calculations

4. **Particle Distribution**
   - Use direct particle allocation instead of percentages
   - Ensure minimum 3 additional particles per role
   - Cap at maximum 180 additional particles per role
   - Distribute remaining particles randomly

5. **Scaling Functions**
   - Implement diminishing returns above 150 particles
   - Create role-specific scaling functions for stats
   - Define combined stat formulas for multi-role effects

6. **Class System**
   - Determine main class based on highest particle group (5 main classes)
   - Determine subclass based on full ranking of all five groups (24 subclasses per main class)
   - Create class-specific base skills for each main class
   - Implement subclass modifiers based on group ranking
   - Ensure each of the 120 unique subclasses has distinct gameplay characteristics

## Next Steps

1. **Update Documentation**
   - Apply terminology standardization to all documents
   - Update balancing system document with 6 rarity tiers
   - Create detailed implementation specifications

2. **Implement Core Systems**
   - Develop particle distribution system
   - Implement trait selection algorithm
   - Create role-specific functionality

3. **Develop Advanced Features**
   - Implement class system
   - Create mutation perk system
   - Develop points-based evaluation

4. **Create Visualization**
   - Implement particle visualization
   - Create trait visual effects
   - Develop UI for creature information

5. **Test and Refine**
   - Conduct comprehensive testing
   - Analyze balance and make adjustments
   - Refine system based on feedback

