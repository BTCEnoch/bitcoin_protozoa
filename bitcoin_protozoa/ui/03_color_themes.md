# Color Themes

This document outlines the color themes for the Bitcoin Protozoa project. Due to the size of the complete color palette collection, this document provides an overview and links to the detailed theme files.

## Table of Contents

1. [Theme Philosophy](#theme-philosophy)
2. [Theme Structure](#theme-structure)
3. [Theme Categories](#theme-categories)
4. [Theme Implementation](#theme-implementation)
5. [Default Theme](#default-theme)
6. [Theme Selection](#theme-selection)
7. [Related Documents](#related-documents)

## Theme Philosophy

The color themes for Bitcoin Protozoa are designed to create visually striking and harmonious particle creatures. Each theme consists of 5 colors that work together to create a cohesive visual identity for the creature while maintaining clear visual distinction between particle roles.

The themes follow these principles:

1. **Visual Harmony**: Colors within a theme work together harmoniously
2. **Role Distinction**: Each role has a visually distinct color
3. **Aesthetic Appeal**: Themes are designed to be visually appealing
4. **Bitcoin Connection**: Many themes incorporate Bitcoin orange
5. **Diversity**: Themes cover a wide range of aesthetic styles

## Theme Structure

Each theme consists of 5 colors, one for each particle role:

1. **CORE**: The central, foundational color (often Bitcoin orange)
2. **CONTROL**: The color for control particles
3. **MOVEMENT**: The color for movement particles
4. **DEFENSE**: The color for defense particles
5. **ATTACK**: The color for attack particles

## Theme Categories

The themes are organized into several categories:

### Bitcoin Classic

Themes that prominently feature Bitcoin orange and complementary colors.

- **Bitcoin Original**: The default theme featuring Bitcoin orange
- **Bitcoin Gold**: A gold-accented variation of the Bitcoin theme
- **Bitcoin Earth**: Earth tones complementing Bitcoin orange
- **Bitcoin Ocean**: Ocean blues with Bitcoin orange accents
- **Bitcoin Forest**: Forest greens with Bitcoin orange accents

### Cosmic Voyage

Space-themed color palettes inspired by cosmic phenomena.

- **Nebula**: Vibrant colors inspired by nebulae
- **Galaxy**: Deep space colors with bright accents
- **Solar System**: Colors inspired by our solar system
- **Black Hole**: Dark theme with intense accents
- **Supernova**: Explosive, bright color palette

### Digital Ecosystem

High-tech, vibrant color schemes inspired by digital environments.

- **Cyberpunk**: Neon colors on dark background
- **Matrix**: Green-dominated digital theme
- **Vaporwave**: Retro digital aesthetic with purples and teals
- **Hologram**: Iridescent colors with blue dominance
- **Quantum**: Abstract colors representing quantum states

### Natural Themes

Color palettes inspired by natural environments and phenomena.

- **Forest**: Green-dominated natural palette
- **Ocean**: Blue-dominated aquatic palette
- **Desert**: Warm earth tones
- **Arctic**: Cool blues and whites
- **Volcanic**: Dark with fiery accents

### Seasonal Themes

Color palettes inspired by the four seasons.

- **Spring**: Fresh, vibrant greens and pastels
- **Summer**: Bright, warm colors
- **Autumn**: Rich, warm earth tones
- **Winter**: Cool blues and whites

### Emotional Themes

Color palettes designed to evoke specific emotions.

- **Calm**: Soothing blues and greens
- **Energetic**: Vibrant reds and yellows
- **Mysterious**: Deep purples and blues
- **Joyful**: Bright, playful colors
- **Serious**: Muted, professional colors

### Cultural Themes

Color palettes inspired by cultural color associations.

- **Japanese**: Traditional Japanese color palette
- **Nordic**: Scandinavian-inspired colors
- **Tropical**: Vibrant colors from tropical regions
- **Mediterranean**: Warm, sun-soaked palette
- **African**: Rich, earth-inspired palette

## Theme Implementation

Themes are implemented using CSS custom properties and JavaScript:

```css
/* Example theme definition */
.theme-bitcoin-original {
  --color-core: #F7931A;     /* Bitcoin Orange */
  --color-control: #00A3FF;  /* Electric Blue */
  --color-movement: #00E676; /* Vibrant Green */
  --color-defense: #7B1FA2;  /* Royal Purple */
  --color-attack: #FF1744;   /* Energetic Red */
}
```

```javascript
// Example theme application
function applyTheme(themeName) {
  // Remove previous theme classes
  document.body.classList.forEach(className => {
    if (className.startsWith('theme-')) {
      document.body.classList.remove(className);
    }
  });
  
  // Add new theme class
  document.body.classList.add(`theme-${themeName}`);
  
  // Update particle colors
  updateParticleColors();
}

// Update particle colors based on current theme
function updateParticleColors() {
  const coreColor = getComputedStyle(document.body).getPropertyValue('--color-core').trim();
  const controlColor = getComputedStyle(document.body).getPropertyValue('--color-control').trim();
  const movementColor = getComputedStyle(document.body).getPropertyValue('--color-movement').trim();
  const defenseColor = getComputedStyle(document.body).getPropertyValue('--color-defense').trim();
  const attackColor = getComputedStyle(document.body).getPropertyValue('--color-attack').trim();
  
  // Update particle materials
  updateParticleMaterial('CORE', coreColor);
  updateParticleMaterial('CONTROL', controlColor);
  updateParticleMaterial('MOVEMENT', movementColor);
  updateParticleMaterial('DEFENSE', defenseColor);
  updateParticleMaterial('ATTACK', attackColor);
}
```

## Default Theme

The default theme is "Bitcoin Original", featuring Bitcoin orange as the core color:

```
Bitcoin Original Theme:
- CORE: #F7931A (Bitcoin Orange)
- CONTROL: #00A3FF (Electric Blue)
- MOVEMENT: #00E676 (Vibrant Green)
- DEFENSE: #7B1FA2 (Royal Purple)
- ATTACK: #FF1744 (Energetic Red)
```

This theme provides a strong visual identity that connects to Bitcoin while ensuring each role has a distinct and recognizable color.

## Theme Selection

Themes can be selected in several ways:

1. **Deterministic Selection**: Based on Bitcoin block data
2. **User Selection**: Manual selection by the user
3. **Random Selection**: Random selection from available themes
4. **Time-Based Selection**: Changing based on time of day or season

The default implementation uses deterministic selection based on the Bitcoin block nonce:

```javascript
function selectThemeFromBlockData(blockData) {
  // Use block nonce as seed for theme selection
  const rng = mulberry32(blockData.nonce);
  
  // Get list of available themes
  const themes = Object.keys(AVAILABLE_THEMES);
  
  // Select theme based on RNG
  const themeIndex = Math.floor(rng() * themes.length);
  const selectedTheme = themes[themeIndex];
  
  // Apply selected theme
  applyTheme(selectedTheme);
  
  return selectedTheme;
}
```

## Related Documents

- [User Experience](01_user_experience.md) - For details on the user experience approach
- [Visual Design System](02_visual_design.md) - For details on the visual design system
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Color Themes Part 1](03_color_themes_part1.md) - Detailed color theme definitions (Bitcoin Classic, Cosmic Voyage)
- [Color Themes Part 2](03_color_themes_part2.md) - Detailed color theme definitions (Digital Ecosystem, Natural Themes)
- [Color Themes Part 3](03_color_themes_part3.md) - Detailed color theme definitions (Seasonal, Emotional, Cultural)
