$profile_dependencies = @{
    # "powerShell_profile" = "$profile_source\Microsoft.PowerShell_profile.ps1"
     "allBasicFunc"       = "$dependency_source\allBasicFunc.ps1"
     "allDIR"             = "$dependency_source\allDIR.ps1"  
     "allTAGS"            = "$dependency_source\allTAGS.ps1"  
     "getDependencies"    = "$dependency_source\getDependencies.ps1"  
     "getColorSchema"    = "$dependency_source\getColorSchema.ps1"
     "getCoreDebug"       = "$dependency_source\getCoreDebug.ps1"  
     "getFunction"        = "$dependency_source\getFunction.ps1"
     "getJson"            = "$dependency_source\getJson.ps1"    
     "getPath"            = "$dependency_source\getPath.ps1"
     "getPython"          = "$dependency_source\getPython.ps1"
     "getLink"            = "$dependency_source\getLink.ps1"
     "getScript"          = "$dependency_source\getScript.ps1"
     "setMyFunctions"     = "$dependency_source\setMyFunctions.ps1"  
     "setProfileFunctions"= "$dependency_source\setProfileFunctions.ps1"  
     "profile_function"   = "$profile_source\profile_function.ps1"
     "profile_config"     = "$profile_source\profile_config.ps1"
     "profile_console"    = "$dependency_source\profile_console.ps1"
 }






 foreach ($dependency in $profile_dependencies.GetEnumerator() | Sort-Object -Property Key ) {
     $path = $dependency.Value
     if (Test-Path $path) {
         Write-Host "[ OK ] Dependency : $($dependency.Key) : Included $path " -ForegroundColor Blue
     . $path
     } else {
         Write-Warning "Missing { $($dependency.Key) } at path $path"
     }
 }

