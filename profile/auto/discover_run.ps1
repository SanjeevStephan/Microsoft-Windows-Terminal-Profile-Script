<#                                
 ____  _                               ____
|  _ \(_)___  ___ _____   _____ _ __  |  _ \ _   _ _ __    2.profile_include.ps1
| | | | / __|/ __/ _ \ \ / / _ \ '__| | |_) | | | | '_ \   v1.0 | 26th-March-2023
| |_| | \__ \ (_| (_) \ V /  __/ |    |  _ <| |_| | | | | 
|____/|_|___/\___\___/ \_/ \___|_|    |_| \_\\__,_|_| |_|
                                                               
.SYNOPSIS
    Script to include other PowerShell scripts in the '/PowerShell/profile/run'
.DESCRIPTION
    Execute the script_files that are 'included' using this 'discover_run.ps1' script
.NOTES
    AUTHOR
        - Sanjeev Stephan Murmu
    SCRIPT
        - discover_run.ps1
    VERSION
        - v1.0    
        
#------------------------------------------------#>

param (
  [int]$directory_index=5
)

$JSON_DATA                   = ReadJson($Data.dir)
$json_filename               = $JSON_DATA.info.file
$autodiscover_this_directory = ReadJsonPath($JSON_DATA.profile[$directory_index].path)
$ascii_path                  = ReadJsonPath($JSON_DATA.profile[$directory_index].ascii)
$title                       = $JSON_DATA.profile[$directory_index].title
$directory_short_path        = $JSON_DATA.profile[$directory_index].path
$directory_title             = Split-Path -Leaf $autodiscover_this_directory 
$no_of_files_included        = 0

if(Test-Path $autodiscover_this_directory)
{
    Write-Host "|    |          |        |    ├ STARTED ] Auto Discovery of $title Scripts in the Directories { $directory_title } " -ForegroundColor White   
    Write-Host "|    |          |        |    ├ FOUND ] Directory : $autodiscover_this_directory" -ForegroundColor Yellow
    Write-Host "|    |          |        |    ├ LOADING-ALL ] The {*.ps1} in the { $directory_short_path } " -ForegroundColor Cyan
    
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
    else { Write-Host "|    |          |        |    └────[ SUCCESS ] Total { $no_of_files_included } Scripts have been Successfully Discovered in { $directory_title }" -ForegroundColor Green }

} else { Write-Error "$title directory path is empty : $autodiscover_this_directory"} 

