function getEnv($key) {
    $result = [Environment]::GetEnvironmentVariable($key, "User")
    return [bool]($result -ne $null)
}

function setEnv($key, $value) {
    [Environment]::SetEnvironmentVariable($key, $value, "User")
}

$key = "terminalf"
$value = "D:\terminal"

if (getEnv($key)) {
     Write-Host "[True] The $key environment variable already exist."       
} else {
     Write-Host "[False] The $key environment variable does not exist."
    #setEnv($key, $value)
    #Write-Host "The $key environment variable has been set to $value."
}
