$figletHashTable = @{
    "Name" = "ascii figlet"
    "File" = "Figlet.ps1"
    "Path" = "$Home\Documents\PowerShell\profileFunction\Figlet.ps1"
    "Argument" = "Yes"
    "Parameter" = "msg"
    "Desc" = "Display the ascii text message - figlet"
    "SampleText" = "The Terminal"
}
# 
# Load the function from the file path specified in the configuration
. $figletHashTable.Path

# Call the function with the parameter value specified in the configuration
Figlet -msg $figletHashTable.Name

