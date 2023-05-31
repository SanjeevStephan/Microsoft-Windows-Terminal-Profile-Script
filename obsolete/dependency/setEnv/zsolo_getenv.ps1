# Get the value of the 'superuser_profile_myjson' environment variable
$jsonSource = $env:superuser_SUPERUSER_TERMINAL

# Check if the variable is set
if ([string]::IsNullOrWhiteSpace($jsonSource)) {
    Write-Error "Environment variable 'myjson' is not set."
    return
}

Write-Output "JSON SOURCE: $jsonSource"
