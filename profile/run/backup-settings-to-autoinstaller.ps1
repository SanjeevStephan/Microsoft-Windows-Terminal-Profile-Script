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

$source_file = $env:terminal_settings_json #$Terminal_JSON.path.source_file # \\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json
$short_source_path = $source_file.Split("Samst")[1]
$backup_filename = Split-Path -Leaf $source_file  # \\PowerShell\\data\\backup\\new_terminal\\settings.json

$backup_dir = "$($env:autoinstaller)".Split("Main.PowerShell_Autoinstaller.ps1")[0] # $env:OneDrive\Documents\PowerShell\\data\\backup\\new_terminal\\
$copy_to_dir = "$backup_dir\data\terminal_settings"
$copy_to_file = "$copy_to_dir\$backup_filename"
# $renamedFile =  "$($backup_filename.Split('.json')[0]).old.json" # should return => settings.old.json
# $renamed_file_with_fullpath =  "$copy_to_dir\$renamedFile" # $env:OneDrive\Documents\PowerShell\\data\\backup\\new_terminal\\settings.old.json





function BackupNow () 
{
    # Copy-Item -Recurse -Force $source_file $copy_to_file -Verbose
     Copy-Item -Recurse -Force $source_file $copy_to_file #Copy the file to the /PowerShell/data/backup/terminal_settings/settings.jons
     Write-Host "|    |          |        |    |     ├──[ BACKUP ] File : $backup_filename" -ForegroundColor Yellow 
     Write-Host "|    |          |        |    |     └──[ OK ] Successfully Copied File to Path : $renamed_file_with_fullpath" -ForegroundColor Green 
}


if(Test-Path $source_file)
{

   #  Write-Host "|    |          |        |    |     ├──[ FOUND ] SOURCE : $short_source_path" -ForegroundColor Yellow 
<# ========================================== 2. Check  $copy_to_dir exists =============================================#>
    if(Test-Path $copy_to_dir)
    {  #if the backup-directory exists where we have to copy-to the directory  
        <# ========================================== 3. Check  $copy_to_file exists & Renamed to $renamed_file_with_fullpath ==========================#>
        Write-Host "|    |          |        |    |     ├──[ FOUND ] SOURCE : $source_file" -ForegroundColor Yellow 
        Write-Host "|    |          |        |    |     ├──[ FOUND ] BACKUP : $copy_to_file" -ForegroundColor Yellow 

        BackupNow
    }

} else { Write-Host "|    |          |        |    |     └──[   ] Not Found   : $config_superuser" -ForegroundColor Red }
