$profileFunctionsPath = "C:\Users\Sanju\Documents\PowerShell\profileFunction"
$jsonFilePath = "C:\Users\Sanju\Documents\PowerShell\functions.json"

# Get a list of files in the profileFunctions directory
$files = Get-ChildItem -Path $profileFunctionsPath -Filter *.ps1

# Create an empty array to store the JSON objects
$jsonObjects = @()

# Loop through each file and create a JSON object with the "Name", "File", and "Path" properties
foreach ($file in $files) {
    $jsonObject = @{
        Name = $file.BaseName
        File = $file.Name
        Path = $file.FullName
    }
    $jsonObjects += $jsonObject
}

# Load the existing JSON file, if it exists
if (Test-Path $jsonFilePath) {
    $existingJson = Get-Content $jsonFilePath -Raw | ConvertFrom-Json
    $existingNames = $existingJson.Name
} else {
    $existingJson = @()
    $existingNames = @()
}

# Filter out any objects in the new JSON that already exist in the existing JSON
$jsonObjects = $jsonObjects | Where-Object { $existingNames -notcontains $_.Name }

# Combine the existing JSON and the new JSON
$newJson = $existingJson + $jsonObjects

# Convert the array of JSON objects to a JSON string, but exclude the "Desc" and "Syntax" properties
$jsonString = $newJson | Select-Object Name, File, Path | ConvertTo-Json -Depth 100

# Write the JSON string to the functions.json file
Set-Content -Path $jsonFilePath -Value $jsonString
