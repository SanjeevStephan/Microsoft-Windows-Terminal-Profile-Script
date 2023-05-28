<# 
 ____             __ _ _         ____             __ _       
|  _ \ _ __ ___  / _(_) | ___   / ___|___  _ __  / _(_) __ _ 
| |_) | '__/ _ \| |_| | |/ _ \ | |   / _ \| '_ \| |_| |/ _` |
|  __/| | | (_) |  _| | |  __/ | |__| (_) | | | |  _| | (_| | 1.profile_config.ps1
|_|   |_|  \___/|_| |_|_|\___|  \____\___/|_| |_|_| |_|\__, | v1.0 | 26th-March-2023
                                                       |___/  

                                                    
.SYNOPSIS
    Control how the Microsoft.Profile_profile's script behaves

 .DESCRIPTION
    This PowerShell Script defines the rule for the profile's scripts that will be run on the 'PowerShell Terminal v.7.2.2 & above'      

.NOTES
    .TAGS
        ->  INFO
        ->  FILE
        ->  PATH
        ->  DEBUG
        ->  FEATURE
        ->  EXECUTABLE
        ->  ASSOCIATED
    .FUNCTIONS
        ->  See-Config()
        ->  Debug-Config()
 #>

# Defined the TAGs of the configuration file that contains additional dependencies settings & paths


$INFO =  @{
    "profile"         = "SuperUser"
    "author"          = "Sanjeev Stephan Murmu"
    "version"         = "v1.0.0"  
    "thisgithubrepo"  = "https://github.com/SanjeevStephan/superuser"      
}  


$SOURCE = @{
    "profile"   = "Microsoft.PowerShell_profile.ps1"
    "home"      = "$Home"
    "documents" = "$Home\OneDrive\Documents"
    "powershell"= "$Home\OneDrive\Documents\PowerShell"

}

$SYSTEM = @{
    "username" = "Samst\\OneDriveOneDrive"

}


$DIRECTORY =  @{
    "home"                = "$Home"   
    "assets"              = "$($SOURCE.powershell)\myassets"
    "ascii"               = "$($DIRECTORY.assets)\ascii"
    "bot"                 = "$($DIRECTORY.assets)\bot"
    "backup"              = "$($SOURCE.powershell)\.backup"
    "consoles"            = "$($SOURCE.powershell)\consoles"
    "dependency"          = "$($SOURCE.powershell)\dependency"
    "legacy"              = "$($SOURCE.powershell)\legacy"
    "myfunctions"         = "$($SOURCE.powershell)\myfunction"
    "mygithubrepo"        = "$($SOURCE.powershell)\mygithubrepo"
    "myjson"              = "$($DIRECTORY.assets)\json"
    "mypython"            = "$($SOURCE.powershell)\mypython"
    "myscript"            = "$($SOURCE.powershell)\remoteScript"
    "mytest"              = "$($SOURCE.powershell)\mytest"
    "profileFunction"     = "$($SOURCE.powershell)\profileFunction"
    "remoteScript"        = "$($SOURCE.powershell)\remoteScript"
    "setup"               = "$($DIRECTORY.consoles)\setup"
    "tools"               = "$($DIRECTORY.assets)\tools"
    "toolsFunction"       = "$($DIRECTORY.assets)\tools\toolsFunction"
} 

$DEPENDENCY =  @{
    "TheConfigurationFile"    = "$($SOURCE.home)\superuser.ps1"
    "getPath"                 = "$($DIRECTORY.dependency)\getPath.ps1"   
    "getScript"               = "$($DIRECTORY.dependency)\getScript.ps1"   
    "getDependencies"         = "$($DIRECTORY.dependency)\getDependencies.ps1"   
    "getJson"                 = "$($DIRECTORY.dependency)\getJson.ps1"   
    "getFunction"             = "$($DIRECTORY.dependency)\getFunction.ps1" 

}


$ASCII = @{
    "superuser"     = "$($DIRECTORY.ascii)\text\superuser.ascii"
    "theterminal"   = "$($DIRECTORY.ascii)\text\theterminal.ascii"
    "profifle"      = "$($DIRECTORY.ascii)\text\theterminal.ascii"
    "setup"         = "$($DIRECTORY.ascii)\text\setup_basic.ascii"
    
}

$CONFIG = @{
    "superuser"    = "$($SOURCE.home)\superuser.ps1"
    "setup_config" = "$($DIRECTORY.setup)\setup"

}

$CONSOLE = @{
    "setup" =  "$($DIRECTORY.setup)\setup.ps1"   

}
$FILEPATH = @{
    "python"  = "$Home\AppData\Local\Programs\Python\Python*\python.exe"
    "TheConfigurationFile" = "$Home\superuser.ps1"
}

$JSON = @{
    "dependencies"     = "$($DIRECTORY.myjson)\dependencies.json" 
    "directories"      = "$($DIRECTORY.myjson)\directories.json" 
    "myFunctions"      = "$($DIRECTORY.myjson)\myFunctions.json" 
    "myFileList"       = "$($DIRECTORY.myjson)\myFileList.json" 
    "myIncludes"       = "$($DIRECTORY.myjson)\myIncludes.json" 
    "myJsonList"       = "$($DIRECTORY.myjson)\myJsonList.json" 
    "myPythonScript"   = "$($DIRECTORY.myjson)\myPythonScript.json" 
    "myScripts"        = "$($DIRECTORY.myjson)\myScripts.json" 
    "profileFunctions" = "$($DIRECTORY.myjson)\profileFunctions.json" 
    
}

$PYSCRIPT =  @{
    "figlet"                 = "$($DIRECTORY.mypython)\figlet.py"   
}


$TOOL = @{
    "replaceJson_substring"        = "$($DIRECTORY.tools)\filterAndReplace_subString.ps1"
    "replaceJson_substring_win11"  = "$($DIRECTORY.tools)\filterAndReplace_subString_win11.ps1"
}

$TAG =  @{
    1 =  @{Title = "INFO";              Desc = "Display Profile Information"}
    2 =  @{Title = "FILE";              Desc = "List of Profile's Main File"}
    3 =  @{Title = "PATH";              Desc = "List of Profile's' Sub-Directories"}    
    4 =  @{Title = "DEBUG";             Desc = "Store Debug Status"}        
    5 =  @{Title = "FEATURE";           Desc = "Store Feature Status"}
    6 =  @{Title = "TABLE";             Desc = "List of Key-Value Info in Table-Format"}    
    7 =  @{Title = "EXECUTABLE";        Desc = "Store Executable Status"}        
    8 =  @{Title = "ASSOCIATED";        Desc = "List of File that is Associated with Specific JSON File"}    
    9 =  @{Title = "JSON";              Desc = "List of JSON File in .\myjson Directory"}        
  
} 

function List($title)
{
    if($title)
    {
        switch($title)
        {
            "TAG" { $TAG.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="TAG Title"; expression={$_.Value.Title}}, @{label="Debug Status"; expression={$_.Value.Desc}} -AutoSize}
            Default {}
            
        }
    } else { Write-Error "Empty Arguments | You didn't entered any agument"}
}
<# 

$FEATURE = @{
    1 =  @{Title = "figlet";         Status = "enable"}
    2 =  @{Title = "ascii";          Status = "enable"}
    3 =  @{Title = "dependencies";   Status = "enable"}
}

$SETTINGS = @{
    1 =  @{Task = "Welcome Figlet Text";         Value = "Superuser"}
    2 =  @{Task = "Navigate to this Directory";   Value = "myfunctions"}
    3 =  @{Task = "dependencies";  Value = "enable"}
}

#>

