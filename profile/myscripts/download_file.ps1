function Download-File($url)
{
    if($url)
    {
        #$url = "https://download.sysinternals.com/files/PSTools.zip"

        $location = Get-Location

        Write-Output "URL : $url"
        Write-Output "Active Location : $location"
        $fileName = Split-Path -Path $url -Leaf
        # Get the base name of the zip file (without the extension)
        $zipFileNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($url)

        $outputFolder = "$location\$zipFileNameWithoutExtension"
        Write-Output "Output Directory : $outputFolder"

        # Download the ZIP file
        Invoke-WebRequest -Uri $url -OutFile "$location\$fileName"
        
        # Extract the ZIP file
        Expand-Archive -Path "$location\$fileName" -DestinationPath $outputFolder

        # Navigate to the directory
        Set-Location -Path $outputFolder

        # List Files and Directories
        dir

        if((Read-Host "Do you want to open window ? (y/n) : ") -eq "y") { window <# open the window #> } else { <# do nothing#>}
    }
}