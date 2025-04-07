# ui DOCUMENTATION 
 
This document contains all the content from the ui subdirectory of the Bitcoin Protozoa project. 
 
## Files 
 
### 00_summary.md 
 
```.md 
# User Interface Summary

This directory contains documentation on the user interface design and user experience for the Bitcoin Protozoa project.

## Key Documents

- [User Experience](01_user_experience.md) - User experience approach and targets
- [Visual Design](02_visual_design.md) - Visual design system and guidelines
- [Color Themes](03_color_themes.md) - Color palettes and themes
- [Development UI](04_development_ui.md) - Development interface for testing and debugging

## User Experience Overview

The Bitcoin Protozoa user experience is designed to be:

1. **Immersive**: Creating an engaging, aquarium-like viewing experience
2. **Minimal**: Focusing on the particle creatures with minimal UI elements
3. **Informative**: Providing relevant information about the creatures
4. **Responsive**: Adapting to different screen sizes and devices
5. **Performant**: Maintaining 60fps for smooth animation

## Visual Design System

The visual design system defines the visual language of the application:

1. **Color Palette**: Bitcoin orange and complementary colors
2. **Typography**: Clean, readable typography for UI elements
3. **UI Components**: Consistent design for buttons, cards, and overlays
4. **Iconography**: Simple, recognizable icons
5. **Particle Visual Effects**: Glow effects, trails, and animations

## Color Themes

The application includes 50 different color themes for particle groups:

1. **Bitcoin Classic**: Traditional Bitcoin orange with complementary colors
2. **Cosmic Voyage**: Space-themed colors
3. **Digital Ecosystem**: High-tech, vibrant colors
4. **Natural Themes**: Earth, ocean, and nature-inspired themes
5. **Specialized Themes**: Themes for different moods and aesthetics

## UI Components

The user interface includes several key components:

1. **Creature View**: Main view showing the particle creature
2. **Stats Overlay**: Overlay showing creature statistics
3. **Bitcoin Data**: Display of relevant Bitcoin block data
4. **Evolution History**: Record of creature mutations
5. **Settings Panel**: Minimal settings for user preferences

## Accessibility

The user interface is designed with accessibility in mind:

1. **Color Contrast**: Ensuring sufficient contrast for readability
2. **Text Size**: Using readable text sizes
3. **Keyboard Navigation**: Supporting keyboard navigation
4. **Screen Reader Support**: Providing appropriate text alternatives
5. **Reduced Motion**: Option for users who prefer reduced motion

## Related Documentation

- [Development Workflow](../deployment/01_development_workflow.md) - For details on development process
- [Particle System](../particles/00_summary.md) - For details on particle visualization
- [Visual Design Implementation](../deployment/03_asset_management.md) - For implementation details
- [Testing Strategy](../testing/01_testing_strategy.md) - For details on testing approach
 
``` 
 
--- 
 
### 01_user_experience.md 
 
```.md 
# User Experience Approach

This document outlines the user experience approach for the Bitcoin Protozoa project, including target experience, performance targets, user interface design, user flow, responsive design, and data display.

## Table of Contents

1. [Target Experience](#target-experience)
2. [Performance Targets](#performance-targets)
3. [User Interface Design](#user-interface-design)
4. [User Flow](#user-flow)
5. [Responsive Design](#responsive-design)
6. [Data Display](#data-display)
7. [Implementation Considerations](#implementation-considerations)
8. [Related Documents](#related-documents)

## Target Experience

The Bitcoin Protozoa project aims to create a mesmerizing, aquarium-like viewing experience where users can observe particle creatures that are deterministically generated from Bitcoin block data and evolve based on block confirmations.

### Core Experience Principles

1. **Immersive Visualization**: The primary focus is on the particle creatures themselves, with minimal UI elements that don't distract from the visual experience.

2. **Bitcoin Connection**: Clear visual representation of the connection to Bitcoin, with block data and confirmation counts prominently displayed.

3. **Evolution Storytelling**: Visual cues and information that help users understand the evolution of their creatures over time.

4. **Minimal Interaction**: The experience is primarily observational, with limited but meaningful interaction options.

5. **Educational Value**: Subtle information about how the creatures relate to Bitcoin data, providing educational value about blockchain concepts.

## Performance Targets

To ensure a smooth and engaging experience, the application targets the following performance metrics:

### Frame Rate

- **Target**: 60fps on standard PCs
- **Minimum Acceptable**: 30fps on older devices
- **Mobile Target**: 30fps on mid-range mobile devices

### Loading Time

- **Initial Load**: Under 3 seconds for application shell
- **Creature Generation**: Under 2 seconds to generate and display a creature
- **Data Fetching**: Background loading of Bitcoin data with appropriate loading indicators

### Memory Usage

- **Target**: Under 200MB RAM usage
- **Particle Limit**: 500 particles per creature
- **Optimization**: Efficient memory management with object pooling and typed arrays

### CPU Utilization

- **Target**: Under 30% CPU utilization on average systems
- **Worker Distribution**: Offload physics calculations to web workers
- **Adaptive Quality**: Reduce simulation complexity on less powerful devices

## User Interface Design

The user interface follows a minimalist approach that emphasizes the particle creatures while providing necessary information and controls.

### Color Scheme

- **Primary Colors**: Dark grey background (#1A1A1A) with Bitcoin orange (#F7931A) accents
- **Secondary Colors**: Complementary colors based on the selected color theme
- **Text**: White (#FFFFFF) for primary text, light grey (#CCCCCC) for secondary text

### Layout

- **Creature View**: Central focus of the screen, taking up most of the viewport
- **Information Panel**: Collapsible panel on the right side showing creature stats and Bitcoin data
- **Controls**: Minimal controls at the bottom of the screen
- **Evolution Timeline**: Optional timeline showing mutation history at the bottom

### Typography

- **Primary Font**: 'Inter' or system sans-serif for clean readability
- **Heading Size**: 24px for main headings, 18px for subheadings
- **Body Text**: 16px for optimal readability
- **Data Display**: Monospace font for Bitcoin data and technical information

## User Flow

The user flow is designed to be simple and intuitive, focusing on the observation experience.

### Initial Load

1. **Loading Screen**: Brief loading screen with Bitcoin Protozoa logo and loading indicator
2. **Block Selection**: Option to enter a specific block number or use the latest block
3. **Creature Generation**: Visual generation of the creature with subtle animation

### Main Experience

1. **Observation Mode**: Default mode where users can observe the creature's behavior
2. **Information Exploration**: Users can expand the information panel to learn more about the creature
3. **Camera Control**: Simple camera controls to rotate, zoom, and pan around the creature
4. **Evolution Tracking**: Notification and visual effects when mutations occur

### Advanced Interaction

1. **Creature Comparison**: Option to view multiple creatures side by side (future feature)
2. **Parameter Adjustment**: Limited parameters that users can adjust to see different behaviors
3. **Sharing**: Ability to share a link to a specific creature

## Responsive Design

The application is designed to work across different screen sizes and devices.

### Desktop (1920×1080 and above)

- Full experience with all features
- High-quality rendering with maximum particle count
- Expanded information display

### Laptop (1366×768 to 1920×1080)

- Full experience with slightly reduced particle effects
- Compact information display
- Optimized rendering for performance

### Tablet (768×1024 to 1024×1366)

- Adjusted layout with side panels collapsing to bottom
- Touch-optimized controls
- Reduced particle count for performance

### Mobile (320×568 to 414×896)

- Simplified view focusing on the creature
- Minimal UI with expandable panels
- Significantly reduced particle count
- Touch-optimized interaction

## Data Display

The application displays various data related to the Bitcoin block and the creature's properties.

### Bitcoin Data

- **Block Number**: The block number used as an identifier for the creature (not used for generation)
- **Nonce**: The nonce value used for RNG seeding (primary data used from block)
- **Confirmation Count**: Current confirmation count with visual indicator of progress toward next milestone (used for evolution triggers)

> **Note**: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks. Block number is only used as an identifier and is not used for generation.

### Creature Stats

- **Particle Count**: Total number of particles and breakdown by role
- **Age**: Age of the creature based on confirmation count
- **Mutation History**: List of mutations that have occurred
- **Role Distribution**: Visual representation of particle role distribution
- **Force Field Configuration**: Technical details about force field setup

### Performance Metrics

- Optional display of performance metrics (FPS, memory usage)
- Quality settings adjustment based on device capabilities
- Warning indicators if performance drops below acceptable levels

## Implementation Considerations

### Accessibility

- **Color Contrast**: Ensure sufficient contrast for text readability
- **Screen Reader Support**: Provide appropriate text alternatives for visual elements
- **Keyboard Navigation**: Support keyboard navigation for core functions
- **Reduced Motion**: Option for users who prefer reduced motion

### Internationalization

- **Text Externalization**: Separate text content for easy translation
- **Number Formatting**: Appropriate formatting for numbers based on locale
- **Date/Time Formatting**: Locale-aware date and time formatting

### Error Handling

- **Graceful Degradation**: Maintain core functionality even when some features fail
- **Clear Error Messages**: User-friendly error messages with recovery options
- **Offline Support**: Basic functionality when offline with clear indication of limited features

## Related Documents

- [Visual Design System](02_visual_design.md) - For details on the visual design system
- [Color Themes](03_color_themes.md) - For details on color palettes and themes
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - For details on evolution mechanics
 
``` 
 
