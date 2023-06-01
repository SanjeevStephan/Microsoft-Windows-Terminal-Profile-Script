if (Test-Path $su) 
{      Write-Host "|    |          |        |    ├ Found ] $su_name at $su" -ForegroundColor Green  }
else { Write-Host "|    |          |        ├ MISSING ] $su_name at $su" -ForegroundColor Green }

