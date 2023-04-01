function Get-Dir()
{
    # Read JSON data from file
$json_data = Get-Content -Path Get-Json("directories") | ConvertFrom-Json

# Sort data alphabetically by directory name
$sorted_data = $json_data | Sort-Object -Property Directory

# Output formatted table
$sorted_data | Format-Table @{label="S.No"; expression={$sorted_data.IndexOf($_) + 1}}, 
                            @{label="Directory"; expression={$_.Directory}}, 
                            @{label="Path"; expression={$_.Path}},
                            @{label="Description"; expression={$_.Desc}} -AutoSize


}