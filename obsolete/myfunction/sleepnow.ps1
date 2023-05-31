<#
.SYNOPSIS
	Make the Computer go into SLEEP MODE

#>
function sleepnow(){

#rundll32.exe powrprof.dll,SetSuspendState 0,1,0
#& cmd "$Home\Documents\PowerShell\myfunctions\sleep.cmd"

$commandToSleep = "rundll32.exe powrprof.dll,SetSuspendState 0,1,0"
Invoke-Expression "cmd /c $commandToSleep"

}