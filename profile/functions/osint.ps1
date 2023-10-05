function osint() {
    $links = { 
        vehicleDetails : "https://www.rtovehicleinformation.com/";
        reverseImageSearch : "https://tineye.com/"
    }

  
   foreach($key in $links.values)
   {
        Write-Host $key
       Invoke-WebRequest $key

   }

}


osint