--- 
 
### 02_visual_design.md 
 
```.md 
# Visual Design System

This document outlines the visual design system for the Bitcoin Protozoa project, including color palette, typography, UI components, iconography, particle visual effects, responsive design, accessibility guidelines, and animation guidelines.

## Table of Contents

1. [Design Philosophy](#design-philosophy)
2. [Color Palette](#color-palette)
3. [Typography](#typography)
4. [UI Components](#ui-components)
5. [Iconography](#iconography)
6. [Particle Visual Effects](#particle-visual-effects)
7. [Responsive Design](#responsive-design)
8. [Accessibility Guidelines](#accessibility-guidelines)
9. [Animation Guidelines](#animation-guidelines)
10. [Implementation Notes](#implementation-notes)
11. [Related Documents](#related-documents)

## Design Philosophy

The visual design of Bitcoin Protozoa follows a "digital aquarium" aesthetic that combines the technical nature of Bitcoin with the organic, fluid movement of particle creatures. The design emphasizes:

1. **Contrast**: Dark space-like background to make colorful particles stand out
2. **Focus**: Minimal UI elements that don't distract from the particle creatures
3. **Bitcoin Identity**: Incorporation of Bitcoin orange as a primary brand color
4. **Depth**: Use of lighting, shadows, and perspective to create a sense of depth
5. **Fluidity**: Smooth animations and transitions throughout the experience

## Color Palette

### Primary Colors

- **Bitcoin Orange**: #F7931A - Primary brand color, used for key UI elements and CORE particles
- **Deep Space**: #0A0E17 - Background color, creating a space-like environment
- **Neutral Grey**: #2A2A2A - Secondary background color for UI elements
- **White**: #FFFFFF - Primary text color and highlights

### Secondary Colors

- **Electric Blue**: #00A3FF - Used for CONTROL particles and interactive elements
- **Vibrant Green**: #00E676 - Used for MOVEMENT particles and success states
- **Royal Purple**: #7B1FA2 - Used for DEFENSE particles and special features
- **Energetic Red**: #FF1744 - Used for ATTACK particles and error states

### Accent Colors

- **Cosmic Gold**: #FFD700 - Used for special highlights and achievements
- **Nebula Pink**: #FF4081 - Used for special effects and notifications
- **Quantum Teal**: #1DE9B6 - Used for data visualization and special states

### Color Usage Guidelines

- Use Bitcoin Orange sparingly to maintain its impact
- Maintain sufficient contrast between text and background (minimum 4.5:1 ratio)
- Use color consistently across the application to reinforce meaning
- Provide alternative visual cues beyond color for accessibility

## Typography

### Font Families

- **Primary Font**: Inter - A clean, modern sans-serif font for all UI text
- **Monospace Font**: IBM Plex Mono - For code, technical data, and Bitcoin information
- **Fallback Stack**: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif

### Font Weights

- **Light**: 300 - Used for large headings and display text
- **Regular**: 400 - Used for body text and general UI
- **Medium**: 500 - Used for subheadings and emphasis
- **Bold**: 700 - Used for primary headings and strong emphasis

### Font Sizes

- **Display**: 32px - Used for main titles and key information
- **Heading 1**: 24px - Used for primary headings
- **Heading 2**: 20px - Used for secondary headings
- **Heading 3**: 18px - Used for tertiary headings
- **Body**: 16px - Used for general text
- **Small**: 14px - Used for secondary information
- **Micro**: 12px - Used for labels and technical data

### Typography Guidelines

- Maintain a line height of 1.5 for optimal readability
- Use consistent text alignment (left-aligned for most content)
- Limit line length to 70-80 characters for optimal readability
- Use proper hierarchy to guide users through the interface

## UI Components

### Panels

- **Main Panel**: Dark semi-transparent background (#0A0E17 at 90% opacity) with subtle border
- **Information Panel**: Lighter background (#2A2A2A) with Bitcoin orange accents
- **Control Panel**: Minimal design with clear interactive elements

### Buttons

- **Primary Button**: Bitcoin orange background with white text
- **Secondary Button**: Transparent background with Bitcoin orange border and text
- **Tertiary Button**: Text-only with hover effect
- **Icon Button**: Circular button with icon and tooltip

### Input Controls

- **Text Input**: Dark background with light text and Bitcoin orange focus state
- **Slider**: Custom slider with Bitcoin orange track and handle
- **Dropdown**: Minimal dropdown with custom animation
- **Toggle**: Custom toggle with Bitcoin orange accent

### Cards

- **Info Card**: Dark background with light border and heading in Bitcoin orange
- **Stat Card**: Visualizes a single statistic with appropriate icon
- **Group Card**: Represents a particle group with role-specific color

### Overlays

- **Modal**: Center-screen overlay with dark background and white content
- **Tooltip**: Small information popup with dark background and light text
- **Notification**: Temporary overlay with role-specific color based on content

## Iconography

### Icon Style

- **Line Style**: 2px stroke weight with rounded caps
- **Fill Style**: Minimal use of fills, primarily for emphasis
- **Size**: 24×24px standard size, scaling to 16×16px for compact UI

### Icon Set

- **Navigation Icons**: Home, back, forward, menu, close
- **Action Icons**: Play, pause, reset, share, download, settings
- **Particle Role Icons**: Custom icons for each particle role
- **Data Icons**: Block, hash, nonce, confirmation, timestamp
- **UI Icons**: Info, warning, error, success, help

### Icon Usage Guidelines

- Use icons consistently throughout the application
- Provide text labels alongside icons for clarity
- Ensure icons are recognizable and intuitive
- Maintain sufficient touch target size (minimum 44×44px)

## Particle Visual Effects

### Particle Appearance

- **Shape**: Circular with soft glow effect
- **Size**: Varies by role (CORE: largest, CONTROL: medium-large, etc.)
- **Color**: Based on role and color theme
- **Opacity**: Varies based on energy level and state

### Lighting Effects

- **Bloom**: Subtle bloom effect on particles
- **Ambient Occlusion**: Soft shadows to create depth
- **HDR**: High dynamic range rendering for vibrant colors
- **Reflections**: Subtle reflections on particle surfaces

### Trail Effects

- **Motion Trails**: Subtle trails behind moving particles
- **Energy Visualization**: Visual representation of particle energy
- **Interaction Effects**: Visual feedback when particles interact
- **Role-Specific Effects**: Unique visual effects for each role

## Responsive Design

### Breakpoints

- **Mobile**: 320px - 767px
- **Tablet**: 768px - 1023px
- **Desktop**: 1024px - 1439px
- **Large Desktop**: 1440px and above

### Layout Adjustments

- **Mobile**: Single column layout with collapsible panels
- **Tablet**: Two-column layout with side panels
- **Desktop**: Full layout with all panels visible
- **Large Desktop**: Enhanced layout with additional information

### UI Scaling

- **Text**: Scales based on viewport size
- **Icons**: Fixed sizes with touch-friendly targets on mobile
- **Spacing**: Increases on larger screens for better readability
- **Controls**: Larger on touch devices, more compact on desktop

## Accessibility Guidelines

### Color and Contrast

- Maintain minimum contrast ratio of 4.5:1 for normal text
- Maintain minimum contrast ratio of 3:1 for large text
- Provide alternative visual cues beyond color
- Support high contrast mode

### Text and Typography

- Allow text resizing up to 200% without loss of content
- Maintain sufficient line height for readability
- Use relative units (rem) for font sizes
- Provide clear visual hierarchy

### Keyboard and Focus

- Ensure all interactive elements are keyboard accessible
- Provide visible focus indicators
- Maintain logical tab order
- Support standard keyboard shortcuts

### Reduced Motion

- Provide option to reduce or disable animations
- Respect user's prefers-reduced-motion setting
- Ensure core functionality works without animations
- Use subtle animations by default

## Animation Guidelines

### Timing and Easing

- **Quick Actions**: 150-200ms with ease-out
- **Standard Transitions**: 250-300ms with ease-in-out
- **Emphasis Animations**: 400-500ms with custom easing
- **Particle Movements**: Varied timing based on physics simulation

### Animation Types

- **Transitions**: Smooth transitions between states
- **Transforms**: Scale, rotate, and translate elements
- **Opacity**: Fade elements in and out
- **Color**: Smooth color transitions
- **Motion**: Physics-based motion for particles

### Animation Principles

- **Timing**: Use appropriate timing for different actions
- **Anticipation**: Prepare users for what's about to happen
- **Follow-through**: Continue motion past the end point
- **Overlapping Action**: Different parts move at different rates
- **Secondary Action**: Additional movements that enhance the main action

## Implementation Notes

### CSS Implementation

```css
:root {
  /* Primary Colors */
  --color-bitcoin-orange: #F7931A;
  --color-deep-space: #0A0E17;
  --color-neutral-grey: #2A2A2A;
  --color-white: #FFFFFF;
  
  /* Secondary Colors */
  --color-electric-blue: #00A3FF;
  --color-vibrant-green: #00E676;
  --color-royal-purple: #7B1FA2;
  --color-energetic-red: #FF1744;
  
  /* Typography */
  --font-primary: 'Inter', system-ui, sans-serif;
  --font-mono: 'IBM Plex Mono', monospace;
  
  /* Font Sizes */
  --font-size-display: 2rem;
  --font-size-h1: 1.5rem;
  --font-size-h2: 1.25rem;
  --font-size-h3: 1.125rem;
  --font-size-body: 1rem;
  --font-size-small: 0.875rem;
  --font-size-micro: 0.75rem;
  
  /* Spacing */
  --space-xs: 0.25rem;
  --space-sm: 0.5rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 2rem;
  
  /* Animation */
  --transition-quick: 150ms ease-out;
  --transition-standard: 250ms ease-in-out;
  --transition-emphasis: 400ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

/* Example component styling */
.button-primary {
  background-color: var(--color-bitcoin-orange);
  color: var(--color-white);
  font-family: var(--font-primary);
  font-size: var(--font-size-body);
  padding: var(--space-sm) var(--space-md);
  border-radius: 4px;
  border: none;
  transition: background-color var(--transition-quick);
}

.button-primary:hover {
  background-color: #E58517;
}
```

### Three.js Implementation

```javascript
// Example particle material implementation
function createParticleMaterial(role) {
  // Get color based on role
  const color = getRoleColor(role);
  
  // Create material with glow effect
  const material = new THREE.ShaderMaterial({
    uniforms: {
      color: { value: new THREE.Color(color) },
      glowIntensity: { value: 0.8 },
      time: { value: 0 }
    },
    vertexShader: particleVertexShader,
    fragmentShader: particleFragmentShader,
    transparent: true,
    blending: THREE.AdditiveBlending
  });
  
  return material;
}

// Get color based on role
function getRoleColor(role) {
  switch(role) {
    case 'CORE':
      return '#F7931A'; // Bitcoin Orange
    case 'CONTROL':
      return '#00A3FF'; // Electric Blue
    case 'MOVEMENT':
      return '#00E676'; // Vibrant Green
    case 'DEFENSE':
      return '#7B1FA2'; // Royal Purple
    case 'ATTACK':
      return '#FF1744'; // Energetic Red
    default:
      return '#FFFFFF'; // White
  }
}
```

## Related Documents

- [User Experience](01_user_experience.md) - For details on the user experience approach
- [Color Themes](03_color_themes.md) - For details on color palettes and themes
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Development UI](../deployment/01_development_workflow.md) - For details on the development UI
 
``` 
 
--- 
 
### 03_color_themes.md 
 
```.md 
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
 
``` 
 
--- 
 
### 04_development_ui.md 
 
```.md 
# Development UI

This document outlines the Development UI for the Bitcoin Protozoa project, which provides a robust interface for testing, parameter adjustment, and visualization of the particle ecosystem during development.

## Table of Contents

1. [Overview](#overview) [Line 20]
2. [Core Requirements](#core-requirements) [Line 30]
3. [UI Components](#ui-components) [Line 50]
   - [Main Visualization Area](#main-visualization-area) [Line 55]
   - [Control Panel](#control-panel) [Line 70]
   - [Block Data Controls](#block-data-controls) [Line 90]
   - [Role Management](#role-management) [Line 110]
   - [Force Field Editor](#force-field-editor) [Line 130]
   - [Debug Visualization](#debug-visualization) [Line 150]
4. [Implementation Approach](#implementation-approach) [Line 170]
   - [Component Architecture](#component-architecture) [Line 175]
   - [Technology Stack](#technology-stack) [Line 190]
   - [Parameter Categories](#parameter-categories) [Line 210]
5. [Preset System](#preset-system) [Line 250]
6. [Development-Only Code Separation](#development-only-code-separation) [Line 280]
7. [Transition to Production](#transition-to-production) [Line 310]
8. [Production UI](#production-ui) [Line 330]
9. [Implementation Guidelines](#implementation-guidelines) [Line 350]
10. [Related Documents](#related-documents) [Line 370]

## Overview

The Development UI is a critical component during the development phase, providing a robust interface for testing, parameter adjustment, and visualization of the particle ecosystem. This UI will not be included in the final production version that will be inscribed on Bitcoin.

The Development UI serves several key purposes:

1. **Testing and Debugging**: Provides tools to test and debug the particle system
2. **Parameter Tuning**: Allows for real-time adjustment of system parameters
3. **Visual Verification**: Enables visual verification of particle behaviors
4. **Preset Management**: Facilitates creation and management of parameter presets
5. **Block Data Simulation**: Simulates Bitcoin block data for testing

## Core Requirements

1. **Full Visualization**: Clear, full-screen view of the particle simulation
2. **Parameter Controls**: Interface to adjust and test different properties and variables
3. **Data Overlays**: Display of relevant metrics and system state
4. **Debugging Tools**: Visualization of force fields, collision detection, and other internal systems
5. **Preset Management**: Tools to create and save presets for trait assets

The Development UI must be:

- **Responsive**: Adapts to different screen sizes and resolutions
- **Performant**: Minimal impact on simulation performance
- **Intuitive**: Easy to use for developers and testers
- **Comprehensive**: Provides access to all relevant parameters and data
- **Separable**: Easily removable for production builds

## UI Components

### Main Visualization Area

- Full-screen canvas for particle rendering
- Toggle for different visualization modes (normal, debug, wireframe)
- Camera controls for zooming, panning, and rotating
- Performance metrics overlay (FPS, particle count, etc.)

The visualization area is the central component of the Development UI, providing a clear view of the particle simulation. It includes:

```tsx
const VisualizationArea = () => {
  const [viewMode, setViewMode] = useState<'normal' | 'debug' | 'wireframe'>('normal');
  const [showMetrics, setShowMetrics] = useState(true);

  return (
    <div className="visualization-area">
      <Canvas>
        <ParticleRenderer viewMode={viewMode} />
        <CameraControls />
        <DebugOverlay active={viewMode === 'debug'} />
      </Canvas>

      <div className="visualization-controls">
        <button onClick={() => setViewMode('normal')}>Normal</button>
        <button onClick={() => setViewMode('debug')}>Debug</button>
        <button onClick={() => setViewMode('wireframe')}>Wireframe</button>
        <button onClick={() => setShowMetrics(!showMetrics)}>
          {showMetrics ? 'Hide Metrics' : 'Show Metrics'}
        </button>
      </div>

      {showMetrics && <PerformanceMetrics />}
    </div>
  );
};
```

### Control Panel

- Collapsible sidebar for parameter adjustments
- Organized into logical sections (Physics, Particles, Force Fields, etc.)
- Real-time parameter adjustment with immediate visual feedback
- Preset saving and loading functionality

The control panel provides access to all adjustable parameters in the system, organized into logical categories:

```tsx
const ControlPanel = () => {
  const [expanded, setExpanded] = useState(true);
  const [activeTab, setActiveTab] = useState('physics');

  return (
    <div className={`control-panel ${expanded ? 'expanded' : 'collapsed'}`}>
      <div className="control-panel-header">
        <h2>Control Panel</h2>
        <button onClick={() => setExpanded(!expanded)}>
          {expanded ? 'Collapse' : 'Expand'}
        </button>
      </div>

      {expanded && (
        <>
          <div className="control-panel-tabs">
            <button
              className={activeTab === 'physics' ? 'active' : ''}
              onClick={() => setActiveTab('physics')}
            >
              Physics
            </button>
            <button
              className={activeTab === 'particles' ? 'active' : ''}
              onClick={() => setActiveTab('particles')}
            >
              Particles
            </button>
            <button
              className={activeTab === 'forceFields' ? 'active' : ''}
              onClick={() => setActiveTab('forceFields')}
            >
              Force Fields
            </button>
            <button
              className={activeTab === 'roles' ? 'active' : ''}
              onClick={() => setActiveTab('roles')}
            >
              Roles
            </button>
            <button
              className={activeTab === 'system' ? 'active' : ''}
              onClick={() => setActiveTab('system')}
            >
              System
            </button>
          </div>

          <div className="control-panel-content">
            {activeTab === 'physics' && <PhysicsControls />}
            {activeTab === 'particles' && <ParticleControls />}
            {activeTab === 'forceFields' && <ForceFieldControls />}
            {activeTab === 'roles' && <RoleControls />}
            {activeTab === 'system' && <SystemControls />}
          </div>

          <div className="control-panel-presets">
            <PresetManager />
          </div>
        </>
      )}
    </div>
  );
};
```

### Block Data Controls

- Block height input for deterministic creature generation
- Block data display (nonce and confirmations only, as per project requirements)
- Manual override options for testing specific scenarios
- Simulation of confirmation increases for evolution testing

The block data controls allow for testing with different Bitcoin block data:

```tsx
const BlockDataControls = () => {
  const [blockHeight, setBlockHeight] = useState(750000);
  const [nonce, setNonce] = useState(0);
  const [confirmations, setConfirmations] = useState(0);
  const [manualOverride, setManualOverride] = useState(false);
  const [loading, setLoading] = useState(false);

  const fetchBlockData = async () => {
    try {
      setLoading(true);
      // In development, we use a mock API or the actual API
      const response = await fetch(`/r/blockinfo/${blockHeight}`);
      const data = await response.json();

      if (!manualOverride) {
        setNonce(data.nonce);
        setConfirmations(data.confirmations);
      }
    } catch (error) {
      console.error('Failed to fetch block data:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleBlockHeightChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = parseInt(e.target.value, 10);
    if (!isNaN(value) && value >= 0) {
      setBlockHeight(value);
    }
  };

  const simulateConfirmationIncrease = () => {
    setConfirmations(prev => prev + 1);
  };

  const simulateMilestone = (milestone: number) => {
    setConfirmations(milestone);
  };

  return (
    <div className="block-data-controls">
      <h3>Block Data</h3>

      <div className="block-height-input">
        <label htmlFor="block-height">Block Height:</label>
        <input
          id="block-height"
          type="number"
          value={blockHeight}
          onChange={handleBlockHeightChange}
          min="0"
        />
        <button onClick={fetchBlockData} disabled={loading}>
          {loading ? 'Loading...' : 'Fetch'}
        </button>
      </div>

      <div className="block-data-display">
        <div>
          <span>Nonce:</span>
          <input
            type="number"
            value={nonce}
            onChange={(e) => setNonce(parseInt(e.target.value, 10))}
            disabled={!manualOverride}
          />
        </div>
        <div>
          <span>Confirmations:</span>
          <input
            type="number"
            value={confirmations}
            onChange={(e) => setConfirmations(parseInt(e.target.value, 10))}
            disabled={!manualOverride}
          />
        </div>
      </div>

      <div className="manual-override">
        <label>
          <input
            type="checkbox"
            checked={manualOverride}
            onChange={(e) => setManualOverride(e.target.checked)}
          />
          Manual Override
        </label>
      </div>

      <div className="confirmation-simulation">
        <button onClick={simulateConfirmationIncrease}>
          +1 Confirmation
        </button>
        <div className="milestone-buttons">
          <button onClick={() => simulateMilestone(10000)}>10K</button>
          <button onClick={() => simulateMilestone(50000)}>50K</button>
          <button onClick={() => simulateMilestone(100000)}>100K</button>
        </div>
      </div>
    </div>
  );
};
```

### Role Management

- Visualization of role distribution
- Manual adjustment of role percentages for testing
- Color coding and filtering by role
- Role interaction matrix visualization and adjustment

The role management component allows for adjusting and visualizing particle roles:

```tsx
const RoleManagement = () => {
  const roles = [
    { id: 'core', name: 'Core', color: '#FF5555', percentage: 10 },
    { id: 'control', name: 'Control', color: '#55FF55', percentage: 20 },
    { id: 'movement', name: 'Movement', color: '#5555FF', percentage: 30 },
    { id: 'defense', name: 'Defense', color: '#FFFF55', percentage: 20 },
    { id: 'attack', name: 'Attack', color: '#FF55FF', percentage: 20 }
  ];

  const [roleData, setRoleData] = useState(roles);
  const [selectedRole, setSelectedRole] = useState<string | null>(null);
  const [showInteractionMatrix, setShowInteractionMatrix] = useState(false);

  const handlePercentageChange = (roleId: string, value: number) => {
    // Ensure percentages sum to 100%
    const newRoleData = roleData.map(role => {
      if (role.id === roleId) {
        return { ...role, percentage: value };
      }
      return role;
    });

    const total = newRoleData.reduce((sum, role) => sum + role.percentage, 0);

    if (total !== 100) {
      // Adjust other roles proportionally
      const adjustment = (100 - value) / (total - newRoleData.find(r => r.id === roleId)!.percentage);

      const adjustedRoleData = newRoleData.map(role => {
        if (role.id !== roleId) {
          return { ...role, percentage: Math.round(role.percentage * adjustment) };
        }
        return role;
      });

      setRoleData(adjustedRoleData);
    } else {
      setRoleData(newRoleData);
    }
  };

  const toggleRoleFilter = (roleId: string) => {
    setSelectedRole(selectedRole === roleId ? null : roleId);
  };

  return (
    <div className="role-management">
      <h3>Role Management</h3>

      <div className="role-distribution">
        <h4>Role Distribution</h4>
        <div className="role-bars">
          {roleData.map(role => (
            <div
              key={role.id}
              className="role-bar"
              style={{
                width: `${role.percentage}%`,
                backgroundColor: role.color,
                opacity: selectedRole === null || selectedRole === role.id ? 1 : 0.3
              }}
              onClick={() => toggleRoleFilter(role.id)}
            >
              {role.percentage > 10 && `${role.name} (${role.percentage}%)`}
            </div>
          ))}
        </div>
      </div>

      <div className="role-controls">
        {roleData.map(role => (
          <div key={role.id} className="role-control">
            <label style={{ color: role.color }}>{role.name}:</label>
            <input
              type="range"
              min="5"
              max="50"
              value={role.percentage}
              onChange={(e) => handlePercentageChange(role.id, parseInt(e.target.value, 10))}
            />
            <span>{role.percentage}%</span>
          </div>
        ))}
      </div>

      <button
        onClick={() => setShowInteractionMatrix(!showInteractionMatrix)}
        className="matrix-toggle"
      >
        {showInteractionMatrix ? 'Hide' : 'Show'} Interaction Matrix
      </button>

      {showInteractionMatrix && <RoleInteractionMatrix roles={roleData} />}
    </div>
  );
};
```

### Force Field Editor

- Visual editor for force field shapes and properties
- Force field creation and deletion tools
- Adjustment of rotation parameters for gyroscopic fields
- Visualization of field influence areas

The force field editor allows for creating and adjusting force fields:

```tsx
const ForceFieldEditor = () => {
  const [forceFields, setForceFields] = useState([
    { id: 'field1', type: 'sphere', position: { x: 0, y: 0, z: 0 }, radius: 5, strength: 1, role: 'core' },
    { id: 'field2', type: 'box', position: { x: 10, y: 0, z: 0 }, dimensions: { x: 5, y: 5, z: 5 }, strength: -0.5, role: 'defense' }
  ]);

  const [selectedField, setSelectedField] = useState<string | null>(null);
  const [newFieldType, setNewFieldType] = useState('sphere');

  const handleFieldSelect = (fieldId: string) => {
    setSelectedField(fieldId);
  };

  const handleFieldUpdate = (fieldId: string, updates: any) => {
    setForceFields(fields =>
      fields.map(field =>
        field.id === fieldId ? { ...field, ...updates } : field
      )
    );
  };

  const handleAddField = () => {
    const newField = {
      id: `field${forceFields.length + 1}`,
      type: newFieldType,
      position: { x: 0, y: 0, z: 0 },
      radius: newFieldType === 'sphere' ? 5 : undefined,
      dimensions: newFieldType === 'box' ? { x: 5, y: 5, z: 5 } : undefined,
      strength: 1,
      role: 'core'
    };

    setForceFields([...forceFields, newField]);
    setSelectedField(newField.id);
  };

  const handleRemoveField = (fieldId: string) => {
    setForceFields(fields => fields.filter(field => field.id !== fieldId));
    if (selectedField === fieldId) {
      setSelectedField(null);
    }
  };

  return (
    <div className="force-field-editor">
      <h3>Force Field Editor</h3>

      <div className="force-field-list">
        <h4>Force Fields</h4>
        <ul>
          {forceFields.map(field => (
            <li
              key={field.id}
              className={selectedField === field.id ? 'selected' : ''}
              onClick={() => handleFieldSelect(field.id)}
            >
              {field.type} ({field.role})
              <button onClick={() => handleRemoveField(field.id)}>X</button>
            </li>
          ))}
        </ul>

        <div className="add-field">
          <select
            value={newFieldType}
            onChange={(e) => setNewFieldType(e.target.value)}
          >
            <option value="sphere">Sphere</option>
            <option value="box">Box</option>
            <option value="cylinder">Cylinder</option>
            <option value="torus">Torus</option>
          </select>
          <button onClick={handleAddField}>Add Field</button>
        </div>
      </div>

      {selectedField && (
        <ForceFieldProperties
          field={forceFields.find(f => f.id === selectedField)!}
          onUpdate={(updates) => handleFieldUpdate(selectedField, updates)}
        />
      )}

      <div className="force-field-visualization">
        <Canvas>
          <ambientLight intensity={0.5} />
          <pointLight position={[10, 10, 10]} />
          <ForceFieldVisualizer
            fields={forceFields}
            selectedField={selectedField}
            onSelectField={handleFieldSelect}
          />
          <OrbitControls />
          <gridHelper args={[20, 20]} />
          <axesHelper args={[5]} />
        </Canvas>
      </div>
    </div>
  );
};
```

### Debug Visualization

- Toggle for force field boundaries
- Particle velocity and acceleration vectors
- Collision detection visualization
- Spatial partitioning grid display
- Energy level and interaction radius visualization

The debug visualization tools help developers understand the internal workings of the system:

```tsx
const DebugVisualization = () => {
  const [showForceFields, setShowForceFields] = useState(true);
  const [showVelocityVectors, setShowVelocityVectors] = useState(false);
  const [showAccelerationVectors, setShowAccelerationVectors] = useState(false);
  const [showCollisions, setShowCollisions] = useState(false);
  const [showSpatialGrid, setShowSpatialGrid] = useState(false);
  const [showInteractionRadius, setShowInteractionRadius] = useState(false);

  return (
    <div className="debug-visualization">
      <h3>Debug Visualization</h3>

      <div className="debug-toggles">
        <label>
          <input
            type="checkbox"
            checked={showForceFields}
            onChange={(e) => setShowForceFields(e.target.checked)}
          />
          Force Fields
        </label>

        <label>
          <input
            type="checkbox"
            checked={showVelocityVectors}
            onChange={(e) => setShowVelocityVectors(e.target.checked)}
          />
          Velocity Vectors
        </label>

        <label>
          <input
            type="checkbox"
            checked={showAccelerationVectors}
            onChange={(e) => setShowAccelerationVectors(e.target.checked)}
          />
          Acceleration Vectors
        </label>

        <label>
          <input
            type="checkbox"
            checked={showCollisions}
            onChange={(e) => setShowCollisions(e.target.checked)}
          />
          Collisions
        </label>

        <label>
          <input
            type="checkbox"
            checked={showSpatialGrid}
            onChange={(e) => setShowSpatialGrid(e.target.checked)}
          />
          Spatial Grid
        </label>

        <label>
          <input
            type="checkbox"
            checked={showInteractionRadius}
            onChange={(e) => setShowInteractionRadius(e.target.checked)}
          />
          Interaction Radius
        </label>
      </div>

      <div className="debug-settings">
        <h4>Debug Settings</h4>

        <div className="debug-setting">
          <label>Vector Scale:</label>
          <input type="range" min="0.1" max="5" step="0.1" defaultValue="1" />
        </div>

        <div className="debug-setting">
          <label>Grid Cell Size:</label>
          <input type="range" min="1" max="10" step="0.5" defaultValue="5" />
        </div>

        <div className="debug-setting">
          <label>Collision Highlight Duration (ms):</label>
          <input type="range" min="100" max="2000" step="100" defaultValue="500" />
        </div>
      </div>

      <div className="debug-stats">
        <h4>Debug Statistics</h4>

        <div className="stat-row">
          <span>Active Particles:</span>
          <span>500</span>
        </div>

        <div className="stat-row">
          <span>Force Calculations:</span>
          <span>124,750 / frame</span>
        </div>

        <div className="stat-row">
          <span>Collisions:</span>
          <span>32 / frame</span>
        </div>

        <div className="stat-row">
          <span>Spatial Grid Cells:</span>
          <span>64</span>
        </div>

        <div className="stat-row">
          <span>Average Particles per Cell:</span>
          <span>7.8</span>
        </div>
      </div>
    </div>
  );
};
```

## Implementation Approach

### Component Architecture

The Development UI follows a modular component architecture:

```
┌─────────────────────────────────────────────────────────┐
│                     Development UI                       │
├─────────────┬─────────────┬────────────────┬────────────┤
│ Visualization│  Parameter  │   Debugging    │  Preset    │
│    Panel     │   Controls  │     Tools      │  Manager   │
├─────────────┼─────────────┼────────────────┼────────────┤
│             Simulation Engine Interface                  │
└─────────────────────────────────────────────────────────┘
```

This architecture ensures:

1. **Separation of Concerns**: Each component has a specific responsibility
2. **Modularity**: Components can be developed and tested independently
3. **Reusability**: Common components can be reused across the UI
4. **Maintainability**: Changes to one component don't affect others
5. **Testability**: Components can be tested in isolation

### Technology Stack

The Development UI is built using the following technologies:

- **React**: For building the UI components
- **Three.js**: For 3D visualization of particles and force fields
- **React Three Fiber**: React bindings for Three.js
- **Zustand**: For state management
- **TypeScript**: For type safety and better developer experience
- **CSS Modules**: For component-scoped styling

This technology stack provides:

1. **Performance**: Efficient rendering of complex 3D scenes
2. **Developer Experience**: Strong typing and modern tooling
3. **Maintainability**: Component-based architecture with clear separation of concerns
4. **Flexibility**: Easy integration with the simulation engine
5. **Testability**: Components can be tested in isolation

### Parameter Categories

The Development UI provides controls for various parameter categories:

1. **Physics Parameters**
   - Gravity strength
   - Collision elasticity
   - Damping factors
   - Time step size
   - Cutoff distance
   - Viscosity

2. **Particle Parameters**
   - Size ranges by role
   - Color schemes
   - Energy consumption rates
   - Trail properties
   - Particle count
   - Particle shapes

3. **Force Field Parameters**
   - Field strengths
   - Rotation speeds
   - Vertex counts
   - Influence radii
   - Field shapes
   - Field positions

4. **Role Parameters**
   - Role distribution percentages
   - Force matrix values
   - Visual characteristics by role
   - Behavioral properties
   - Interaction rules

5. **System Parameters**
   - Memory pool size
   - Worker count
   - Spatial grid resolution
   - Rendering quality
   - Performance settings

Each parameter category has its own dedicated control panel with appropriate input types (sliders, number inputs, color pickers, etc.) for each parameter.

## Preset System

The preset system allows developers to save and load parameter configurations for quick testing and comparison:

```tsx
const PresetSystem = () => {
  const [presets, setPresets] = useState([
    { id: 'preset1', name: 'Default', description: 'Default parameters', parameters: {} },
    { id: 'preset2', name: 'High Energy', description: 'High energy configuration', parameters: {} },
    { id: 'preset3', name: 'Slow Motion', description: 'Slow motion configuration', parameters: {} }
  ]);

  const [currentPreset, setCurrentPreset] = useState<string | null>('preset1');
  const [presetName, setPresetName] = useState('');
  const [presetDescription, setPresetDescription] = useState('');

  const simulationStore = useSimulationStore();

  const saveCurrentAsPreset = () => {
    if (!presetName) return;

    const newPreset = {
      id: `preset${Date.now()}`,
      name: presetName,
      description: presetDescription,
      parameters: simulationStore.getParameters()
    };

    setPresets([...presets, newPreset]);
    setCurrentPreset(newPreset.id);
    setPresetName('');
    setPresetDescription('');
  };

  const loadPreset = (presetId: string) => {
    const preset = presets.find(p => p.id === presetId);
    if (!preset) return;

    simulationStore.setParameters(preset.parameters);
    setCurrentPreset(presetId);
  };

  const deletePreset = (presetId: string) => {
    if (presets.length <= 1) return; // Keep at least one preset

    const newPresets = presets.filter(p => p.id !== presetId);
    setPresets(newPresets);

    if (currentPreset === presetId) {
      setCurrentPreset(newPresets[0].id);
      simulationStore.setParameters(newPresets[0].parameters);
    }
  };

  return (
    <div className="preset-system">
      <h3>Presets</h3>

      <div className="preset-list">
        {presets.map(preset => (
          <div
            key={preset.id}
            className={`preset-item ${currentPreset === preset.id ? 'active' : ''}`}
            onClick={() => loadPreset(preset.id)}
          >
            <div className="preset-info">
              <div className="preset-name">{preset.name}</div>
              <div className="preset-description">{preset.description}</div>
            </div>
            <button
              className="delete-preset"
              onClick={(e) => { e.stopPropagation(); deletePreset(preset.id); }}
            >
              X
            </button>
          </div>
        ))}
      </div>

      <div className="save-preset">
        <input
          type="text"
          placeholder="Preset name"
          value={presetName}
          onChange={(e) => setPresetName(e.target.value)}
        />
        <input
          type="text"
          placeholder="Description (optional)"
          value={presetDescription}
          onChange={(e) => setPresetDescription(e.target.value)}
        />
        <button onClick={saveCurrentAsPreset} disabled={!presetName}>Save Current</button>
      </div>

      <div className="preset-actions">
        <button onClick={() => simulationStore.resetToDefaults()}>Reset to Defaults</button>
        <button onClick={() => exportPresets(presets)}>Export Presets</button>
        <input
          type="file"
          id="import-presets"
          style={{ display: 'none' }}
          onChange={(e) => importPresets(e, setPresets)}
        />
        <label htmlFor="import-presets" className="button">Import Presets</label>
      </div>
    </div>
  );
};
```

## Development-Only Code Separation

To ensure the Development UI doesn't impact the production build, we use several strategies to separate development-only code:

```typescript
// src/config/environment.ts
export const isDevelopment = process.env.NODE_ENV === 'development';
export const isProduction = process.env.NODE_ENV === 'production';
export const isInscriptionMode = process.env.INSCRIPTION_MODE === 'true';

// Only include development UI in development mode
export const includeDevUI = isDevelopment && !isInscriptionMode;
```

### Code Splitting

```tsx
// src/App.tsx
import React, { lazy, Suspense } from 'react';
import { includeDevUI } from './config/environment';
import MainApplication from './components/MainApplication';

// Lazy load the Development UI
const DevelopmentUI = lazy(() =>
  includeDevUI
    ? import('./dev/DevelopmentUI')
    : Promise.resolve({ default: () => null })
);

const App = () => {
  return (
    <div className="app">
      <MainApplication />

      {includeDevUI && (
        <Suspense fallback={<div>Loading Development UI...</div>}>
          <DevelopmentUI />
        </Suspense>
      )}
    </div>
  );
};
```

### Build Configuration

```javascript
// vite.config.js
export default defineConfig(({ mode }) => {
  const isProduction = mode === 'production';
  const isInscriptionMode = process.env.INSCRIPTION_MODE === 'true';

  return {
    // ... other config
    build: {
      // ... other build options
      rollupOptions: {
        // Exclude development UI from production builds
        external: isProduction || isInscriptionMode ? ['./src/dev/**'] : [],
      },
    },
    define: {
      'process.env.NODE_ENV': JSON.stringify(mode),
      'process.env.INSCRIPTION_MODE': JSON.stringify(process.env.INSCRIPTION_MODE || 'false'),
    },
  };
});
```

### Development-Only Components

All development UI components are placed in a separate directory structure:

```
src/
├── components/       # Production components
└── dev/              # Development-only components
    ├── components/   # Development UI components
    ├── hooks/        # Development-only hooks
    ├── store/        # Development-only state management
    └── utils/        # Development-only utilities
```

This separation ensures that:

1. **Clean Production Builds**: No development UI code is included in production builds
2. **Clear Separation**: Development-only code is clearly separated from production code
3. **Efficient Tree-Shaking**: Build tools can easily exclude development-only code
4. **Reduced Bundle Size**: Production builds are as small as possible

## Transition to Production

The transition from development to production involves several steps to ensure the Development UI is completely removed:

```bash
# Build for development with Development UI
npm run build:dev

# Build for production without Development UI
npm run build:production

# Build for inscription (production build with special optimizations)
npm run build:inscription
```

### Production Build Process

1. **Environment Detection**:
   ```typescript
   // Check if we're in production mode
   if (process.env.NODE_ENV === 'production') {
     // Don't include development UI
   }
   ```

2. **Feature Flags**:
   ```typescript
   // Feature flags for different builds
   const features = {
     developmentUI: process.env.NODE_ENV === 'development',
     debugLogging: process.env.NODE_ENV === 'development',
     performanceMonitoring: true, // Included in all builds
     errorReporting: true // Included in all builds
   };
   ```

3. **Code Splitting**:
   ```typescript
   // Only load development UI in development mode
   if (process.env.NODE_ENV === 'development') {
     import('./dev/DevelopmentUI').then(module => {
       const DevUI = module.default;
       // Initialize Development UI
     });
   }
   ```

4. **Build Configuration**:
   ```javascript
   // vite.config.js
   export default defineConfig({
     // ... other config
     build: {
       // ... other build options
       rollupOptions: {
         // Exclude development UI from production builds
         external: isProduction ? ['./src/dev/**'] : [],
       },
     },
   });
   ```

## Production UI

The production UI is minimal and focused on the particle simulation itself:

```tsx
const ProductionUI = () => {
  return (
    <div className="production-ui">
      <Canvas>
        <ParticleRenderer />
        <CameraControls />
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} />
      </Canvas>

      <div className="info-overlay">
        <div className="logo">Bitcoin Protozoa</div>
        <div className="block-info">
          <div>Block: {blockHeight}</div>
          <div>Confirmations: {confirmations}</div>
        </div>
      </div>
    </div>
  );
};
```

The production UI includes only essential elements:

1. **Full-Screen Canvas**: Maximizes the visualization area
2. **Minimal Overlays**: Only essential information is displayed
3. **Block Information**: Shows the current block height and confirmations
4. **Branding**: Minimal branding elements
5. **Performance Optimizations**: Optimized for maximum performance

## Implementation Guidelines

When implementing the Development UI, follow these guidelines:

1. **Performance First**: Ensure the Development UI has minimal impact on simulation performance
   ```typescript
   // Use React.memo for components that don't need frequent updates
   const PerformanceMetrics = React.memo(() => {
     // Component implementation
   });
   ```

2. **Clean Separation**: Keep development-only code clearly separated
   ```typescript
   // Use environment checks to conditionally include code
   if (process.env.NODE_ENV === 'development') {
     // Development-only code
   }
   ```

3. **Responsive Design**: Ensure the UI works well on different screen sizes
   ```css
   /* Use responsive design principles */
   .control-panel {
     width: 300px;

     @media (max-width: 768px) {
       width: 100%;
       height: auto;
     }
   }
   ```

4. **Accessibility**: Ensure the UI is accessible
   ```tsx
   // Use proper ARIA attributes
   <button
     aria-label="Toggle control panel"
     onClick={togglePanel}
   >
     {expanded ? 'Collapse' : 'Expand'}
   </button>
   ```

5. **Consistent Styling**: Use a consistent design language
   ```typescript
   // Use a theme object for consistent styling
   const theme = {
     colors: {
       primary: '#1a1a1a',
       secondary: '#f5a623',
       background: '#121212',
       text: '#ffffff'
     },
     spacing: {
       small: '8px',
       medium: '16px',
       large: '24px'
     }
   };
   ```

## Related Documents

- [User Experience](01_user_experience.md) - For details on user experience design
- [Visual Design](02_visual_design.md) - For details on visual design principles
- [Color Themes](03_color_themes.md) - For details on color palettes and themes
- [Testing Strategy](../testing/01_testing_strategy.md) - For details on testing approach
- [Development Workflow](../deployment/01_development_workflow.md) - For details on the development process 
``` 
 
--- 
 
