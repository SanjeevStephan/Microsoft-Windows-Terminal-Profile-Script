$python_download_url  = "https://www.python.org/ftp/python/3.11.3/python-3.11.3-amd64.exe"
$python_setup_file    =  Split-Path -Path $python_download_url -Leaf
$download_path        = "$Home\Downloads" 
$download_python_file = "$download_path\$python_setup_file"

Set-Location $download_path

function auto_download_git() {
   <# ================ First Install Git ======================#>
   Write-Host " [ INSTALLING ] Installing Latest Version of the Git-Cli" -ForegroundColor Cyan

   winget install --id Git.Git -e --source winget # Terminal Install Command
}
function auto_download_powershell() {
   <# ================ Install PowerShell ======================#>
   Write-Host " [ * ] Installing Latest Version of the PowerShell" -ForegroundColor Cyan
   winget search Microsoft.PowerShell # Terminal Search Command

   Write-Host " [ INSTALLING ] Installing Latest Version of the PowerShell..please wait.." -ForegroundColor Cyan
   Start-Sleep 2

   winget install --id Microsoft.Powershell --source winget # Terminal Install Command
}

function auto_download_python(){ 
   <# ================ Download Python ======================#>
   # Start-Process "https://www.python.org/downloads/"
   Invoke-WebRequest -Uri $python_download_url -OutFile $download_python_file
   
   if(Test-Path $download_python_file) { Start-Process -FilePath $download_python_file } else {  Write-Host " [ OK ] Failed to don" -ForegroundColor Red }
}
function check_internet_and_continue(){
    $check_internet = Test-NetConnection -ComputerName internetbeacon.msedge.net -InformationLevel Quiet -ErrorAction SilentlyContinue
     if($check_internet -eq $true) { autoinstaller } else { Write-Host "No Internet Connection Found!" -ForegroundColor Red }
}
function autoinstaller() {

        auto_download_git
        auto_download_powershell
        auto_download_python
}

function Auto-Install-Menu() {

    $install_options = @{
        0 = @{Name = "About";       Description = "About Auto-Installer" }
        1 = @{Name = "Git";         Description = "Install { Git } cli for Terminal" }
        2 = @{Name = "PowerShell 7";Description = "Install New Microsoft { PowerShell }" }
        3 = @{Name = "Python ";     Description = "Download the latest version of { Python } for Windows" }
        4 = @{Name = "VSCode";      Description = "Download The OpenSource Code Editor { VSCode }" }           
        
    }

    do {

        Write-Host "Please Wait...Loading autoinstaller."
        Start-Sleep -Seconds 1
        clear # Clear the Screen-Everytime 

        
        type $ASCII.autoinstaller
        $pwd = Get-Location 
        $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf

        Write-Host " Following Packages wil be installed using autoinstaller" -ForegroundColor Cyan

       $install_options.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Auto Install"; expression={$_.Value.Name}}, @{label="Description"; expression={$_.Value.Description}} -AutoSize

       $input = The-Prompt("Press ( e ) to edit or ( c ) to continue with autoinstaller!")

        # Check if the user entered 'e' and exit if they did
        if ($input -eq 'c') 
        { 
            Write-Host "Auto-installing now" -ForegroundColor Green
            check_internet_and_continue
            Start-Sleep 3

         } 
        elseif ($input -eq 'e') { powershell_ise "$($DIRECTORY.installer)/z-auto-installer-menu.ps1" }
        else { 
               Write-Host "Exiting...Auto-Installer"
               #
               #exit 0
             }

    }
    while($true)


    Set-Location "$Home\OneDrive\Documents\PowerShell\setup"
}
