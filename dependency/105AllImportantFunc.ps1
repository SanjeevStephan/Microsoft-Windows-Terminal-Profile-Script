$scriptName        = $MyInvocation.MyCommand.Name
$scriptFullPath    = $MyInvocation.MyCommand.Path
function DEBUG($debugMsg){ Write-Host "[ DEBUG ] $scriptName : $debugMsg " -ForegroundColor Magenta}

DEBUG("Script Started")

<# 
$command = "Figlet 'The Terminal'"
Invoke-Expression $command
#>











DEBUG("Script Ended")