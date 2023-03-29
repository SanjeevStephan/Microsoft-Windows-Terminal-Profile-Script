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
        ->  Debug-Table()
 #>

 $INFO =  @{
    1 =  @{Title = "profile";              Desc = "SuperUser"}
    2 =  @{Title = "author";               Desc = "Sanjeev Stephan Murmu"}
    3 =  @{Title = "version";              Desc = "v1.0.0"}    
    4 =  @{Title = "github";               Desc = "https://github.com/SanjeevStephan/superuser"}        
}   

$FILE =  @{
    1 =  @{File = "config_file";          Desc = "profile_config.ps1"}
    2 =  @{File = "profile_file";         Desc = "Microsoft.PowerShell_profile.ps1"}
}  
$PATH =  @{
    1 =  @{Title = "profile_source";     Path = "$Home\Documents\PowerShell"}   
    2 =  @{Title = "myfunctions";        Path = "$Home\Documents\PowerShell\myfunctions"}
    3 =  @{Title = "myjson";             Path = "$Home\Documents\PowerShell\myjson"}
    4 =  @{Title = "mypython";           Path = "$Home\Documents\PowerShell\mypython"}
    5 =  @{Title = "myscripts";          Path = "$Home\Documents\PowerShell\myscripts"}
    6 =  @{Title = "mytest";             Path = "$Home\Documents\PowerShell\mytest"}
}    
<#
    DEBUG -> enable | disable
#>
$DEBUG = @{
    1 =  @{Title = "initial_debug";      Status = "enable"}        
    2 =  @{Title = "debug_test";         Status = "disable"}
    3 =  @{Title = "debug_config";       Status = "enable"}
    4 =  @{Title = "debug_exec_script";  Status = "enable"}
    5 =  @{Title = "debug_include";      Status = "enable"}
    6 =  @{Title = "debug_path";         Status = "enable"}
    7 =  @{Title = "debug_function";     Status = "enable"}
    8 =  @{Title = "debug_json";         Status = "enable"}
    9 =  @{Title = "debug_dependencies"; Status = "enable"}
    10 =  @{Title = "debug_myfunction";  Status = "enable"}
    11 = @{Title = "debug_function";     Status = "enable"}    
}
<#  
    FEATURE -> enable | disable
#>
$FEATURE = @{
    1 =  @{Title = "ascii";         Status = "disable"}
    2 =  @{Title = "figlet";        Status = "enable"}
    3 =  @{Title = "dependencies";  Status = "enable"}
}
$TABLE = @{
    1 =  @{Title = "show_overview";            Status = "enable"}
    2 =  @{Title = "show_all_paths";           Status = "enable"}    
    3 =  @{Title = "show_all_scripts";         Status = "enable"}
    4 =  @{Title = "show_all_dependencies";    Status = "enable"}
    5 =  @{Title = "show_all_jsons";           Status = "enable"}   
}
<#
    ExecutableScript => 'allow' | 'refuse'
#>
$EXECUTABLE = @{
    1 =  @{Title = "test";         Status = "allow"}
    2 =  @{Title = "test2";        Status = "allow"}
    3 =  @{Title = "exeScript";    Status = "allow"}
}

$ASSOCIATED = @{
    1 = @{Script = "include.ps1";         Json = "dependencies.json"}
    2 = @{Script = "getDependencies.ps1"; Json = "dependencies.json"}
    3 = @{Script = "getfunction.ps1";     Json = "profileFunctions.json"}
    4 = @{Script = "getPath.ps1";         Json = "directories.json"}
    5 = @{Script = "getScript.ps1";       Json = "myJsonList.json"}
    6 = @{Script = "execScript.ps1";      Json = "myScripts.json"}
}

$JSON = @{
    1 = @{Title = "dependencies";         Json = "dependencies.json"}
    2 = @{Title = "directories";          Json = "directories.json"}
    3 = @{Title = "myFunctions";          Json = "myFunctions.json"}
    4 = @{Title = "myIncludes";           Json = "myIncludes.json"}
    5 = @{Title = "myJsonList";           Json = "myJsonList.json"}
    6 = @{Title = "myScripts";            Json = "myScripts.json"}
    7 = @{Title = "profileFunction";      Json = "profileFunction.json"}
}
function Show-Config() 
{ 
    $INFO.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Profile"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.DESC}} -AutoSize
    $FILE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.File}}, @{label="Description"; expression={$_.Value.Desc}} -AutoSize  
    $PATH.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.Path}} -AutoSize    
    $DEBUG.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.Status}} -AutoSize
    $JSON.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.Json}} -AutoSize
    $TABLE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.Status}} -AutoSize
    $FEATURE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.Status}} -AutoSize  
    $EXECUTABLE.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Title}}, @{label="Description"; expression={$_.Value.Status}} -AutoSize    
    $ASSOCIATED.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}}, @{label="Script Name"; expression={$_.Value.Script}}, @{label="JSON In-Use"; expression={$_.Value.Json}} -AutoSize    
}
#>
function Debug-Table() {

    if($DEBUG[2]["Status"] -eq "enable")     # debug_config 
    { 
        Write-Output "[ OK ] Profile Config => { profile_config.ps1 } Loaded Successfully"} else { <# Do Nothing #>
        # Write-Output "Accessing Item at HashTable [1] Title : $($DEBUG[1]["Title"]) | Status : $($DEBUG[1]["Status"])" 
    }
  # if($DEBUG[2]["Status"] -eq "enable"){ 
}

Debug-Table

