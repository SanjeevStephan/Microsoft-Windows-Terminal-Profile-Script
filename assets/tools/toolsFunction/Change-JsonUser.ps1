function Change-JsonUser() {
    #echo $TOOL.replaceJson_substring 
  Write-Host "[ ? ] Which windows are you using ?" -foregroundColor Cyan
  Write-Host "[ -> ] Windows 11"  -foregroundColor Cyan
  Write-Host "[ -> ] Windows 10"  -foregroundColor Cyan

  $ChooseWindows = Read-Host "Enter (11 or 10) to continue :"
  if($ChooseWindows -eq "11") { & $TOOL.replaceJson_substring_win11 }
  elseif($ChooseWindows -eq "10")  { & $TOOL.replaceJson_substring }
  else { Write-Host "[ x ] Not a Valid Input !" -forgroundColor Red}


}