<#
.SYNOPSIS
	Make the Computer go into SLEEP MODE

#>
function restart(){

#rundll32.exe powrprof.dll,SetSuspendState 0,1,0
#& cmd "$Home\Documents\PowerShell\myfunctions\sleep.cmd"

$commandToSleep = "shutdown -r -t 00"
Invoke-Expression "cmd /c $commandToSleep"

}