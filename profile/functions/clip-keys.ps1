function clip-keys(){
    $keepass_key = $env:key_keepass
    $gpg_key     = $env:key_gpg

    Write-Host "[->] Send Passkey to the Clipboard"
    Write-Host "[0] Exit Console"
    Write-Host "[1] KeePass Key"
    Write-Host "[2] GPG Key"


    $copyToClipboard = ""
    $key_title = ""
    $emptyClipboard = ""



    do {
        $input = Read-Host "[Input] Select Which Key to Clip (1-2) : "

        switch($input)
        {
            "0" { break ; }
            "1" { $copyToClipboard = $keepass_key ;  $key_title = "KeePass" } 
            "2" { $copyToClipboard = $gpg_key ; $key_title = "GPG" } 
    
        }
    
        if($copyToClipboard -eq "")
        {
            Write-Host "[EMPTY] Nothing to Send to Clipboard"
        } 
        else 
        {
            Set-Clipboard $copyToClipboard
            $isCopied = Get-Clipboard
            if($isCopied -eq $copyToClipboard) { Write-Host "Successfully Copied [ $key_title ] Key to Clipboard " }
            else {   Write-Host "Failed to  Copy [ $key_title ] Key to Clipboard " }
    
        }

        $cleanupTime = 4
        Write-Host "[Clean] the Clipboard in $cleanupTime Seconds"
        Start-Sleep 4
        Set-Clipboard $emptyClipboard
        Write-Host "[Reset] the Clipboard. You're Passkey is Removed from Clipboard"


    
    } while ($input -eq "")
 <# Condition that stops the loop if it returns false #>
}