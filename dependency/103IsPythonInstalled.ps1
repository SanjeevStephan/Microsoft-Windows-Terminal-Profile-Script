
function isPythonInstalled()
{
    # The Path of the 'python executable' -> python.exe is fetched from '101Get-Dir.ps1'
    if (Test-Path $FILEPATH.python) 
    { 
        Write-Host "[ OK ] Python is installed." -ForegroundColor Green
        return $true
    } 
    else { 
            Write-Warning "Missing : $py_executable_file"
            Write-Warning "Python is not installed."
            return $false
        }
}


isPythonInstalled