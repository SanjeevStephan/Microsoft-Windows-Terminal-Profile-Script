$jsonFilePath = "C:\Users\Sanju\Documents\PowerShell\myjson\jsontest\profileFunctions.json"

# Load the JSON file as an object
$json = Get-Content $jsonFilePath -Raw | ConvertFrom-Json

# Loop through each object in the JSON array and display the "Syntax", "Parameter", and "Desc" properties
foreach ($obj in $json) {
    Write-Host "Name: $($obj.Name)"
    Write-Host "Syntax: $($obj.Syntax)"
    Write-Host "Parameter: $($obj.Parameter)"
    Write-Host "Desc: $($obj.Desc)"
    Write-Host ""
}

