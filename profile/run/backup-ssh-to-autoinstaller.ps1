<#

 ____             _
| __ )  __ _  ___| | ___   _ _ __
|  _ \ / _` |/ __| |/ / | | | '_ \
| |_) | (_| | (__|   <| |_| | |_) |
|____/ \__,_|\___|_|\_\\__,_| .__/
                            |_|
 ____       _   _   _                    _
/ ___|  ___| |_| |_(_)_ __   __ _ ___   (_)___  ___  _ __
\___ \ / _ \ __| __| | '_ \ / _` / __|  | / __|/ _ \| '_ \
 ___) |  __/ |_| |_| | | | | (_| \__ \_ | \__ \ (_) | | | |
|____/ \___|\__|\__|_|_| |_|\__, |___(_)/ |___/\___/|_| |_|
                            |___/     |__/
.SYNOPSIS
    Backup New-Window-Terminal's Settings to /PowerShell/data/backup/new_terminal

.DESCRIPTION
    This Script will automatically backup the 'settings.json'.
    Logic:
    => first run.
        -> Check if "settings.json" exists at path '\\PowerShell\\data\\backup\\new_terminal
        -> If it doesn't exists then call the functin 'BackupNow()' which copies the 'settings.json' from $source_dir
    => second run.
        -> Check if "settings.json" exists at path '\\PowerShell\\data\\backup\\new_terminal
        -> If it exists then renamed 'setting.json' -> 'settings.old.json
    => third run.
        -> When the Script runs for the third time.the script will do the following things.
        -> Checks if 'settings.old.json' exists. 
        -> if it exists then delete 'setting.old.json' 
        -> Copy the 'settings.json' from $source_dir from \\AppData\\local\\proograms\\Microsoft.WindowsTerminal_*\\LocalState\\settings.json

.NOTES
    -> Created On : 5rd June 2023
    -> By Author : Sanjeev Stephan Murmu


#>

$source_dir = "$home\.ssh\*" #$Terminal_JSON.path.source_file # \\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json

$backup_dir = $env:autoinstaller_ssh # $env:OneDrive\Documents\PowerShell\\data\\backup\\new_terminal\\

$short_bkp_path = $backup_dir.Split("\Documents\")[1]


if(Test-Path $source_dir)
{

if(Test-Path $backup_dir)
{
     Write-Host "|    |          |        |    |     ├──[ FOUND ] SOURCE : $source_dir" -ForegroundColor Yellow 
     Write-Host "|    |          |        |    |     ├──[ FOUND ] BACKUP : $backup_dir" -ForegroundColor Yellow 
    # Copy-Item -Recurse -Force $source_dir $copy_to_file -Verbose
     Copy-Item -Recurse -Force $source_dir $backup_dir #Copy the file to the  GitHub\autoinstaller\data\ssh_configs

    # Get the full path of the Directory 
    $dir = Resolve-Path $source_dir

    # Get all the file in the directory
    $files = Get-ChildItem -Path $dir -File

    # Loop through the files and display their index and name
    for($i = 0 ; $i -lt $files.Count; $i++)
    {
          $file = $files[$i]
          Write-Host "|    |          |        |    |     ├──[ Copying ] File [$($i + 1)] : $($file.Name)"
    }
          Write-Host "|    |          |        |    |     └──[ OK ] Successfully Copied File to Path : $short_bkp_path" -ForegroundColor Green 
 } else { Write-Host "|    |          |        |    |     └──[   ] Not Found   : $backup_dir" -ForegroundColor Red }



} else { Write-Host "|    |          |        |    |     └──[   ] Not Found   : $source_dir" -ForegroundColor Red }