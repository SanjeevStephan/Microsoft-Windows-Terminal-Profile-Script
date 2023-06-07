function renameall() {

Write-Host "What Do you want to Rename "
Write-Host "[1] Extension"

$choose = Read-Host "Enter Your Choose (1-n) :"

    switch($choose) {

        "1" { 
            $renameFrom = Read-Host "Extension To Rename : "
            $renameTo  = Read-Host "Extension To Be Renamed : "

            Get-ChildItem -Filter *.$renameFrom | Rename-Item -NewName { $_.Name -replace "\.$renameFrom", ".$renameTo" } 
            }
        Default { Write-Host "Wrong Input " }

    }

}