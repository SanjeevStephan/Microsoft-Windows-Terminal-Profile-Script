<#
.TITLE
    03-Include -> auto-include-script.ps1

.SYNOPSIS
    An Script to include all the scripts in the directory /setup/installer without specifying the name of the script!.
    

.DESCRIPTION
    
    .Index-of-Functions
        -> Menu-Json()
        -> List-Json()
        -> Read-JsonFile()
        -> Open-URL()

#>

function Menu-Json(){
    Write-Host " +-+-+-+-+-++-+-+-+-+ " -ForegroundColor Cyan
    Write-Host " |j|s|o|n|  |m|e|n|u| " -ForegroundColor Cyan
    Write-Host " +-+-+-+-+-++-+-+-+-+ " -ForegroundColor Cyan 

    Write-Host "  [ 1 ] Home" -ForegroundColor Cyan
    Write-Host "  [ 2 ] Open Links in JSON" -ForegroundColor Cyan
    Write-Host "  [ 3 ] Edit JSON" -ForegroundColor Cyan
    Write-Host "  [ 4 ] Read JSON" -ForegroundColor Cyan

}


function List-Json($searchForSubstring) {

    Write-Host "[DEBUG] Received Sub-String : $searchForSubstring"
    $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf
    $functionName     = $MyInvocation.MyCommand.Name

    # Specify the directory where the JSON files are located
    $dir = $DIRECTORY.jsons

    # Get all the JSON files in the specified directory

    $jsonFiles = Get-ChildItem -Path $dir -Filter *$searchForSubstring*.json

    <#
    switch($searchForSubstring) {
        "buy" { $jsonFiles = Get-ChildItem -Path $dir -Filter *buy*.json } 
        "list" { $jsonFiles = Get-ChildItem -Path $dir -Filter *list*.json }
        Default { Write-Host "No Valid Sub-String Mentioned | function $functionName()"}

    }
    #>

    # Display the list of JSON files and prompt the user to enter an index number
    Write-Host "JSON files in directory: $dir" -ForegroundColor Cyan
    for ($i = 0; $i -lt $jsonFiles.Count; $i++) {
        Write-Host "$i. $($jsonFiles[$i].Name)"
    }

    $fileIndex = The-Prompt("Enter the index number of the file to Select: ")

    #$fileIndex = Read-Host "Enter the index number of the file you want to display"

    # Check if the user entered 'e' and exit if they did
    if ($fileIndex -eq 'e') {
        Write-Host "Exiting...$functionName"
        break
    }


    # If the user entered a valid index number, display the JSON data
    if ([int]::TryParse($fileIndex, [ref]$null)) {
        if ($fileIndex -ge 0 -and $fileIndex -lt $jsonFiles.Count) {
            $jsonFileName = $jsonFiles[$fileIndex].FullName
            Write-Host "[Selected] Json File Name  : $jsonFileName" -ForegroundColor Cyan
            # $jsonData = Get-Content $jsonFiles[$fileIndex].FullName | ConvertFrom-Json
            # $jsonData | Format-Table | Sort-Object
            
        do {


            Menu-Json #display prompt-menu from 'zAll-Menu.ps1' file

            $choice = The-Prompt("[?] Enter Your Choice (1-5) : ")

                switch($choice) 
                {
                    "1" # Check if the user entered '1' and exit if they did
                        {
                            Write-Host "Exiting...$scriptName"
                            Start-Sleep -Seconds 1
                            #break
                            The-Console # Start Console Menu
                            #return $false
                        }
                    "2" { 
                            Write-Host "[Debug] Json File-Name : $jsonFileName" -ForegroundColor Magenta
                            Open-URL($jsonFileName) 
                    
                        }
                    "3" { powershell_ise $jsonFileName }
                    "4" { Read-JsonFile($jsonFileName) }
                    "5" { exit 1 <# this will exit the script entirely #> }
                    Default { Write-Output "Wrong Json File : $jsonFile " } 
                }


        } while($true)


                #Start-Sleep -Seconds 10


        }
        else {
            Write-Host "Invalid index number. Please try again." -ForegroundColor Red
        }
    }
    else {
        Write-Host "Invalid input. Please enter a valid index number." -ForegroundColor Red
    }


}

function Read-JsonFile($jsonFile) {
 $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf
# Specify the path to the JSON file
# $jsonFile = "C:\path\to\file.json"

# Read the contents of the JSON file and convert it to a PowerShell object
$jsonData = Get-Content $jsonFile | ConvertFrom-Json

# Display the resulting PowerShell object using Format-Table
$jsonData | Format-Table

# $choose = Read-Host "[Input] Press ('e' to exit to home menu) :"

 }

<#
 ----------- { Loop through all the json files in the directory and open the json files in brave }--------------
#>
<#
function Fetch-and-OpenJsonFile() {


    # Specify the directory where the JSON files are located
    $dir = $DIRECTORY.jsons

    # Get all the JSON files in the specified directory
    $jsonFiles = Get-ChildItem -Path $dir -Filter *.json

    # Display the list of JSON files and prompt the user to enter an index number
    Write-Host "JSON files in directory: $dir" -ForegroundColor Cyan

    for ($i = 0; $i -lt $jsonFiles.Count; $i++) {
        Write-Host "$i. $($jsonFiles[$i].Name)"
    }
    $fileIndex = The-Prompt("Enter the index number of the file you want to open in brave")
    #$fileIndex = Read-Host "Enter the index number of the file you want to open in brave"

    # If the user entered a valid index number, display the JSON data
    if ([int]::TryParse($fileIndex, [ref]$null)) {
        if ($fileIndex -ge 0 -and $fileIndex -lt $jsonFiles.Count) {
            $jsonFileName = $jsonFiles[$fileIndex].FullName
            Write-Host "Json File Name : $jsonFileName"

            # $jsonData = Get-Content $jsonFiles[$fileIndex].FullName | ConvertFrom-Json
            # $jsonData | Format-Table | Sort-Object
            #Read-JsonFile($jsonFileName)
            Open-URL($jsonFileName)
            #Read-JsonFile-Serial-No($jsonFileName)
        }
        else {
            Write-Host "Invalid index number. Please try again." -ForegroundColor Red
        }
    }
    else {
        Write-Host "Invalid input. Please enter a valid index number." -ForegroundColor Red
    }


}
#>
function Open-URL($JSONFilePath) {


    #check if the json file exists before Displaying the data from the JSON file

    if(Test-Path $JSONFilePath)
    {

        # Read the contents of the PATH file into a PowerShell object
        $myFunctionPATHContent = Get-Content $JSONFilePath | ConvertFrom-JSON

        # Create a hashtable to store the dependencies
        $myfunction_hashtable = @{}

        # Loop through each function in the PATH object and add it to the dependencies hashtable
        foreach ($function in $myFunctionPATHContent) {

            $myfunction_hashtable[$function.Title] = "$($function.Url)"

            $NAME = $($function.Title) 
            $URL = $($function.Url)


            if($($ScriptData.OpenLink -eq "yes")) { Start-Process $URL } else { } 
            if($($ScriptData.DisplayOpenLinkStatus -eq "yes")) { Write-Host "[ OK ] Opening in Default Browser => { $NAME }  Successfully"  -ForegroundColor Green  } else { Write-Host "Denied Opening Link : $NAME" -ForegroundColor Red} 
        
        }

    } else { Write-Error "[    ] Missing  : $(Get-FileName($PATH.jsonHomeAssistantChannels)) at $($PATH.jsonHomeAssistantChannels)" }

}