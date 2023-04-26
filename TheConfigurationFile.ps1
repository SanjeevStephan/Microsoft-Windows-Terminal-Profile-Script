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
    "documents" = "$Home\Documents"
    "powershell"= "$Home\Documents\PowerShell"

}



$DIRECTORY =  @{
    "home"                = "$Home"   
    "assets"              = "$($SOURCE.powershell)\myassets"
    "ascii"               = "$($DIRECTORY.assets)\ascii"
    "dependency"          = "$($SOURCE.powershell)\dependency"
    "docs"                = "$Home\Documents"
    "legacy"              = "$($SOURCE.powershell)\legacy"
    "myfunctions"         = "$($SOURCE.powershell)\myfunction"
    "mygithubrepo"        = "$($SOURCE.powershell)\mygithubrepo"
    "myjson"              = "$($SOURCE.powershell)\myjson"
    "mypython"            = "$($SOURCE.powershell)\mypython"
    "myscript"            = "$($SOURCE.powershell)\myscript"
    "mytest"              = "$($SOURCE.powershell)\mytest"
    "profileFunction"     = "$($SOURCE.powershell)\profileFunction"
    "remoteScript"        = "$($SOURCE.powershell)\remoteScript"
} 

$DEPENDENCY =  @{
    "TheConfigurationFile" = "$($SOURCE.powershell)\TheConfigurationFile.ps1"
    "getPath"                 = "$($DIRECTORY.dependency)\getPath.ps1"   
    "getScript"               = "$($DIRECTORY.dependency)\getScript.ps1"   
    "getDependencies"         = "$($DIRECTORY.dependency)\getDependencies.ps1"   
    "getJson"                 = "$($DIRECTORY.dependency)\getJson.ps1"   
    "getFunction"             = "$($DIRECTORY.dependency)\getFunction.ps1" 

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

$FILEPATH = @{
    "python"  = "C:\Users\Sanju\AppData\Local\Programs\Python\Python*\python.exe"
    "TheConfigurationFile" = "$Home\Documents\PowerShell\TheConfigurationFile.ps1"
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

$ASCII = @{
    "superuser"     = "$($DIRECTORY.assets)\ascii\superuser.ascii"
    "theterminal"   = "$($DIRECTORY.assets)\ascii\theterminal.ascii"
    "profifle"      = "$($DIRECTORY.assets)\ascii\theterminal.ascii"
    
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


$CHECKS = @{
    1 =  @{Title = "initial_check";      Status = "enable"}   
    2 =  @{Title = "check_everything";   Status = "enable"}
    3 =  @{Title = "check_config";       Status = "enable"}
    4 =  @{Title = "check_env";          Status = "enable"}
    5 =  @{Title = "check_include";      Status = "enable"}

}


function Show-Config($tag_name) 
{ 

    switch($tag_name)
    {
        "info"  { $INFO.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Profile INFO"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.DESC}} -AutoSize }
        "file"  { $FILE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Main File"; expression={$_.Value.File}}, @{label="Description"; expression={$_.Value.Desc}} -AutoSize  }
        "dir"   { $DIRECTORY.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="PATH Title"; expression={$_.Value.Title}}, @{label="Directory"; expression={$_.Value.Path}} -AutoSize  }
        "debug" { $DEBUG.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="DEBUG Title"; expression={$_.Value.Title}}, @{label="Debug Status"; expression={$_.Value.Status}} -AutoSize }
 
        Default 
        {
            $INFO.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Profile INFO"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.DESC}} -AutoSize
            $FILE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Main File"; expression={$_.Value.File}}, @{label="Description"; expression={$_.Value.Path}} -AutoSize  
            $DIRECTORY.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="PATH Title"; expression={$_.Value.Title}}, @{label="Directory"; expression={$_.Value.Path}} -AutoSize    
            $FEATURE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Feature Title"; expression={$_.Value.Title}}, @{label="Feature Status"; expression={$_.Value.Status}} -AutoSize  
                      
        }
    }

 }

#>