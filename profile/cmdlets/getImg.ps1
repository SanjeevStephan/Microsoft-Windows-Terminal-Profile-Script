function getimg($url){


#$url = "https://i0.wp.com/randomnerdtutorials.com/wp-content/uploads/2021/05/Arduino-2-0-File-Preferences.png"
$output = (Invoke-WebRequest -Uri $url -OutFile ($url | Split-Path -Leaf)).FullName
$fileName = $url | Split-Path -Leaf
Write-Host "Downloaded file name: $fileName"
Set-Clipboard $fileName
Write-Host "Copied FileName to Clipboard"


}