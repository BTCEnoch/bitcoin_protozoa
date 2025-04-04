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
