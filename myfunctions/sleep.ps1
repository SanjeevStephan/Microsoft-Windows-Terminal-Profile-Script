<#
.SYNOPSIS
	Make the Computer go into SLEEP 

#>
function sleep(){

rundll32.exe powrprof.dll,SetSuspendState 0,1,0

}