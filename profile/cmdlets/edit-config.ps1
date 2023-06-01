function Edit-Config()
{
   Write-Host "Opening -> TheConfigurationFile in PowerShell_ISE"
   powershell_ise.exe $($FILEPATH.TheConfigurationFile)
}