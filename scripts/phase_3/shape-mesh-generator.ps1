# Shape Mesh Generator
# 
# This script generates and optimizes 3D meshes for particle shapes for the Bitcoin Protozoa project.
# It creates a set of shape definitions that can be used to render particles with different visual traits.
#
# Features:
# - Generates shape definitions for different particle roles
# - Creates shape variations based on rarity tiers
# - Implements shape modifiers for visual diversity
# - Exports shape definitions to TypeScript for use in the application
# - Provides shape preview functionality

# Configuration
$outputPath = "src\domains\trait\data\particleShapes.ts"

# Shape categories
$shapeCategories = @(
    "Basic",
    "Geometric",
    "Crystal",
    "Organic",
    "Abstract"
)

# Shape definitions
function New-ShapeDefinitions {
    $shapes = @{}
    
    # Basic shapes
    $shapes.sphere = @{
        name = "Sphere"
        category = "Basic"
        description = "Standard sphere shape"
        complexity = 1
        rarity = "Common"
        parameters = @{
            radius = 1.0
            widthSegments = 16
            heightSegments = 12
        }
        modifiers = @()
    }
    
    $shapes.cube = @{
        name = "Cube"
        category = "Basic"
        description = "Standard cube shape"
        complexity = 1
        rarity = "Common"
        parameters = @{
            width = 1.0
            height = 1.0
            depth = 1.0
            widthSegments = 1
            heightSegments = 1
            depthSegments = 1
        }
        modifiers = @()
    }
    
    $shapes.cylinder = @{
        name = "Cylinder"
        category = "Basic"
        description = "Standard cylinder shape"
        complexity = 1
        rarity = "Common"
        parameters = @{
            radiusTop = 1.0
            radiusBottom = 1.0
            height = 2.0
            radialSegments = 16
            heightSegments = 1
        }
        modifiers = @()
    }
    
    # Geometric shapes
    $shapes.cone = @{
        name = "Cone"
        category = "Geometric"
        description = "Standard cone shape"
        complexity = 2
        rarity = "Uncommon"
        parameters = @{
            radius = 1.0
            height = 2.0
            radialSegments = 16
            heightSegments = 1
        }
        modifiers = @()
    }
    
    $shapes.dodecahedron = @{
        name = "Dodecahedron"
        category = "Geometric"
        description = "Regular dodecahedron shape"
        complexity = 2
        rarity = "Uncommon"
        parameters = @{
            radius = 1.0
            detail = 0
        }
        modifiers = @()
    }
    
    $shapes.icosahedron = @{
        name = "Icosahedron"
        category = "Geometric"
        description = "Regular icosahedron shape"
        complexity = 2
        rarity = "Uncommon"
        parameters = @{
            radius = 1.0
            detail = 0
        }
        modifiers = @()
    }
    
    # Crystal shapes
    $shapes.octahedron = @{
        name = "Octahedron"
        category = "Crystal"
        description = "Regular octahedron shape"
        complexity = 3
        rarity = "Rare"
        parameters = @{
            radius = 1.0
            detail = 0
        }
        modifiers = @()
    }
    
    $shapes.tetrahedron = @{
        name = "Tetrahedron"
        category = "Crystal"
        description = "Regular tetrahedron shape"
        complexity = 3
        rarity = "Rare"
        parameters = @{
            radius = 1.0
            detail = 0
        }
        modifiers = @()
    }
    
    # Organic shapes
    $shapes.torus = @{
        name = "Torus"
        category = "Organic"
        description = "Standard torus shape"
        complexity = 4
        rarity = "Epic"
        parameters = @{
            radius = 1.0
            tube = 0.4
            radialSegments = 16
            tubularSegments = 32
        }
        modifiers = @()
    }
    
    $shapes.torusKnot = @{
        name = "TorusKnot"
        category = "Organic"
        description = "Complex torus knot shape"
        complexity = 5
        rarity = "Legendary"
        parameters = @{
            radius = 1.0
            tube = 0.4
            tubularSegments = 64
            radialSegments = 8
            p = 2
            q = 3
        }
        modifiers = @()
    }
    
    # Abstract shapes
    $shapes.gyroscope = @{
        name = "Gyroscope"
        category = "Abstract"
        description = "Complex gyroscope-like shape"
        complexity = 5
        rarity = "Mythic"
        parameters = @{
            radius = 1.0
            detail = 1
            rings = 3
        }
        modifiers = @()
    }
    
    return $shapes
}

