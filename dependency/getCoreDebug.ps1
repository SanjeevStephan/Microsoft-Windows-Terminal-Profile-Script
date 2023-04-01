


function coreShowJSON($hashTableBox)
{
    # Get-Member -InputObject $MyInvocation

    $scriptName       = $hashTableBox["Script Name"]
    $scriptFullPath   = $hashTableBox["Script Path"]
    $scriptExecutedBy = $hashTableBox["Function Called By"]
    $invocationName   = $hashTableBox["InvocationName"]
    $invocationLine   = $hashTableBox["Invocation Line"]
    $invocationCommand   = $hashTableBox["Invocation Command"]
    $jsonFilePath        = $hashTableBox["JSON Path"]

    if(Test-Path $jsonFilePath)   { 
        $isJsonFileAvailable   = "Available" 
        $jsonFileName = Split-Path -Path $jsonFilePath -Leaf
    } else 
    { 
        $isJsonFileAvailable   = "Not-Available"
        $jsonFilePath = "Empty"
}
    if(Test-Path $scriptFullPath) { $isScriptFileAvailable = "Available" } else { $isScriptFileAvailable = "Not-Available"}

    Write-Host "[ INFO ] Script-Name   => { $scriptName }"            -ForegroundColor Yellow   
    Write-Host "[ INFO ] Script-Path   => { $scriptFullPath }"        -ForegroundColor Yellow  
    Write-Host "[ INFO ] Script-Status => { $isScriptFileAvailable }" -ForegroundColor Yellow       
    Write-Host "[ INFO ] JSON-Name     => { $jsonFileName }"          -ForegroundColor Yellow   
    Write-Host "[ INFO ] JSON-Path     => { $jsonFilePath }"          -ForegroundColor Yellow   
    Write-Host "[ INFO ] JSON-Status   => { $isJsonFileAvailable }"   -ForegroundColor Yellow   
    Write-Host "[ INFO ] Executed-By   => { $scriptExecutedBy } "     -ForegroundColor White 
<#    
    Write-Host "[ INFO ] Invocation-Name    => { $invocationName } "     -ForegroundColor White 
    Write-Host "[ INFO ] Invocation-Line    => { $invocationLine } "     -ForegroundColor White 
    Write-Host "[ INFO ] Invocation-Command => { $invocationCommand } "     -ForegroundColor White 
#>
}
     
function setCoreConfirmed(){

    
    Write-Host "[ OK ] Confirmed: '$($scripts.Name)' at $($scripts.Path)" -ForegroundColor Green
}




