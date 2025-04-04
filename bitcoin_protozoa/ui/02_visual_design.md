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
