param (
    [int]$directory_index = 5
)

$script_name     = $MAIN_JSON_Data.dependency.directory.profile[$directory_index].script
$directory_title = $MAIN_JSON_Data.dependency.directory.profile[$directory_index].title
$directory_path  = $MAIN_JSON_Data.dependency.directory.profile[$directory_index].path
$directory_full_path = $ps + $directory_path



    Write-Host "|    |          |        ├──── $script_name" -ForegroundColor Cyan 
    Write-Host "|    |          |        |     └──[ STARTED  ] Auto Discovery of scripts in the Directory Path : " -ForegroundColor Yellow -NoNewline
    Write-Host $directory_path -ForegroundColor Green
    Write-Host "|    |          |        |        ├ LOCATION ] $directory_full_path"

# Get all the *.ps1 files in the current `$directory_full_path 
$all_available_scripts = Get-ChildItem -Path $directory_full_path -Filter "*.ps1" | Select-Object -ExpandProperty FullName

## Checks if the $directory_full_path is empty or not
if([string]::IsNullOrEmpty($directory_full_path))
{
   Write-Host "|    |          ├ EMPTY ] Variable : " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
   Write-Host "`$directory_full_path" -ForegroundColor Green -BackgroundColor Black -NoNewline
   Write-Host " is Empty" -ForegroundColor Red -BackgroundColor Black 
} 
else 
{
    if(Test-Path $directory_full_path)
    {
        
        Write-Host "|    |          |        |        ├────[ TOTAL ] Scripts Discovered : " -ForegroundColor Yellow -NoNewline
        Write-Host "$($all_available_scripts.Length)" -ForegroundColor Green 
        # Loop through each script file and execute the script along the way.
        foreach ($item_with_fullpath in $all_available_scripts)
        {
            Write-Host "|    |          |        |        ├────[ AUTO  ] Discovered : $(Split-Path -Leaf $item_with_fullpath )" -ForegroundColor Green 
      
      
            . $item_with_fullpath # execute the script 
      
        }
        # Check if all the number of files have been discovered and display the output accordingly.
        if($all_available_scripts.Length -eq 0 )
        {
                  Write-Host "|    |          |        |        └────[ EMPTY ] No Files Present! SORRY. Put Some Files First."
        } else {  Write-Host "|    |          |        |        └────[ Status ] Script Terminated : $script_name " -ForegroundColor Cyan} 



    }
    else {  Write-Host "$directory_title is unavailable at path : $directory_full_path"}
}
