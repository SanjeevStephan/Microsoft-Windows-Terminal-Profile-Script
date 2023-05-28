$powershell = "Documents\PowerShell"
$MAINFILE = @{
    "include"        ="auto\profile_include.ps1"
    "config"         = "dependency\100TheConfigurationFile.ps1"
    "launch_profile" = "assets\ascii\launchprofile.ascii"
}
$SHORCUTFILE = @{
    "include" = "profile.include"
    "config"  = "profile.config"
}
type "$Home\$powershell\$($MAINFILE.launch_profile)"

$output_include_file    = "$Home\$powershell\$($SHORCUTFILE.include)"
$output_include_content = "$Home\$powershell\$($MAINFILE.include)"

$output_config_file    = "$Home\$powershell\$($SHORCUTFILE.config)"
$output_config_content = "$Home\$powershell\$($MAINFILE.config)"

# Create Include-File
if(Test-Path $output_include_file)
{ 
    Write-Warning "File Already Exists : $(Split-Path $output_include_file -Leaf)"
    Write-Host "With Content : $(Get-Content $output_include_file)" -ForegroundColor Yellow
    # Launching the Profile Dependencies
    . $output_include_content
}
else 
{ 
    $create_include_file = "Set-Content -Path $output_include_file $output_include_content" 
    Invoke-Expression $create_include_file
    if(Test-Path $output_include_file)
    { 
        Write-Host "$(Split-Path $output_include_file -Leaf) Successfully Created at $output_include_file" -ForegroundColor Green
        Write-Host "Output Include File : $output_include_file"
        Write-Host "Output Include Content : $(Get-Content $output_include_file)"
        # Launching the Profile Dependencies
        . $output_include_content

    }
    else { Write-Warning "Failed to Create File : $(Split-Path $output_config_content -Leaf)"}
}

# Create Config-File

if(Test-Path $output_config_file)
{ 
    Write-Warning "File Already Exists : $(Split-Path $output_config_file -Leaf)"
    Write-Host "With Content : $(Get-Content $output_config_file)" -ForegroundColor Yellow

}
else 
{ 
    $create_include_file = "Set-Content -Path $output_config_file $output_config_content" 
    Invoke-Expression $create_include_file
    if(Test-Path $output_config_file)
    { 
        Write-Host "$(Split-Path $output_config_file -Leaf) Successfully Created at $output_config_file" -ForegroundColor Green
        Write-Host "Output Configuration File : $output_config_file"
        Write-Host "Output Configuration Content : $(Get-Content $output_config_file)"

    }
    else { Write-Warning "Failed to Create File : $(Split-Path $output_config_file -Leaf)"}
}

function deleteFiles()
{
    Start-Sleep -Seconds 4 # Wait for 4 seconds
    clear                  # Clears the Screen
    rm $output_config_file # Remove the \Documents\PowerShell\profile.include
    rm $output_include_file# Remove the \Documents\PowerShell\profile.config
}
