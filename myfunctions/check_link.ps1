
function Check-Link()
{
    # $url = "https://download.sysinternals.com/files/PSTools.zip"
    $url = Get-Clipboard

    if($url)
    {
        Write-Output "URL : $url"
        $fileName = Split-Path -Path $url -Leaf
        Write-Output "File : $fileName"

        # Create a new web request object
        $request = [System.Net.WebRequest]::Create($url)

        try {
            # Send the request and get the response
            $response = $request.GetResponse()

            # Check the status code of the response
            if ($response.StatusCode -eq 'OK') {
                
                $choice = Read-Host "URL is active. Do you want to download...? (y/n) :"

                if($choice -eq "y")
                {  Download-File($url) <# Download the File to the active directory #> }
                else { Write-Output "You refused to download the file : $fileName"}
            } else { Write-Host "URL is not active. Status code: $($response.StatusCode)" }
        } catch { Write-Host "Error: $($_.Exception.Message)"} 
    } else { Write-Output "Clipboard is Empty!"}
    
}