# Shape modifiers
function New-ShapeModifiers {
    $modifiers = @{}
    
    # Basic modifiers
    $modifiers.scale = @{
        name = "Scale"
        description = "Scales the shape uniformly or non-uniformly"
        parameters = @{
            x = 1.0
            y = 1.0
            z = 1.0
        }
    }
    
    $modifiers.twist = @{
        name = "Twist"
        description = "Twists the shape around an axis"
        parameters = @{
            axis = "y"
            angle = 0.5
        }
    }
    
    $modifiers.noise = @{
        name = "Noise"
        description = "Applies noise to the shape vertices"
        parameters = @{
            amplitude = 0.1
            frequency = 1.0
            seed = 0
        }
    }
    
    # Advanced modifiers
    $modifiers.bend = @{
        name = "Bend"
        description = "Bends the shape along an axis"
        parameters = @{
            axis = "x"
            angle = 0.5
        }
    }
    
    $modifiers.taper = @{
        name = "Taper"
        description = "Tapers the shape along an axis"
        parameters = @{
            axis = "y"
            factor = 0.5
        }
    }
    
    return $modifiers
}

# Export shapes to TypeScript
function Export-ShapesToTypeScript {
    param (
        [hashtable]$shapes,
        [hashtable]$modifiers,
        [string]$outputPath
    )
    
    # Create the TypeScript file content
    $tsContent = @"
/**
 * Particle Shapes
 * 
 * This file contains shape definitions for particles.
 * Each shape has parameters that can be used to create a Three.js geometry.
 * 
 * IMPORTANT: This file is auto-generated. Do not edit directly.
 * Generated by shape-mesh-generator.ps1
 */

/**
 * Shape parameter interface
 */
export interface ShapeParameters {
  [key: string]: number | string;
}

/**
 * Shape modifier interface
 */
export interface ShapeModifier {
  name: string;
  description: string;
  parameters: ShapeParameters;
}

/**
 * Shape definition interface
 */
export interface ShapeDefinition {
  name: string;
  category: string;
  description: string;
  complexity: number;
  rarity: string;
  parameters: ShapeParameters;
  modifiers: ShapeModifier[];
}

/**
 * Shape modifiers
 */
export const SHAPE_MODIFIERS: Record<string, ShapeModifier> = {
"@
    
    # Add each modifier to the TypeScript content
    foreach ($key in $modifiers.Keys) {
        $modifier = $modifiers[$key]
        
        $modifierEntry = "  ${key}: {`n"
        $modifierEntry += "    name: `"$($modifier.name)`",`n"
        $modifierEntry += "    description: `"$($modifier.description)`",`n"
        $modifierEntry += "    parameters: {`n"
        
        foreach ($paramKey in $modifier.parameters.Keys) {
            $paramValue = $modifier.parameters[$paramKey]
            if ($paramValue -is [string]) {
                $modifierEntry += "      $paramKey: `"$paramValue`",`n"
            }
            else {
                $modifierEntry += "      $paramKey: $paramValue,`n"
            }
        }
        
        $modifierEntry += "    }`n"
        $modifierEntry += "  },`n"
        $tsContent += $modifierEntry
    }
    
    # Add shapes section
    $tsContent += @"
};

/**
 * Shape definitions
 */
export const SHAPE_DEFINITIONS: Record<string, ShapeDefinition> = {
"@
    
    # Add each shape to the TypeScript content
    foreach ($key in $shapes.Keys) {
        $shape = $shapes[$key]
        
        $shapeEntry = "  ${key}: {`n"
        $shapeEntry += "    name: `"$($shape.name)`",`n"
        $shapeEntry += "    category: `"$($shape.category)`",`n"
        $shapeEntry += "    description: `"$($shape.description)`",`n"
        $shapeEntry += "    complexity: $($shape.complexity),`n"
        $shapeEntry += "    rarity: `"$($shape.rarity)`",`n"
        $shapeEntry += "    parameters: {`n"
        
        foreach ($paramKey in $shape.parameters.Keys) {
            $paramValue = $shape.parameters[$paramKey]
            if ($paramValue -is [string]) {
                $shapeEntry += "      $paramKey: `"$paramValue`",`n"
            }
            else {
                $shapeEntry += "      $paramKey: $paramValue,`n"
            }
        }
        
        $shapeEntry += "    },`n"
        $shapeEntry += "    modifiers: []`n"
        $shapeEntry += "  },`n"
        $tsContent += $shapeEntry
    }
    
    # Close the TypeScript object and add utility functions
    $tsContent += @"
};

/**
 * Get a shape by name
 */
export function getShape(name: string): ShapeDefinition {
  const shapes = Object.values(SHAPE_DEFINITIONS);
  const shape = shapes.find(s => s.name === name);
  return shape || SHAPE_DEFINITIONS.sphere;
}

/**
 * Get shapes by category
 */
export function getShapesByCategory(category: string): ShapeDefinition[] {
  return Object.values(SHAPE_DEFINITIONS).filter(shape => shape.category === category);
}

/**
 * Get shapes by rarity
 */
export function getShapesByRarity(rarity: string): ShapeDefinition[] {
  return Object.values(SHAPE_DEFINITIONS).filter(shape => shape.rarity === rarity);
}

/**
 * Apply a modifier to a shape
 */
export function applyModifier(shape: ShapeDefinition, modifierName: string, parameters?: Partial<ShapeParameters>): ShapeDefinition {
  const modifier = SHAPE_MODIFIERS[modifierName];
  if (!modifier) {
    return shape;
  }
  
  // Create a copy of the shape
  const newShape = { ...shape };
  
  // Create a copy of the modifiers array
  newShape.modifiers = [...shape.modifiers];
  
  // Create a new modifier with custom parameters
  const newModifier = {
    name: modifier.name,
    description: modifier.description,
    parameters: { ...modifier.parameters, ...parameters }
  };
  
  // Add the modifier to the shape
  newShape.modifiers.push(newModifier);
  
  return newShape;
}
"@
    
    # Create the directory if it doesn't exist
    $directory = Split-Path -Path $outputPath -Parent
    if (-not (Test-Path -Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }
    
    # Write the TypeScript file
    Set-Content -Path $outputPath -Value $tsContent
    
    Write-Host "Exported $($shapes.Count) shape definitions and $($modifiers.Count) modifiers to $outputPath"
}

# Preview a shape in the console
function Show-Shape {
    param (
        [hashtable]$shape
    )
    
    Write-Host "Shape: $($shape.name) ($($shape.category))" -ForegroundColor Yellow
    Write-Host "Description: $($shape.description)" -ForegroundColor Gray
    Write-Host "Complexity: $($shape.complexity)" -ForegroundColor Gray
    Write-Host "Rarity: $($shape.rarity)" -ForegroundColor Gray
    Write-Host ""
    
    Write-Host "Parameters:" -ForegroundColor Cyan
    foreach ($paramKey in $shape.parameters.Keys) {
        $paramValue = $shape.parameters[$paramKey]
        Write-Host "  ${paramKey}: $paramValue" -ForegroundColor White
    }
    
    Write-Host ""
    
    if ($shape.modifiers.Count -gt 0) {
        Write-Host "Modifiers:" -ForegroundColor Cyan
        foreach ($modifier in $shape.modifiers) {
            Write-Host "  $($modifier.name)" -ForegroundColor White
            foreach ($paramKey in $modifier.parameters.Keys) {
                $paramValue = $modifier.parameters[$paramKey]
                Write-Host "    ${paramKey}: $paramValue" -ForegroundColor Gray
            }
        }
        Write-Host ""
    }
}

# Main execution logic

# Generate shape definitions and modifiers
$shapes = New-ShapeDefinitions
$modifiers = New-ShapeModifiers

# Preview some shapes
Write-Host "Preview of generated shapes:" -ForegroundColor Cyan
Write-Host "-------------------------" -ForegroundColor Cyan

$previewCount = [Math]::Min(5, $shapes.Count)
$previewShapes = $shapes.Keys | Select-Object -First $previewCount

foreach ($key in $previewShapes) {
    Show-Shape -shape $shapes[$key]
}

# Export shapes to TypeScript
Export-ShapesToTypeScript -shapes $shapes -modifiers $modifiers -outputPath $outputPath

Write-Host "Shape mesh generation complete!" -ForegroundColor Green
Write-Host "Generated $($shapes.Count) shape definitions and $($modifiers.Count) modifiers" -ForegroundColor Green
Write-Host "Exported to: $outputPath" -ForegroundColor Green
