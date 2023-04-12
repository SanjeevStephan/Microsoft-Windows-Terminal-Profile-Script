function Execute-Smarthome() {
    $hashFilename = Get-Script("smarthome")
    $scriptName   = $hashFilename.Name
    $scriptPath   = $hashFilename.Path
    $scriptDesc   = $hashFilename.Desc


    try { if(Test-Path $scriptPath) { & $scriptPath } else { Write-Host "[ ERROR ] Failed to Execute Script : $scriptName " -ForegroundColor Red} }
    <#Do this if a terminating exception happens#> 
    catch { Write-Host "[INVALID] script doesn't exists at Path : $scriptPath" -ForegroundColor Red  }
}