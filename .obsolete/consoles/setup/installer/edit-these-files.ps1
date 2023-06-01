function Edit-Installer-Files() {
  <#
    powershell_ise $setup.Console
    Start-Sleep -Seconds 1
    powershell_ise $setup.Include
    Start-Sleep -Seconds 1
    powershell_ise $setup.TheConfigFile

   #>

    $setup_files = Get-ChildItem -Path $DIRECTORY.installer -Filter "*.ps1" | Select-Object -ExpandProperty FullName

    # Write-Debug "Directory setup : $($DIRECTORY.setup)"

            # Loop through each setup file and include it in the profile
            foreach ($path in $setup_files) {
                if (Test-Path $path) {
    
                    Write-Host "[ OK ] Opening in PowerShell_ISE : $(Split-Path -Leaf $path) -> Located {$path} " -ForegroundColor Blue
                    #Start-Sleep -Seconds 0.5

                    powershell_ise $path 

                } else { Write-Warning "[   ] Missing $(Split-Path -Leaf $path) at path $path" }
            } #foreach loop

   } 