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
if(InitialCheckStatus(1) -eq "enable")
{ 
    #Write-Output "<-------------------{ Loading Dependencies }-------------------------->"
    Write-Output "[ OK ] Profile Function  => { profile_function.ps1 } Loaded Successfully"
} 
