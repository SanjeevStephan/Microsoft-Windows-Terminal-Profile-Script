function pyserver($portno) {
    $myip = ip 
    $url = "http://$myip`:$portno"
    Write-Host "Open URL : $url"
    Start-Process $url  
    Write-Host "Press [ CTRL + C ] to terminate the HTTP-Server"
    Start-Sleep 4
    & python -m http.server $portno
}

<#
References URL
1. https://www.digitalocean.com/community/tutorials/python-simplehttpserver-http-server#python-simplehttpserver-example
2. https://www.digitalocean.com/community/tutorials/python-simplehttpserver-http-server

#>