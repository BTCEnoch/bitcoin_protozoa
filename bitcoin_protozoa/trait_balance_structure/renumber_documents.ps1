# Renumber documents script
# This script renumbers the documents in the trait_balance_structure directory to maintain a sequential order

# Define the mapping of old to new numbers
$mapping = @{
    "00_index.md" = "00_index.md"  # Keep index as is
    "01_balancing_system_overview.md" = "01_balancing_system_overview.md"
    "02_trait_balance_analysis.md" = "02_trait_balance_analysis.md"
    "03_role_distribution_analysis.md" = "03_role_distribution_analysis.md"
    "04_implementation_plan_outline.md" = "04_implementation_plan_outline.md"
    "05_phase1_standardization.md" = "05_phase1_standardization.md"
    "07_scaling_functions.md" = "06_scaling_functions.md"  # Renumber from 7 to 6
    "08_summary_and_recommendations.md" = "07_summary_and_recommendations.md"  # Renumber from 8 to 7
    "09_particle_distribution_method.md" = "08_particle_distribution_method.md"  # Renumber from 9 to 8
    "10_trait_redesign_checklist.md" = "09_trait_redesign_checklist.md"  # Renumber from 10 to 9
    "11_trait_category_mapping_detailed.md" = "10_trait_category_mapping_detailed.md"  # Renumber from 11 to 10
    "12_class_system_implementation.md" = "11_class_system_implementation.md"  # Renumber from 12 to 11
    "13_implementation_plan.md" = "12_implementation_plan.md"  # Renumber from 13 to 12
    "14_documentation_cleanup_summary.md" = "13_documentation_cleanup_summary.md"  # Renumber from 14 to 13
}

# Get the current directory
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Rename the files
foreach ($oldName in $mapping.Keys) {
    $oldPath = Join-Path $currentDir $oldName
    $newPath = Join-Path $currentDir $mapping[$oldName]
    
    if (Test-Path $oldPath) {
        Write-Host "Renaming $oldPath to $newPath"
        Rename-Item -Path $oldPath -NewName $mapping[$oldName] -Force
    } else {
        Write-Host "File $oldPath not found, skipping"
    }
}

# Update references in the index file
$indexPath = Join-Path $currentDir "00_index.md"
$indexContent = Get-Content $indexPath -Raw

# Replace references in the index file
$indexContent = $indexContent -replace "07_scaling_functions.md", "06_scaling_functions.md"
$indexContent = $indexContent -replace "08_summary_and_recommendations.md", "07_summary_and_recommendations.md"
$indexContent = $indexContent -replace "09_particle_distribution_method.md", "08_particle_distribution_method.md"
$indexContent = $indexContent -replace "10_trait_redesign_checklist.md", "09_trait_redesign_checklist.md"
$indexContent = $indexContent -replace "11_trait_category_mapping_detailed.md", "10_trait_category_mapping_detailed.md"
$indexContent = $indexContent -replace "12_class_system_implementation.md", "11_class_system_implementation.md"
$indexContent = $indexContent -replace "13_implementation_plan.md", "12_implementation_plan.md"
$indexContent = $indexContent -replace "14_documentation_cleanup_summary.md", "13_documentation_cleanup_summary.md"

# Save the updated index file
Set-Content -Path $indexPath -Value $indexContent

Write-Host "Document renumbering complete"
