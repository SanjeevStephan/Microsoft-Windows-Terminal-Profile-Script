function Check-All(){
                Write-Host "[CHECKING]------------------{ Profile Dependency }------------" -ForegroundColor Blue
                Check-Profile
                Write-Host "[CHECKING]------------------{ JSON Files }------------" -ForegroundColor Blue
                Check-Json
                Write-Host "[CHECKING]------------------{ Directories }------------" -ForegroundColor Blue
                Check-Path
                Write-Host "[CHECKING]------------------{ Executable Scripts }------------" -ForegroundColor Blue
                Check-Script
                Write-Host "[DONE] All Checking Done"

}
