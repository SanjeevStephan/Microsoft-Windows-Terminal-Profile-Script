
# function Is-Python-Installed()
# {
#     # The Path of the 'python executable' -> python.exe is fetched from '101Get-Dir.ps1'
#     #if (Test-Path $FILEPATH.python) { return $true} 
#     #else { return $false }
# }

# Write-Host "[....] Checking if the Python is Installed or not"
# if(isPythonInstalled -eq $true)
# {
#     #Invoke-Expression $COMMAND.ascii_python_installed
#     Write-Host "[ OK ] Python is installed at $($FILEPATH.python)." -ForegroundColor Green
# }
# else 
# {
#     Write-Host  "[    ] Missing : $($FILEPATH.python)" -ForegroundColor Red
#     Write-Warning "[    ] Python is not installed."
# }



$python_installed_locatiion = "$home\$($Directory_JSON.software.python)"

if(Test-Path $python_installed_locatiion)
{
    Write-Host "|    |          |        |    |     ├──[ PYTHON ] is Installed On Your SyStem " -ForegroundColor Cyan
}
else 
{
    Write-Host "|    |          |        |    |     ├──[ PYTHON ] is Not Installed " -ForegroundColor Red
}