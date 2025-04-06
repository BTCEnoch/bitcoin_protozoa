# Mutation Traits

This document details the mutation traits for Bitcoin Protozoa. Mutations are rare bonuses that enhance a creature beyond its base traits, adding depth and unpredictability to gameplay.

## Table of Contents

1. [Overview](#overview)
2. [Mutation Categories](#mutation-categories)
3. [Rarity Tiers](#rarity-tiers)
4. [Common Mutations](#common-mutations)
5. [Uncommon Mutations](#uncommon-mutations)
6. [Rare Mutations](#rare-mutations)
7. [Epic Mutations](#epic-mutations)
8. [Legendary Mutations](#legendary-mutations)
9. [Mythic Mutations](#mythic-mutations)
10. [Implementation Notes](#implementation-notes)

## Overview

Mutation traits provide bonuses to various aspects of a creature:
- **Attributes**: HP, Int, Damage, Defense, Agility
- **Skills**: Enhancements to skill effectiveness, cooldowns, or effects
- **Formations**: Improvements to formation stability or effectiveness
- **Behaviors**: Enhancements to behavior coordination or efficiency
- **Particle Count**: Increases to group size (high rarity only)

Mutations are assigned based on Bitcoin confirmation milestones, with higher confirmations increasing the chance of rarer mutations.

## Mutation Categories

Mutations are divided into five categories based on their effect:

1. **Single-Group Boosts**: Enhance a single group (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
2. **Multi-Group Boosts**: Enhance multiple groups simultaneously (pairs or triples)
3. **Global Boosts**: Provide smaller bonuses to all five groups
4. **Special Effects**: Offer unique bonuses like dodge chance or regeneration
5. **Particle Count Bonuses**: Add particles to a group (high rarity only)

## Rarity Tiers

Mutations are distributed across six rarity tiers:
- **Common**: 60 mutations (30%)
- **Uncommon**: 50 mutations (25%)
- **Rare**: 40 mutations (20%)
- **Epic**: 30 mutations (15%)
- **Legendary**: 15 mutations (7.5%)
- **Mythic**: 5 mutations (2.5%)

The rarity of a mutation affects its power level, with higher rarities providing stronger bonuses.

## Common Mutations

### Single-Group Boosts (30)

#### CORE Boosts (6)
1. **Core Vitality A**: +5% HP
2. **Core Vitality B**: +5% HP
3. **Core Vitality C**: +5% HP
4. **Core Vitality D**: +5% HP
5. **Core Vitality E**: +5% HP
6. **Core Vitality F**: +5% HP

#### CONTROL Boosts (6)
7. **Control Insight A**: +5% Int
8. **Control Insight B**: +5% Int
9. **Control Insight C**: +5% Int
10. **Control Insight D**: +5% Int
11. **Control Insight E**: +5% Int
12. **Control Insight F**: +5% Int

#### ATTACK Boosts (6)
13. **Attack Precision A**: +5% Damage
14. **Attack Precision B**: +5% Damage
15. **Attack Precision C**: +5% Damage
16. **Attack Precision D**: +5% Damage
17. **Attack Precision E**: +5% Damage
18. **Attack Precision F**: +5% Damage

#### DEFENSE Boosts (6)
19. **Defense Fortitude A**: +5% Defense
20. **Defense Fortitude B**: +5% Defense
21. **Defense Fortitude C**: +5% Defense
22. **Defense Fortitude D**: +5% Defense
23. **Defense Fortitude E**: +5% Defense
24. **Defense Fortitude F**: +5% Defense

#### MOVEMENT Boosts (6)
25. **Movement Swiftness A**: +5% Agility
26. **Movement Swiftness B**: +5% Agility
27. **Movement Swiftness C**: +5% Agility
28. **Movement Swiftness D**: +5% Agility
29. **Movement Swiftness E**: +5% Agility
30. **Movement Swiftness F**: +5% Agility

### Multi-Group Boosts (15)

#### Pairs (10)
31. **CORE-CONTROL Synergy**: +3% HP, +3% Int
32. **CORE-ATTACK Synergy**: +3% HP, +3% Damage
33. **CORE-DEFENSE Synergy**: +3% HP, +3% Defense
34. **CORE-MOVEMENT Synergy**: +3% HP, +3% Agility
35. **CONTROL-ATTACK Synergy**: +3% Int, +3% Damage
36. **CONTROL-DEFENSE Synergy**: +3% Int, +3% Defense
37. **CONTROL-MOVEMENT Synergy**: +3% Int, +3% Agility
38. **ATTACK-DEFENSE Synergy**: +3% Damage, +3% Defense
39. **ATTACK-MOVEMENT Synergy**: +3% Damage, +3% Agility
40. **DEFENSE-MOVEMENT Synergy**: +3% Defense, +3% Agility

#### Triples (5)
41. **Triple Synergy A**: +2% HP, +2% Int, +2% Damage
42. **Triple Synergy B**: +2% HP, +2% Defense, +2% Agility
43. **Triple Synergy C**: +2% Int, +2% Damage, +2% Defense
44. **Triple Synergy D**: +2% Int, +2% Agility, +2% Damage
45. **Triple Synergy E**: +2% Defense, +2% Agility, +2% HP

### Global Boosts (10)
46. **Minor Global Boost A**: +1% to all stats (HP, Int, Damage, Defense, Agility)
47. **Minor Global Boost B**: +1% to all stats
48. **Minor Global Boost C**: +1% to all stats
49. **Minor Global Boost D**: +1% to all stats
50. **Minor Global Boost E**: +1% to all stats
51. **Minor Global Boost F**: +1% to all stats
52. **Minor Global Boost G**: +1% to all stats
53. **Minor Global Boost H**: +1% to all stats
54. **Minor Global Boost I**: +1% to all stats
55. **Minor Global Boost J**: +1% to all stats

### Special Effects (5)
56. **Minor Dodge**: 5% chance to dodge attacks (DEFENSE)
57. **Quick Cast**: Reduce skill cooldowns by 5% (CONTROL)
58. **Stable Form**: +5% formation stability (CORE)
59. **Efficient Movement**: -5% behavior energy cost (MOVEMENT)
60. **Minor Regeneration**: +1% HP regeneration per second (CORE)

## Uncommon Mutations

### Single-Group Boosts (25)

#### CORE Boosts (5)
61. **Enhanced Core A**: +10% HP
62. **Enhanced Core B**: +10% HP
63. **Enhanced Core C**: +10% HP
64. **Enhanced Core D**: +10% HP
65. **Enhanced Core E**: +10% HP

#### CONTROL Boosts (5)
66. **Enhanced Control A**: +10% Int
67. **Enhanced Control B**: +10% Int
68. **Enhanced Control C**: +10% Int
69. **Enhanced Control D**: +10% Int
70. **Enhanced Control E**: +10% Int

#### ATTACK Boosts (5)
71. **Enhanced Attack A**: +10% Damage
72. **Enhanced Attack B**: +10% Damage
73. **Enhanced Attack C**: +10% Damage
74. **Enhanced Attack D**: +10% Damage
75. **Enhanced Attack E**: +10% Damage

#### DEFENSE Boosts (5)
76. **Enhanced Defense A**: +10% Defense
77. **Enhanced Defense B**: +10% Defense
78. **Enhanced Defense C**: +10% Defense
79. **Enhanced Defense D**: +10% Defense
80. **Enhanced Defense E**: +10% Defense

#### MOVEMENT Boosts (5)
81. **Enhanced Movement A**: +10% Agility
82. **Enhanced Movement B**: +10% Agility
83. **Enhanced Movement C**: +10% Agility
84. **Enhanced Movement D**: +10% Agility
85. **Enhanced Movement E**: +10% Agility

### Multi-Group Boosts (15)

#### Pairs (10)
86. **Durable Mage**: +6% HP, +6% Int
87. **Tank Striker**: +6% HP, +6% Damage
88. **Fortified Core**: +6% HP, +6% Defense
89. **Swift Core**: +6% HP, +6% Agility
90. **Smart Offense**: +6% Int, +6% Damage
91. **Tactical Shield**: +6% Int, +6% Defense
92. **Agile Mind**: +6% Int, +6% Agility
93. **Defensive Strike**: +6% Damage, +6% Defense
94. **Speedy Assault**: +6% Damage, +6% Agility
95. **Nimble Guard**: +6% Defense, +6% Agility

#### Triples (5)
96. **Balanced Power A**: +4% HP, +4% Damage, +4% Defense
97. **Balanced Power B**: +4% Int, +4% Agility, +4% HP
98. **Balanced Power C**: +4% Damage, +4% Defense, +4% Int
99. **Balanced Power D**: +4% Agility, +4% HP, +4% Damage
100. **Balanced Power E**: +4% Defense, +4% Int, +4% Agility

### Global Boosts (5)
101. **Uncommon Global Boost A**: +2% to all stats
102. **Uncommon Global Boost B**: +2% to all stats
103. **Uncommon Global Boost C**: +2% to all stats
104. **Uncommon Global Boost D**: +2% to all stats
105. **Uncommon Global Boost E**: +2% to all stats

### Special Effects (5)
106. **Improved Dodge**: 10% chance to dodge (DEFENSE)
107. **Faster Cast**: -10% skill cooldowns (CONTROL)
108. **Formation Anchor**: +10% formation stability (CORE)
109. **Behavior Flow**: +10% behavior efficiency (MOVEMENT)
110. **Regeneration**: +2% HP regeneration per second (CORE)

## Rare Mutations

### Single-Group Boosts (15)

#### CORE Boosts (3)
111. **Rare Core Boost A**: +15% HP
112. **Rare Core Boost B**: +15% HP
113. **Rare Core Boost C**: +15% HP

#### CONTROL Boosts (3)
114. **Rare Control Boost A**: +15% Int
115. **Rare Control Boost B**: +15% Int
116. **Rare Control Boost C**: +15% Int

#### ATTACK Boosts (3)
117. **Rare Attack Boost A**: +15% Damage
118. **Rare Attack Boost B**: +15% Damage
119. **Rare Attack Boost C**: +15% Damage

#### DEFENSE Boosts (3)
120. **Rare Defense Boost A**: +15% Defense
121. **Rare Defense Boost B**: +15% Defense
122. **Rare Defense Boost C**: +15% Defense

#### MOVEMENT Boosts (3)
123. **Rare Movement Boost A**: +15% Agility
124. **Rare Movement Boost B**: +15% Agility
125. **Rare Movement Boost C**: +15% Agility

### Multi-Group Boosts (15)

#### Pairs (10)
126. **Vital Intel**: +10% HP, +10% Int
127. **Strong Assault**: +10% HP, +10% Damage
128. **Iron Core**: +10% HP, +10% Defense
129. **Fast Vitality**: +10% HP, +10% Agility
130. **Smart Strike**: +10% Int, +10% Damage
131. **Guarded Mind**: +10% Int, +10% Defense
132. **Quick Wit**: +10% Int, +10% Agility
133. **Hardened Strike**: +10% Damage, +10% Defense
134. **Swift Strike**: +10% Damage, +10% Agility
135. **Agile Defense**: +10% Defense, +10% Agility

#### Triples (5)
136. **Rare Triad A**: +7% HP, +7% Damage, +7% Defense
137. **Rare Triad B**: +7% Int, +7% Agility, +7% HP
138. **Rare Triad C**: +7% Damage, +7% Defense, +7% Int
139. **Rare Triad D**: +7% Agility, +7% HP, +7% Damage
140. **Rare Triad E**: +7% Defense, +7% Int, +7% Agility

### Global Boosts (5)
141. **Rare Global Boost A**: +3% to all stats
142. **Rare Global Boost B**: +3% to all stats
143. **Rare Global Boost C**: +3% to all stats
144. **Rare Global Boost D**: +3% to all stats
145. **Rare Global Boost E**: +3% to all stats

### Special Effects (4)
146. **Advanced Dodge**: 15% chance to dodge (DEFENSE)
147. **Skill Debuff**: 10% chance skills apply a weak debuff (CONTROL)
148. **Formation Expert**: +15% formation effectiveness (CORE)
149. **Behavior Mastery**: +15% behavior coordination (MOVEMENT)

### Particle Count Bonus (1)
150. **Minor Particle Boost**: +5 particles to a random group

## Epic Mutations

### Single-Group Boosts (10)

#### CORE Boosts (2)
151. **Epic Core Boost A**: +20% HP
152. **Epic Core Boost B**: +20% HP

#### CONTROL Boosts (2)
153. **Epic Control Boost A**: +20% Int
154. **Epic Control Boost B**: +20% Int

#### ATTACK Boosts (2)
155. **Epic Attack Boost A**: +20% Damage
156. **Epic Attack Boost B**: +20% Damage

#### DEFENSE Boosts (2)
157. **Epic Defense Boost A**: +20% Defense
158. **Epic Defense Boost B**: +20% Defense

#### MOVEMENT Boosts (2)
159. **Epic Movement Boost A**: +20% Agility
160. **Epic Movement Boost B**: +20% Agility

### Multi-Group Boosts (10)

#### Pairs (6)
161. **Epic Vitality**: +15% HP, +15% Int
162. **Epic Offense**: +15% HP, +15% Damage
163. **Epic Bastion**: +15% HP, +15% Defense
164. **Epic Speed**: +15% Damage, +15% Agility
165. **Epic Tactics**: +15% Int, +15% Damage
166. **Epic Shield**: +15% Defense, +15% Agility

#### Triples (4)
167. **Epic Triad A**: +10% HP, +10% Damage, +10% Defense
168. **Epic Triad B**: +10% Int, +10% Agility, +10% HP
169. **Epic Triad C**: +10% Damage, +10% Defense, +10% Int
170. **Epic Triad D**: +10% Agility, +10% HP, +10% Damage

### Global Boosts (5)
171. **Epic Global Boost A**: +4% to all stats
172. **Epic Global Boost B**: +4% to all stats
173. **Epic Global Boost C**: +4% to all stats
174. **Epic Global Boost D**: +4% to all stats
175. **Epic Global Boost E**: +4% to all stats

### Special Effects (4)
176. **Epic Dodge**: 20% chance to dodge (DEFENSE)
177. **Skill Power**: +20% skill damage (CONTROL)
178. **Formation Master**: +20% formation stability (CORE)
179. **Behavior Genius**: +20% behavior adaptability (MOVEMENT)

### Particle Count Bonus (1)
180. **Moderate Particle Boost**: +10 particles to a random group

## Legendary Mutations

### Single-Group Boosts (5)
181. **Legendary Core Boost**: +30% HP (CORE)
182. **Legendary Control Boost**: +30% Int (CONTROL)
183. **Legendary Attack Boost**: +30% Damage (ATTACK)
184. **Legendary Defense Boost**: +30% Defense (DEFENSE)
185. **Legendary Movement Boost**: +30% Agility (MOVEMENT)

### Multi-Group Boosts (5)

#### Pairs (3)
186. **Legendary Might**: +25% HP, +25% Damage
187. **Legendary Wisdom**: +25% Int, +25% Defense
188. **Legendary Grace**: +25% Agility, +25% HP

#### Triples (2)
189. **Legendary Triad A**: +20% HP, +20% Damage, +20% Defense
190. **Legendary Triad B**: +20% Int, +20% Agility, +20% Damage

### Global Boosts (2)
191. **Legendary Global Boost A**: +5% to all stats
192. **Legendary Global Boost B**: +5% to all stats

### Special Effects (2)
193. **Energy Burst**: +30% skill area effect (CONTROL)
194. **Iron Will**: 20% chance to resist debuffs (DEFENSE)

### Particle Count Bonus (1)
195. **Major Particle Boost**: +15 particles to a random group

## Mythic Mutations

### Single-Group Boost (1)
196. **Mythic Boost**: +50% to a random primary stat

### Multi-Group Boost (1)
197. **Mythic Synergy**: +40% HP, +40% Damage

### Global Boost (1)
198. **Mythic Global Boost**: +10% to all stats

### Special Effect (1)
199. **Mythic Resilience**: 25% chance to revive with 50% HP once per battle (CORE)

### Particle Count Bonus (1)
200. **Supreme Particle Boost**: +20 particles to a random group

## Implementation Notes

### Mutation Assignment

Mutations are assigned based on Bitcoin confirmation milestones:

| Confirmations | Mutation Chance | Rarity Distribution |
|---------------|----------------|---------------------|
| 0-9,999       | 50% for 1 mutation | Common: 60%, Uncommon: 25%, Rare: 10%, Epic: 4%, Legendary: 1%, Mythic: 0% |
| 10,000-99,999 | 50% for 1 mutation<br>10% for 2 mutations | Common: 50%, Uncommon: 30%, Rare: 15%, Epic: 4%, Legendary: 1%, Mythic: 0% |
| 100,000-999,999 | 60% for 1 mutation<br>20% for 2 mutations<br>1% for 3 mutations | Common: 40%, Uncommon: 30%, Rare: 20%, Epic: 7%, Legendary: 2%, Mythic: 1% |
| 1,000,000+    | 70% for 1 mutation<br>30% for 2 mutations<br>5% for 3 mutations | Common: 30%, Uncommon: 30%, Rare: 25%, Epic: 10%, Legendary: 4%, Mythic: 1% |

### Mutation Selection

Mutations are selected using a deterministic process based on the Bitcoin block nonce:

1. Determine the number of mutations based on confirmation milestones and RNG
2. For each mutation:
   - Determine the rarity tier based on confirmation milestones and RNG
   - Select a random mutation from the appropriate rarity tier
   - Ensure no duplicate mutations are selected

### Mutation Effects

Mutations provide various effects:

1. **Stat Boosts**: Directly increase one or more stats (HP, Int, Damage, Defense, Agility)
2. **Skill Enhancements**: Improve skill effectiveness, cooldowns, or effects
3. **Formation Improvements**: Enhance formation stability or effectiveness
4. **Behavior Enhancements**: Improve behavior coordination or efficiency
5. **Particle Additions**: Add particles to one or more groups

### Stacking Rules

Mutations stack additively within the same category:

- Multiple stat boosts to the same stat add together (e.g., +5% HP and +10% HP = +15% HP)
- Multiple skill enhancements to the same aspect add together (e.g., -5% cooldown and -10% cooldown = -15% cooldown)
- Multiple formation improvements to the same aspect add together
- Multiple behavior enhancements to the same aspect add together
- Multiple particle additions add together, up to the maximum of +50 particles total

### Particle Count Caps

Particle count bonuses from mutations are subject to the following rules:

1. Total additional particles from mutations cannot exceed +50 particles
2. No single group can exceed 220 total particles (base + additional + mutations)
3. Particle additions follow the same diminishing returns as regular particles (0.5x effectiveness above 150 particles)

### Visualization

Mutations should be visually represented in the UI:

1. Listed in the creature's details panel
2. Color-coded by rarity (Common: white, Uncommon: green, Rare: blue, Epic: purple, Legendary: orange, Mythic: red)
3. Icons representing the affected stats or abilities
4. Tooltips showing detailed effects and descriptions
