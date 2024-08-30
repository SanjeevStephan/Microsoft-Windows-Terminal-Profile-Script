function endproton($powershell_file)
{
    echo "Run As Administrator to Shutdown Proton"
    taskkill /F /IM ProtonVPNService.exe
    taskkill /F /IM ProtonVPN.exe
}