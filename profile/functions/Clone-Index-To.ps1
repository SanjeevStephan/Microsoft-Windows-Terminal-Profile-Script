function Clone-Index-To($filename) {
    $idocs_url = "https://harnishdesign.net/demo/html/idocs/index.html"
    $location = Get-Location
    $filepath = "$location\$($filename).html"
    Invoke-WebRequest $idocs_url -OutFile $filepath
    if(Test-Path $filepath)
    {
        Write-Host "Download iDocs Index : $idocs_url"
        Write-Host "Created File-Name : $($filename).html"
        Write-Host "At Path : $filepath"
    } else { Write-Host "Failed to Download and Create File $filename "}
}
function Download-idocs() {
    $idocs_zip_url = "https://github.com/SanjeevStephan/iDocs/archive/refs/heads/main.zip"
    $location = Get-Location
    $filepath = "$location\iDocs-Main.zip"
    Invoke-WebRequest $idocs_zip_url -OutFile $filepath

    if(Test-Path $filepath)
    {
        Write-Host "Download iDocs Zip : $idocs_zip_url"
        Write-Host "Created File-Name : iDocs-Main.zip"
        Write-Host "At Path : $filepath"
    } else { Write-Host "Failed to Download iDocs Zip"}
}