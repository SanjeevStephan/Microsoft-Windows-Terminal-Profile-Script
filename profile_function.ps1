<#
 ____             __ _ _        _____                 _   _                 
|  _ \ _ __ ___  / _(_) | ___  |  ___|   _ _ __   ___| |_(_) ___  _ __  ___ 
| |_) | '__/ _ \| |_| | |/ _ \ | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
|  __/| | | (_) |  _| | |  __/ |  _|| |_| | | | | (__| |_| | (_) | | | \__ \ v1.0 | 26th March 2023
|_|   |_|  \___/|_| |_|_|\___| |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
      

.SYNOPSIS

.DESCRIPTION
    This PowerShell Script contains 'functions' that can be call from the terminal when required to perform task at any given time.

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    VERSION
        -v1.0
    DATE
        -26 March 2023   

#>
if($DEBUG["debug_function"] -eq "enable"){ Write-Output "[ OK ] Profile Function => { profile_function.ps1 } Loaded Successfully"} 
 

function EXEC($script_name,$argument) {
    $exec_script = getScript("execScript") # returns this path -> $Home\Documents\PowerShell\profile_execScript.ps1"

    if($script_name) # if script_name is not-empty | execute if-block 
    {
        if($argument) { & $exec_script.Path $script_name $argument} else { & $exec_script.Path $script_name }

    } else { Write-Output "Script Name is Empty | Try -> exec test"}  

    return $true
 }

function Test-Json($type,$file_or_directory) {

    if($type)
    {
        switch($type)
        {
            "script" 
            {
                $test_script = getScript($file_or_directory)
                #Write-Output "SHOWING SCRIPT PATH $($test_script.Path) for the Script $($test_script.Name)"
                Write-Output "Script Name :  $($test_script.Name) "
                Write-Output "Script File :  $($test_script.File)"
                Write-Output "Script Argument : $($test_script.Argument)"
                Write-Output "Script Parameter : $($test_script.Parameter)"
                Write-Output "Script Desc : $($test_script.Desc)"
                Write-Output "Script Path :  $($test_script.Path)"
            }
            "path"
            {
                $test_path = getPath($file_or_directory)
                Write-Output "Name : $($test_path.Name) "
                Write-Output "Directory: $($test_path.Directory)"
                Write-Output "Path :  $($test_script.Path)"
                Write-Output "Description : $($test_script.Desc)"

            }
            Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
    
        }

    }
    return $true
}


function Show-Table($type) {
# Update the value of the 'show_all_paths' property
$TABLE.show_all_paths = "enable"

    if($type)
    {
        switch($type)
        {
            "dependencies" { Table-Profile}
            "function"     { Table-Function("param") }
            "script"       { Table-Script("basic") }
            "json"         { Table-Json }
            "path"         { Table-Path("all") } 
            "all" 
            {
                Table-Profile
                Table-Function("all")
                Table-Script("all")
                Table-Json
                Table-Path("all")
            }
            Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
        }
    }
    return $true
}

function Check-File($type){

    if($type)
    {
        switch($type)
        {
            "profile"      { Check-Profile}
            "json"         { Check-Json }
            "path"         { Check-Path }
            "script"       { Check-Script } 
            "all" 
            {
                Check-Profile
                Check-Json
                Check-Path
                Check-Script
            }
            Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
        }
    }    
    return $true
}
#--------------------------------------{ Alphabet-A }--------------------------------------------------

#--------------------------------------{ Alphabet-B }--------------------------------------------------




#--------------------------------------{ Alphabet-C }--------------------------------------------------



#--------------------------------------{ Alphabet-D }--------------------------------------------------


#--------------------------------------{ Alphabet-E }--------------------------------------------------


#--------------------------------------{ Alphabet-F }--------------------------------------------------


#--------------------------------------{ Alphabet-G }--------------------------------------------------


#--------------------------------------{ Alphabet-H }--------------------------------------------------

#--------------------------------------{ Alphabet-I }--------------------------------------------------




#--------------------------------------{ Alphabet-J }--------------------------------------------------
#--------------------------------------{ Alphabet-K }--------------------------------------------------

#--------------------------------------{ Alphabet-L }--------------------------------------------------




#--------------------------------------{ Alphabet-M }--------------------------------------------------


#--------------------------------------{ Alphabet-N }--------------------------------------------------

#--------------------------------------{ Alphabet-O }--------------------------------------------------




#--------------------------------------{ Alphabet-P }--------------------------------------------------



#--------------------------------------{ Alphabet-Q }--------------------------------------------------


#--------------------------------------{ Alphabet-R }--------------------------------------------------


#--------------------------------------{ Alphabet-S }--------------------------------------------------


#--------------------------------------{ Alphabet-T }--------------------------------------------------



#--------------------------------------{ Alphabet-U }--------------------------------------------------


#--------------------------------------{ Alphabet-V }--------------------------------------------------


#--------------------------------------{ Alphabet-W }--------------------------------------------------


#--------------------------------------{ Alphabet-X }--------------------------------------------------





#--------------------------------------{ Alphabet-Y }--------------------------------------------------


#--------------------------------------{ Alphabet-Z }--------------------------------------------------
