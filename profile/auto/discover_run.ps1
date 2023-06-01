<#                                
 ____             __ _ _        ___            _           _      
|  _ \ _ __ ___  / _(_) | ___  |_ _|_ __   ___| |_   _  __| | ___ 
| |_) | '__/ _ \| |_| | |/ _ \  | || '_ \ / __| | | | |/ _` |/ _ \
|  __/| | | (_) |  _| | |  __/  | || | | | (__| | |_| | (_| |  __/ 2.profile_include.ps1
|_|   |_|  \___/|_| |_|_|\___| |___|_| |_|\___|_|\__,_|\__,_|\___| v1.0 | 26th-March-2023
                                                                  
.SYNOPSIS
    Script to include other PowerShell scripts 
.DESCRIPTION
    Execute the script_files that are 'included' using this 'Auto-Discover.ps1' script
.NOTES
    AUTHOR
        - Sanjeev Stephan Murmu
    SCRIPT
        - Auto-Discover.ps1
    VERSION
        - v1.0    
        
#-------------------- Must Check the Configuration File  --------------------------------------#>
# Define the path to the configuration file that contains additional Paths
# . $($env:superuser)


# Define three parameters: name, address, and age
param (
  [int]$directory_index=5
)

# function Auto-Discover($directory_index) {
# $SuperuserData = @{}
# directory_index = 3

$JSON_DATA                   = ReadJson($Data.dir)
$json_filename               = $JSON_DATA.info.file
#$directory_index             = $JSON_DATA.profile[3].index
$autodiscover_this_directory = ReadJsonPath($JSON_DATA.profile[$directory_index].path)
$ascii_path                  = ReadJsonPath($JSON_DATA.profile[$directory_index].ascii)
$title                       = $JSON_DATA.profile[$directory_index].title
$directory_short_path        = $JSON_DATA.profile[$directory_index].path
$directory_title             = Split-Path -Leaf $autodiscover_this_directory 
$no_of_files_included        = 0

# # Display Ascii-figlet Text "The Terminal"
#type $ascii_path   

    if(Test-Path $autodiscover_this_directory)
    {
 #      Write-Host "|    |               ├  $json_filename }" -ForegroundColor White 
 #      Write-Host "|    |               ├  discover_cmdlets" -ForegroundColor White 
        Write-Host "|    |          |        |    ├ STARTED ] Auto Discovery of $title Scripts in the Directories { $directory_title } " -ForegroundColor White   
 #      Write-Host "|    |          |    ├ JSON ]  File Path : $json_filename " -ForegroundColor Yellow
        Write-Host "|    |          |        |    ├ FOUND ] Directory : $autodiscover_this_directory" -ForegroundColor Yellow
        Write-Host "|    |          |        |    ├ LOADING-ALL ] The {*.ps1} in the { $directory_short_path } " -ForegroundColor Cyan
        # Write-Output "[ OK ] $title include => { profile_include.ps1 } Loaded Successfully"  
        # Get all the *.ps1 files in the "dependency" directory
        $dependency_files = Get-ChildItem -Path $autodiscover_this_directory -Filter "*.ps1" | Select-Object -ExpandProperty FullName
    
        Write-Debug "Directory Dependency : $autodiscover_this_directory"
        # Loop through each dependency file and include it in the profile
        foreach ($path in $dependency_files) {
            if (Test-Path $path) {
    
                $no_of_files_included = $no_of_files_included + 1
                Write-Host "|    |          |        |    ├ RUN ] $title : $(Split-Path -Leaf $path)" -ForegroundColor Green
                . $path
            } else {
                Write-Warning "Missing $(Split-Path -Leaf $path) at path $path"
            }
        }

       
        ## Check the Number of Files have been discovered and display output accordingly
        if($no_of_files_included -eq 0) 
        {      Write-Host "|    |          |        |    └────[ FAILED ] No Files Have been Discovered in { $directory_title }" -ForegroundColor Red  }
        else { Write-Host "|    |          |        |    └────[ SUCCESS ] Total { $no_of_files_included } PowerShell Scripts have been Successfully Discovered in { $directory_title }" -ForegroundColor Green }

    } else { Write-Error "$title directory path is empty : $autodiscover_this_directory"} 

# }