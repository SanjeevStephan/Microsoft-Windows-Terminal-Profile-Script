function adobe-demo {
    $currentDir = Get-Location
    $demoDirs = @("THUMBNAIL","FOOTAGE", "AUDIO", "MUSIC", "SFX", "GRAPHICS", "SHORTS", "SCREENSHOT", "AE", "PREMIER", "PHOTOSHOP", "DOCUMENT", "EXPORT")

    Write-Host "Creating Directories at: $currentDir"

    for ($i = 0; $i -lt $demoDirs.Length; $i++) {
        $createTheseDir = "{0:D2}-{1}" -f ($i), $demoDirs[$i]
       #  $createTheseDir = "{0:D2}-{1}" -f ($i + 1), $demoDirs[$i]
	 $dirPath = Join-Path -Path $currentDir -ChildPath $createTheseDir

        if (-not (Test-Path $dirPath)) {
            New-Item -ItemType Directory -Path $dirPath | Out-Null
            Write-Host "Directory Created: $createTheseDir (Successfully)"
        } else {
            Write-Host "Directory Already Exists: $createTheseDir"
        }
    }
}

# Call the function
#CreateDemoDirectories
