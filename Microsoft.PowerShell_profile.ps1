#echo "Hello User ! Its a Simple Text "

$su = $env:superuser
$ms_profile_name = "Microsoft.PowerShell_profile.ps1"
$fail_safe_su_path = "C:\Users\Samst\OneDrive\Documents\PowerShell\superuser.ps1"
$su_file = Split-Path -Leaf $su
$su_name = $su_file.Split(".ps1")[0]


## First, Check if the $su is Empty or NUll 
# 1. Case -> Environment Variable is Empty or Null
# Read-More ( C:\Users\Samst\OneDrive\Documents\PowerShell\how-to\check-if-the-variable-is-empy-or-null.md )
if([string]::IsNullOrEmpty($su)) # Checks if the $su is empty or not 
{

    Write-Host "[ Missing ] SuperUser.ps1" -ForegroundColor Black -BackgroundColor Red -NoNewline
    Write-Host " Add " -ForegroundColor Black -BackgroundColor Green -NoNewline
    Write-Host " Key { superuser } to the Environment Variable" -ForegroundColor Black -BackgroundColor Cyan

    Write-Host "[ Location - { "-ForegroundColor White -BackgroundColor Black -NoNewline
    Write-Host " $fail_safe_su_path " -ForegroundColor Green -BackgroundColor Black -NoNewline
    Write-Host "} ]" -ForegroundColor White -BackgroundColor Black 

    # Launch the Environmental Variable
    # Read-More ( how-to/launch-environment-variable.md )
    rundll32.exe sysdm.cpl,EditEnvironmentVariables

    # Copy the Path of the "SuperUser.ps1" to the Clipboard
    Set-Clipboard $fail_safe_su_path
    Write-Host "[ Copied   - " -ForegroundColor White -BackgroundColor Black -NoNewline
    Write-Host "{  $fail_safe_su_path } " -ForegroundColor Green -BackgroundColor Black -NoNewline
    Write-Host "Path Copied to Clipboard ]" -ForegroundColor White -BackgroundColor Black -NoNewline

} else {
    ## if the $su is Not Empty or the Path is Available then check the existence of the file 'superuser.ps1' itself.

# 2.Case -> Check if File is Available or not
# Read-More ( C:\Users\Samst\OneDrive\Documents\PowerShell\how-to\check-if-path-exists.md )
    if(Test-Path $su)
    {
        Write-Host "[ Found ] SuperUser.ps1 " -ForegroundColor Black -BackgroundColor Green -NoNewline
        Write-Host " at $su" -ForegroundColor Green -BackgroundColor Black 
        Write-Host "$ms_profile_name"

        . $su # superuser.ps1 get executed here

    }      # 3. Case -> if not available then execute below command.
    else  { Write-Host "[ MISSING ] $su_name at $su" -ForegroundColor Black -BackgroundColor Red }


    Write-Host "└────────[ Status ]  Script Terminated -> " -ForegroundColor Cyan -NoNewline
    Write-Host $ms_profile_name -ForegroundColor Green
}