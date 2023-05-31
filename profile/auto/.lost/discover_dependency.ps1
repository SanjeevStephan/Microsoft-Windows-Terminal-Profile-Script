# $JSON_DATA = ReadJson($Data.files)

# $Path = ReadJsonPath($JSON_DATA.profile.script)

# Write-Host "PATH : $Path"

# pwsh.exe -file "$($env:superuser_profile)\auto\Auto-Discover.ps1" -directory_index 3

cd "$($env:superuser_profile)\auto" 
.\Auto-Discover.ps1 -directory_index 2  # Discover Dependency Directory's Scripts

cd $env:PowerShell