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
if($DEBUG[11]["Status"] -eq "enable"){ Write-Output "[ OK ] Profile Function  => { profile_function.ps1 } Loaded Successfully"} 
 
#--------------------------------------{ Alphabet-A }--------------------------------------------------

#--------------------------------------{ Alphabet-B }--------------------------------------------------


#--------------------------------------{ Alphabet-C }--------------------------------------------------

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

#--------------------------------------{ Alphabet-D }--------------------------------------------------


#--------------------------------------{ Alphabet-E }--------------------------------------------------

function EXEC($script_name,$argument) {
    $exec_script = GET-SCRIPT("execScript") # returns this path -> $Home\Documents\PowerShell\profile_execScript.ps1"

    if($script_name) # if script_name is not-empty | execute if-block 
    {
        if($argument) { & $exec_script.Path $script_name $argument} else { & $exec_script.Path $script_name }

    } else { 
            Write-Output "Script Name is Empty | Try -> exec test"
            Table-Script name
            }  

    return $true
 }

#--------------------------------------{ Alphabet-F }--------------------------------------------------

function Figlet($msg){
    $exec_py_json = Get-Python("figlet")
    $py_script_path =  $($exec_py_json.Path)
    if($DEBUG[11]["Status"] -eq "enable"){ Write-Output "Python Script Path : $($exec_py_json.Path)" } else { <# Do nothing #>}
    # Execute python by supplying the --parameter and $argumnet 
    & python $py_script_path --message $msg 
 }

#--------------------------------------{ Alphabet-G }--------------------------------------------------


#--------------------------------------{ Alphabet-H }--------------------------------------------------
function Home() {
    $pshellSource = GET-PATH("powershell")
    cd $pshellSource.Path
}
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
function REFRESH () {
    clear
    .$PROFILE}
#--------------------------------------{ Alphabet-S }--------------------------------------------------

function Show-Table($type) {
    # Update the value of the 'show_all_paths' property
    $TABLE.show_all_paths = "enable"
    
        if($type)
        {
            switch($type)
            {
                "dependencies" { List-Profile}
                "function"     { List-Function("param") }
                "script"       { List-Script("basic") }
                "json"         { List-Json }
                "path"         { List-Path("all") } 
                "all" 
                {
                    List-Profile
                    List-Function("all")
                    List-Script("all")
                    List-Json
                    List-Path("all")
                }
                Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
            }
        }
        return $true
    }
    
#--------------------------------------{ Alphabet-T }--------------------------------------------------


function Test-Json($type,$file_or_directory) {

    if($type)
    {
        switch($type)
        {
            "script" 
            {
                $test_script = GET-SCRIPT($file_or_directory)
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
                $test_path = GET-PATH($file_or_directory)
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




#--------------------------------------{ Alphabet-U }--------------------------------------------------


#--------------------------------------{ Alphabet-V }--------------------------------------------------


#--------------------------------------{ Alphabet-W }--------------------------------------------------


#--------------------------------------{ Alphabet-X }--------------------------------------------------





#--------------------------------------{ Alphabet-Y }--------------------------------------------------


#--------------------------------------{ Alphabet-Z }--------------------------------------------------

