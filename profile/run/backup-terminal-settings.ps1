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
    -> Created On : 3rd June 2023
    -> By Author : Sanjeev Stephan Murmu


#>

    $source_file = $Terminal_JSON.path.source_file # \\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json
    $backup_file = $Terminal_JSON.path.backup_file  # \\PowerShell\\data\\backup\\new_terminal\\settings.json
    $copy_from_file = "$($env:LOCALAPPDATA)\$source_file" # $home\\AppData\\local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json
    $copy_to_dir = ReadJsonPath($Terminal_JSON.path.backup_dir) # $env:OneDrive\Documents\PowerShell\\data\\backup\\new_terminal\\
    $copy_to_file = ReadJsonPath($Terminal_JSON.path.backup_file) # $env:OneDrive\Documents\PowerShell\\data\\backup\\new_terminal\\settings.json
    $copiedFile = Split-Path -Leaf $copy_to_file # setting.json
    $file_to_be_renamed = ReadJsonPath($Terminal_JSON.path.renamed_to_file)  # $env:OneDrive\Documents\PowerShell\\data\\backup\\new_terminal\\settings.old.json
    $renamedFile = Split-Path -leaf $file_to_be_renamed # settings.old.json
    

   


    function BackupNow () 
    {
         # Copy-Item -Recurse -Force $copy_from_file $copy_to_file -Verbose
         Copy-Item -Recurse -Force $copy_from_file $copy_to_file #Copy the file to the /PowerShell/data/backup/terminal_settings/settings.jons
         Write-Host "|    |          |        |    |     ├──[ BACKUP ] File : $copiedFile" -ForegroundColor Yellow 
         Write-Host "|    |          |        |    |     └──[ OK ] Successfully Copied File to Path : $backup_file" -ForegroundColor Green 
    }

    <# ========================================== 1. Check  $copy_from_file exists =============================================#>
    # Check if the Source-File where we want to copy-from exists
    if(Test-Path $copy_from_file)
    {

        Write-Host "|    |          |        |    |     ├──[ FOUND ] SOURCE DIR : $source_file" -ForegroundColor Yellow 
    <# ========================================== 2. Check  $copy_to_dir exists =============================================#>
        if(Test-Path $copy_to_dir)
        {  #if the backup-directory exists where we have to copy-to the directory
         
         Write-Host "|    |          |        |    |     ├──[ FOUND ] BACKUP DIR : $copy_to_dir" -ForegroundColor Yellow 

    <# ========================================== 3. Check  $copy_to_file exists & Renamed to $file_to_be_renamed ==========================#>
            if(Test-Path $copy_to_file)
            {   # if file exists at path '/PowerShell/data/backup/terminal_settings/setting.json' 
                # then Renamed the file from 'settings.json' -> 'settings.old.json'

                Write-Host "|    |          |        |    |     ├──[ FOUND ] FILE : $renamedFile" -ForegroundColor Yellow 
                mv $copy_to_file $file_to_be_renamed 
                Write-Host "|    |          |        |    |     ├──[ RENAMED ] $copiedFile -> $renamedFile" -ForegroundColor Cyan
                # and then backup the source file named 'settings.json'.
                #BackupNow
    <# ============================== 4. Check $file_to_be_renamed exists & Delete $file_to_be_renamed & BackupNow() $==========================#>
            } elseif(Test-Path $file_to_be_renamed) 
            {   # if file exists at path '/PowerShell/data/backup/terminal_settings/setting.old.json' 
                Write-Host "|    |          |        |    |     ├──[ FOUND ] FILE : $file_to_be_renamed" -ForegroundColor Yellow 
                # this means 'setting.old.json' and 'settings.json' are not allowed to exists at the same time in the same universe directory.
                rm $file_to_be_renamed 
                Write-Host "|    |          |        |    |     ├──[ DELETED ] $renamedFile" -ForegroundColor Red
                # and then backup the source file named 'settings.json'.
                BackupNow
            } else 
  <# ============================== 5. else Call BackupNow() $==========================#>
            {   
                # and then backup the source file named 'settings.json'.
                BackupNow
            }
        }

    } else { Write-Host "|    |          |        |    |     └──[   ] Not Found   : $config_superuser" -ForegroundColor Red }
