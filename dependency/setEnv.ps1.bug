function getEnv($key) {
    #$result = [Environment]::GetEnvironmentVariable($key, "User")


    # Get the value of the 'superuser_profile_myjson' environment variable
    # $envVarValue = $env:superuser_profile_myjson
    $envVarValue = $env:superuser_profile_myjson


    # Check if the variable has a value
    if ([string]::IsNullOrWhiteSpace($envVarValue)) {
        Write-Error "Environment variable '$key' is not set."
        return
    }

    # Use the variable value to construct the path
    $jsonFilePath = Join-Path $envVarValue "myjson.json"

    # Check if the file exists
    if (-not (Test-Path $jsonFilePath)) {
        Write-Error "JSON file not found at path: $jsonFilePath"
        return 
    }

    # Load the JSON file content into a variable
    # $jsonContent = Get-Content $jsonFilePath -Raw | ConvertFrom-Json



    return [bool]($result -ne $null)
}

function setEnv($key, $value) {
    [Environment]::SetEnvironmentVariable($key, $value, "User")

    checkEnv($key)
}

function checkEnv($key){

    #$key = "terminalf"
    #$value = "D:\terminal"

if (getEnv($key)) {
     Write-Host "[True] The $key environment variable already exist."       
} else {
     Write-Host "[False] The $key environment variable does not exist."
    #setEnv($key, $value)
    #Write-Host "The $key environment variable has been set to $value."
}

}


function addEnvFromHashTable() {
<# 
You can loop through the keys of the hashtable using a foreach loop and display each key, which represents the file name, using the Write-Host cmdlet. Here's an example:
#>

$files = @{
    "myjson"      = "C:\Users\Sanju\Documents\PowerShell\myjson"
    "myjson2"      = "C:\Users\Sanju\Documents\PowerShell\myjson2"
}

foreach ($key in $files.Keys) {
	$value = $files[$key]
	# & "1_add_variable_to_environment.ps1" -Key $key -Value $value
	& "C:\Users\Sanju\Documents\PowerShell\myfunctions\parameterArgs\setEnv.ps1" $key $value
	Write-Host "Added Key : $key and Value : $value to the env"
	Start-Sleep -Seconds 1
}

}

# addEnvFromHashTable

# Get the value of the 'superuser_profile_myjson' environment variable
$myjson = $env:myjson

Write-Output "myjson path : $myjson"

