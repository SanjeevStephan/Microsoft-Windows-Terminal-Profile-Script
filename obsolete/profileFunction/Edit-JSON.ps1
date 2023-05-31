function Edit-Json{
    # Get-ChildItem -Path "myjson" -Filter *.json | ForEach-Object { Invoke-Item -Path $_.FullName -Wait -Verb RunAs }
    Get-ChildItem -Path "$Home\Documents\PowerShell\myjson" -Filter *.json | ForEach-Object { 
    #powershelll_ise  $_.FullName 
    $filename = Split-Path $($_.FullName) -Leaf
    Write-Output "Opening : $filename "
    powershell_ise.exe $_.FullName
    }

}