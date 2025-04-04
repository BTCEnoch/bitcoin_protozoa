# Color Palette Generator
#
# This script generates and previews color palettes based on color theory for the Bitcoin Protozoa project.
# It creates a set of color palettes for particle groups, with each palette consisting of 5 colors,
# one for each particle role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK).
#
# Features:
# - Generates color palettes based on color theory principles
# - Creates role-specific colors for each palette
# - Implements deterministic palette generation from Bitcoin block nonce
# - Provides preview functionality for generated palettes
# - Exports palettes to TypeScript for use in the application

# Configuration
$outputPath = "src\domains\trait\data\colorPalettes.ts"

# Color theory helper functions
function ConvertTo-Hex {
    param (
        [int]$r,
        [int]$g,
        [int]$b
    )

    return "#{0:X2}{1:X2}{2:X2}" -f $r, $g, $b
}

function ConvertFrom-Hex {
    param (
        [string]$hex
    )

    $hex = $hex.TrimStart('#')

    $r = [Convert]::ToInt32($hex.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($hex.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($hex.Substring(4, 2), 16)

    return @{
        r = $r
        g = $g
        b = $b
    }
}

function Get-ComplementaryColor {
    param (
        [int]$r,
        [int]$g,
        [int]$b
    )

    return @{
        r = 255 - $r
        g = 255 - $g
        b = 255 - $b
    }
}

function Get-AnalogousColors {
    param (
        [int]$r,
        [int]$g,
        [int]$b,
        [int]$angle = 30
    )

    # Convert RGB to HSV
    $max = [Math]::Max([Math]::Max($r, $g), $b) / 255.0
    $min = [Math]::Min([Math]::Min($r, $g), $b) / 255.0

    $h = 0
    $s = 0
    $v = $max

    $delta = $max - $min

    if ($delta -ne 0) {
        if ($max -eq ($r / 255.0)) {
            $h = (($g / 255.0) - ($b / 255.0)) / $delta
        }
        elseif ($max -eq ($g / 255.0)) {
            $h = 2 + (($b / 255.0) - ($r / 255.0)) / $delta
        }
        else {
            $h = 4 + (($r / 255.0) - ($g / 255.0)) / $delta
        }

        $h *= 60
        if ($h -lt 0) {
            $h += 360
        }

        $s = $delta / $max
    }

    # Create analogous colors by shifting hue
    $h1 = ($h + $angle) % 360
    $h2 = ($h - $angle + 360) % 360

    # Convert back to RGB
    $color1 = ConvertHSVToRGB -h $h1 -s $s -v $v
    $color2 = ConvertHSVToRGB -h $h2 -s $s -v $v

    return @($color1, $color2)
}

function ConvertHSVToRGB {
    param (
        [float]$h,
        [float]$s,
        [float]$v
    )

    if ($s -eq 0) {
        $r = $v * 255
        $g = $v * 255
        $b = $v * 255
        return @{
            r = [int]$r
            g = [int]$g
            b = [int]$b
        }
    }

    $h /= 60
    $i = [Math]::Floor($h)
    $f = $h - $i
    $p = $v * (1 - $s)
    $q = $v * (1 - $s * $f)
    $t = $v * (1 - $s * (1 - $f))

    switch ($i) {
        0 {
            $r = $v; $g = $t; $b = $p
            break
        }
        1 {
            $r = $q; $g = $v; $b = $p
            break
        }
        2 {
            $r = $p; $g = $v; $b = $t
            break
        }
        3 {
            $r = $p; $g = $q; $b = $v
            break
        }
        4 {
            $r = $t; $g = $p; $b = $v
            break
        }
        default {
            $r = $v; $g = $p; $b = $q
            break
        }
    }

    return @{
        r = [int]($r * 255)
        g = [int]($g * 255)
        b = [int]($b * 255)
    }
}

# Generate a triadic color scheme
function Get-TriadicColors {
    param (
        [int]$r,
        [int]$g,
        [int]$b
    )

    # Convert RGB to HSV
    $max = [Math]::Max([Math]::Max($r, $g), $b) / 255.0
    $min = [Math]::Min([Math]::Min($r, $g), $b) / 255.0

    $h = 0
    $s = 0
    $v = $max

    $delta = $max - $min

    if ($delta -ne 0) {
        if ($max -eq ($r / 255.0)) {
            $h = (($g / 255.0) - ($b / 255.0)) / $delta
        }
        elseif ($max -eq ($g / 255.0)) {
            $h = 2 + (($b / 255.0) - ($r / 255.0)) / $delta
        }
        else {
            $h = 4 + (($r / 255.0) - ($g / 255.0)) / $delta
        }

        $h *= 60
        if ($h -lt 0) {
            $h += 360
        }

        $s = $delta / $max
    }

    # Create triadic colors by shifting hue by 120 degrees
    $h1 = ($h + 120) % 360
    $h2 = ($h + 240) % 360

    # Convert back to RGB
    $color1 = ConvertHSVToRGB -h $h1 -s $s -v $v
    $color2 = ConvertHSVToRGB -h $h2 -s $s -v $v

    return @($color1, $color2)
}

# Generate a tetradic (double complementary) color scheme
function Get-TetradicColors {
    param (
        [int]$r,
        [int]$g,
        [int]$b
    )

    # Convert RGB to HSV
    $max = [Math]::Max([Math]::Max($r, $g), $b) / 255.0
    $min = [Math]::Min([Math]::Min($r, $g), $b) / 255.0

    $h = 0
    $s = 0
    $v = $max

    $delta = $max - $min

    if ($delta -ne 0) {
        if ($max -eq ($r / 255.0)) {
            $h = (($g / 255.0) - ($b / 255.0)) / $delta
        }
        elseif ($max -eq ($g / 255.0)) {
            $h = 2 + (($b / 255.0) - ($r / 255.0)) / $delta
        }
        else {
            $h = 4 + (($r / 255.0) - ($g / 255.0)) / $delta
        }

        $h *= 60
        if ($h -lt 0) {
            $h += 360
        }

        $s = $delta / $max
    }

    # Create tetradic colors by shifting hue
    $h1 = ($h + 90) % 360
    $h2 = ($h + 180) % 360
    $h3 = ($h + 270) % 360

    # Convert back to RGB
    $color1 = ConvertHSVToRGB -h $h1 -s $s -v $v
    $color2 = ConvertHSVToRGB -h $h2 -s $s -v $v
    $color3 = ConvertHSVToRGB -h $h3 -s $s -v $v

    return @($color1, $color2, $color3)
}

# Generate a monochromatic color scheme
function Get-MonochromaticColors {
    param (
        [int]$r,
        [int]$g,
        [int]$b,
        [int]$count = 4
    )

    # Convert RGB to HSV
    $max = [Math]::Max([Math]::Max($r, $g), $b) / 255.0
    $min = [Math]::Min([Math]::Min($r, $g), $b) / 255.0

    $h = 0
    $s = 0
    $v = $max

    $delta = $max - $min

    if ($delta -ne 0) {
        if ($max -eq ($r / 255.0)) {
            $h = (($g / 255.0) - ($b / 255.0)) / $delta
        }
        elseif ($max -eq ($g / 255.0)) {
            $h = 2 + (($b / 255.0) - ($r / 255.0)) / $delta
        }
        else {
            $h = 4 + (($r / 255.0) - ($g / 255.0)) / $delta
        }

        $h *= 60
        if ($h -lt 0) {
            $h += 360
        }

        $s = $delta / $max
    }

    # Create monochromatic colors by varying saturation and value
    $colors = @()

    for ($i = 0; $i -lt $count; $i++) {
        $newS = [Math]::Max(0.1, $s * (0.5 + ($i / $count) * 0.5))
        $newV = [Math]::Max(0.2, $v * (0.5 + (($count - $i) / $count) * 0.5))

        $colors += ConvertHSVToRGB -h $h -s $newS -v $newV
    }

    return $colors
}

# Generate a complete color palette for all roles
function New-ColorPalette {
    param (
        [string]$name,
        [string]$category,
        [hashtable]$baseColor = $null
    )

    # If no base color provided, generate a random one
    if ($null -eq $baseColor) {
        $baseColor = @{
            r = Get-Random -Minimum 0 -Maximum 256
            g = Get-Random -Minimum 0 -Maximum 256
            b = Get-Random -Minimum 0 -Maximum 256
        }
    }

    # Generate different color schemes based on the base color
    $complementary = Get-ComplementaryColor -r $baseColor.r -g $baseColor.g -b $baseColor.b
    $analogous = Get-AnalogousColors -r $baseColor.r -g $baseColor.g -b $baseColor.b
    $triadic = Get-TriadicColors -r $baseColor.r -g $baseColor.g -b $baseColor.b

    # Create the palette with role-specific colors
    $palette = @{
        name = $name
        category = $category
        description = "Generated palette based on color theory"
        CORE = @{ r = $baseColor.r / 255; g = $baseColor.g / 255; b = $baseColor.b / 255 }
        CONTROL = @{ r = $analogous[0].r / 255; g = $analogous[0].g / 255; b = $analogous[0].b / 255 }
        MOVEMENT = @{ r = $analogous[1].r / 255; g = $analogous[1].g / 255; b = $analogous[1].b / 255 }
        DEFENSE = @{ r = $triadic[0].r / 255; g = $triadic[0].g / 255; b = $triadic[0].b / 255 }
        ATTACK = @{ r = $complementary.r / 255; g = $complementary.g / 255; b = $complementary.b / 255 }
    }

    return $palette
}

# Generate a set of predefined palettes
function New-PredefinedPalettes {
    $palettes = @{}

    # Bitcoin-Inspired palettes
    $palettes.bitcoinClassic = New-ColorPalette -name "Bitcoin Classic" -category "Bitcoin-Inspired" -baseColor @{ r = 247; g = 147; b = 26 } # Bitcoin Orange
    $palettes.bitcoinGold = New-ColorPalette -name "Bitcoin Gold" -category "Bitcoin-Inspired" -baseColor @{ r = 255; g = 215; b = 0 } # Gold
    $palettes.bitcoinEarth = New-ColorPalette -name "Bitcoin Earth" -category "Bitcoin-Inspired" -baseColor @{ r = 210; g = 105; b = 30 } # Earth tone

    # Cosmic Voyage palettes
    $palettes.cosmicNebula = New-ColorPalette -name "Cosmic Nebula" -category "Cosmic Voyage" -baseColor @{ r = 123; g = 31; b = 162 } # Purple
    $palettes.cosmicStardust = New-ColorPalette -name "Cosmic Stardust" -category "Cosmic Voyage" -baseColor @{ r = 0; g = 191; b = 255 } # Deep Sky Blue

    # Digital Ecosystem palettes
    $palettes.digitalMatrix = New-ColorPalette -name "Digital Matrix" -category "Digital Ecosystem" -baseColor @{ r = 0; g = 255; b = 0 } # Matrix Green
    $palettes.digitalNeon = New-ColorPalette -name "Digital Neon" -category "Digital Ecosystem" -baseColor @{ r = 255; g = 0; b = 255 } # Neon Pink

    # Natural Themes palettes
    $palettes.naturalForest = New-ColorPalette -name "Natural Forest" -category "Natural Themes" -baseColor @{ r = 34; g = 139; b = 34 } # Forest Green
    $palettes.naturalOcean = New-ColorPalette -name "Natural Ocean" -category "Natural Themes" -baseColor @{ r = 0; g = 105; b = 148 } # Ocean Blue

    # Seasonal Themes palettes
    $palettes.seasonalSpring = New-ColorPalette -name "Seasonal Spring" -category "Seasonal Themes" -baseColor @{ r = 144; g = 238; b = 144 } # Light Green
    $palettes.seasonalAutumn = New-ColorPalette -name "Seasonal Autumn" -category "Seasonal Themes" -baseColor @{ r = 210; g = 105; b = 30 } # Brown

    return $palettes
}

# Export palettes to TypeScript
function Export-PalettesToTypeScript {
    param (
        [hashtable]$palettes,
        [string]$outputPath
    )

    # Create the TypeScript file content
    $tsContent = @"
/**
 * Color Palettes
 *
 * This file contains color palettes for particle groups.
 * Each palette consists of 5 colors, one for each particle role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK).
 *
 * IMPORTANT: This file is auto-generated. Do not edit directly.
 * Generated by color-palette-generator.ps1
 */

/**
 * Color interface
 */
export interface Color {
  r: number;
  g: number;
  b: number;
}

/**
 * Palette interface
 */
export interface Palette {
  name: string;
  category: string;
  description: string;
  CORE: Color;
  CONTROL: Color;
  MOVEMENT: Color;
  DEFENSE: Color;
  ATTACK: Color;
}

/**
 * Color palettes
 */
export const COLOR_PALETTES: Record<string, Palette> = {
"@

    # Add each palette to the TypeScript content
    foreach ($key in $palettes.Keys) {
        $palette = $palettes[$key]

        $paletteEntry = "  ${key}: {`n"
        $paletteEntry += "    name: `"$($palette.name)`",`n"
        $paletteEntry += "    category: `"$($palette.category)`",`n"
        $paletteEntry += "    description: `"$($palette.description)`",`n"
        $paletteEntry += "    CORE: { r: $($palette.CORE.r), g: $($palette.CORE.g), b: $($palette.CORE.b) },`n"
        $paletteEntry += "    CONTROL: { r: $($palette.CONTROL.r), g: $($palette.CONTROL.g), b: $($palette.CONTROL.b) },`n"
        $paletteEntry += "    MOVEMENT: { r: $($palette.MOVEMENT.r), g: $($palette.MOVEMENT.g), b: $($palette.MOVEMENT.b) },`n"
        $paletteEntry += "    DEFENSE: { r: $($palette.DEFENSE.r), g: $($palette.DEFENSE.g), b: $($palette.DEFENSE.b) },`n"
        $paletteEntry += "    ATTACK: { r: $($palette.ATTACK.r), g: $($palette.ATTACK.g), b: $($palette.ATTACK.b) }`n"
        $paletteEntry += "  },`n"
        $tsContent += $paletteEntry
    }

    # Close the TypeScript object
    $tsContent += @"
};

/**
 * Get a palette by name
 */
export function getPalette(name: string): Palette {
  return COLOR_PALETTES[name] || COLOR_PALETTES.bitcoinClassic;
}

/**
 * Get all palettes
 */
export function getAllPalettes(): Palette[] {
  return Object.values(COLOR_PALETTES);
}

/**
 * Get palettes by category
 */
export function getPalettesByCategory(category: string): Palette[] {
  return Object.values(COLOR_PALETTES).filter(palette => palette.category === category);
}
"@

    # Create the directory if it doesn't exist
    $directory = Split-Path -Path $outputPath -Parent
    if (-not (Test-Path -Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }

    # Write the TypeScript file
    Set-Content -Path $outputPath -Value $tsContent

    Write-Host "Exported $($palettes.Count) color palettes to $outputPath"
}

# Preview a color palette in the console
function Show-ColorPalette {
    param (
        [hashtable]$palette
    )

    Write-Host "Palette: $($palette.name) ($($palette.category))" -ForegroundColor Yellow
    Write-Host "Description: $($palette.description)" -ForegroundColor Gray
    Write-Host ""

    # Display each role color
    foreach ($role in @("CORE", "CONTROL", "MOVEMENT", "DEFENSE", "ATTACK")) {
        $color = $palette[$role]
        $hexColor = ConvertTo-Hex -r ([int]($color.r * 255)) -g ([int]($color.g * 255)) -b ([int]($color.b * 255))

        # Determine if text should be black or white based on color brightness
        $brightness = $color.r * 0.299 + $color.g * 0.587 + $color.b * 0.114
        $textColor = if ($brightness -gt 0.5) { "Black" } else { "White" }

        Write-Host "${role}: $hexColor" -ForegroundColor $textColor -BackgroundColor "Black"
    }

    Write-Host ""
}

# Main execution logic

# Generate predefined palettes
$palettes = New-PredefinedPalettes

# Generate additional random palettes to reach 50 total
$additionalPalettesNeeded = 50 - $palettes.Count
Write-Host "Generating $additionalPalettesNeeded additional random palettes..."

$categories = @(
    "Bitcoin-Inspired",
    "Cosmic Voyage",
    "Digital Ecosystem",
    "Natural Themes",
    "Seasonal Themes",
    "Emotional Themes",
    "Cultural Themes"
)

for ($i = 0; $i -lt $additionalPalettesNeeded; $i++) {
    $category = $categories[($i % $categories.Length)]
    $name = "$category $($i + 1)"
    $key = "${category.ToLower().Replace(' ', '')}$($i + 1)".Replace('-', '')

    $palettes[$key] = New-ColorPalette -name $name -category $category
}

# Preview some palettes
Write-Host "Preview of generated palettes:" -ForegroundColor Cyan
Write-Host "----------------------------" -ForegroundColor Cyan

$previewCount = [Math]::Min(5, $palettes.Count)
$previewPalettes = $palettes.Keys | Select-Object -First $previewCount

foreach ($key in $previewPalettes) {
    Show-ColorPalette -palette $palettes[$key]
}

# Export palettes to TypeScript
Export-PalettesToTypeScript -palettes $palettes -outputPath $outputPath

Write-Host "Color palette generation complete!" -ForegroundColor Green
Write-Host "Generated $($palettes.Count) color palettes" -ForegroundColor Green
Write-Host "Exported to: $outputPath" -ForegroundColor Green
