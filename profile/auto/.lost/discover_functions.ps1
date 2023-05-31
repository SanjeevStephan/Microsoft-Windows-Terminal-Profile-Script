# pwsh.exe -file "$($env:superuser_profile)\auto\Auto-Discover.ps1" -directory_index 3

cd "$($env:superuser_profile)\auto"
.\Auto-Discover.ps1 -directory_index 3

cd $env:PowerShell