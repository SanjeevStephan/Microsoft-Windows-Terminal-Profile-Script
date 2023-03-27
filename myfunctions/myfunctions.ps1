# Load the functions from the JSON file
$json = Get-Content -Raw -Path "myfunctions.json" | ConvertFrom-Json

# Loop through the JSON objects and import the functions
foreach ($func in $json) {
    $filePath = $func.Path
    Write-Output "File Path : $filePath"
    $fileContent = Get-Content -Path $filePath -Raw
    # Write-Output "File Content : $fileContent"
    # Invoke-Expression $filePath
    . $filePath
    Write-Output "Successfully Loaded : $($func.Name)"
}
