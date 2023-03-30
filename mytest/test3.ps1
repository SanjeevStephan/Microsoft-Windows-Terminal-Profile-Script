$callingFunction = $MyInvocation.MyCommand.Name
Write-Host "Function 'Goto-Directory()' was called by $callingFunction"

Write-Host "InvocationName: $($MyInvocation.InvocationName)"
Write-Host "Line: $($MyInvocation.Line)"
Write-Host "MyCommand: $($MyInvocation.MyCommand)"

Write-Host "ScriptName: $($MyInvocation.ScriptName)"

$scriptFileName = Split-Path -Path $MyInvocation.ScriptName -Leaf
Write-Host "The caller's script file name is: $scriptFileName"

