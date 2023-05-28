function Backup-Superuser() {
    $config_superuser = $DEPENDENCY.TheConfigurationFile
    $backup_dir = $DIRECTORY.backup
    $dest_file = "$backup_dir\superuser.ps1"

    if(Test-Path $config_superuser)
    {
        Write-Host "[ OK ] Found      : $config_superuser" -ForegroundColor Green 
        Write-Host "[ OK ] Copying-To : $backup_dir " -ForegroundColor Green
        Copy-Item -Recurse -Force $config_superuser $backup_dir 
    } else { Write-Host "[   ] Not Found   : $config_superuser" -ForegroundColor Red }

    if(Test-Path $dest_file) 
    {
          Write-Host "[ OK ] Successfully Copied File to Path : $dest_file" -ForegroundColor Yellow 
          #Dir $DIRECTORY.backup
    }
}