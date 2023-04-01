<#
.SYNOPSIS
	Make the Computer go into SLEEP 

#>
function sleep(){

#rundll32.exe powrprof.dll,SetSuspendState 0,1,0
& "$Home\Documents\PowerShell\myfunctions\sleep.cmd"

cd "$Home\Documents\PowerShell\myfunctions\"
. sleep.cmd
Write-Warning "Sleep Not WOrking"
}