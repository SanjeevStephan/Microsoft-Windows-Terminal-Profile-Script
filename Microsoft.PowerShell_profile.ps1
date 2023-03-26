<#
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__|
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |   
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  

#>
<#-------------------- Directory Structure ----------------
.AUTHOR
    ->Sanjeev_Stephan_Murmu

.FILES
    -> Microsoft.PowerShell_profile.ps1
    -> profile_config.ps1
    -> profile_func.ps1
    -> profile_include.ps1
    -> profile_path.ps1

.CONTAINS
    -> configuration
    -> dictionary
    -> paths
    -> variables
    -> functions
    -> includedFiles

#>
#-------------------- Include Below File ----------------
. "$HOME\Documents\PowerShell\profile_include.ps1"
#-------------------- Functions {One-Liner}--------------


function initialize() {


}

#-------------------- Script Execution Begins from here-----
initialize  #calling the initialize() function 