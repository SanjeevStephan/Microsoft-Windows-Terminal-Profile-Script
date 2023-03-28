<#
.SYNOPSIS
    
    PowerShell script that adds a new key-value pair to the User-level Environmental Variables:. 

.DESCRIPTION
    

	This script adds a new key-value pair to the Path variable for the current user. 
	You can modify the variable name and value to suit your needs. 
	Be sure to run this script with administrative privileges to make changes to the Environmental Variables.
    
.PARAMETER

    

.EXAMPLE

    
.INPUTS


.OUTPUTS    


.NOTES

     
.AUTHOR
    
    -Sanjeev Stephan Murmu

.LINK

-------------------------------|| CODE_BELOW ||-----------------------------
#>

   param(
       [Parameter(Mandatory=$true)]
       [string]$Key,
       [string]$Value
   )

   $greeting = "Added, $key! to the environment variable!"
   



# Define the key and value to add
# $key = "MY_VARIABLE"
# $value = "C:\MyFolder"

# Set the updated User-level Environmental Variables

[System.Environment]::SetEnvironmentVariable("$key", $value, "User")


return $greeting
<# 
-------------------------------|| CODE_ABOVE ||-----------------------------
------------------------------|| TERMINAL LOG ||----------------------------

PS D:\terminal>



#>
