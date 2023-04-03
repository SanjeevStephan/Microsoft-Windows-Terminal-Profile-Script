$COLOR = @{

    1 =  @{Color = "Blue";       Schema = "Dependency"; Desc = "Important Dependency Files"}
    2 =  @{Color = "Green";      Schema = "Function"  ; Desc = "Represent Functions"}
    3 =  @{Color = "Magenta";    Schema = "Debug"     ; Desc = "Debug Messages"}
    4 =  @{Color = "Red";        Schema = "Error"     ; Desc = "Means Missing | Error | Don't Ignore These Error"}
    5 =  @{Color = "White";      Schema = "Casual"    ; Desc = "General Log Messages"}
    6 =  @{Color = "Yellow";     Schema = "Important" ; Desc = "Pay Attentiong to these Lines"}
    7 =  @{Color = "Cyan";       Schema = "Important" ; Desc = "Auto Script to include all the files with (*.ps1) in specific directory"}
}


function List-Color()
{
    $COLOR.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Color"; expression={$_.Value.Color}}, @{label="Schema"; expression={$_.Value.Schema}}, @{label="Description"; expression={$_.Value.Desc}} -AutoSize

    Write-Host "[ COLOR ] Schema { Debug }      : Magenta " -ForegroundColor Magenta
    Write-Host "[ COLOR ] Schema { Dependency } : Blue "    -ForegroundColor Blue
    Write-Host "[ COLOR ] Schema { Casual }     : White "   -ForegroundColor White
    Write-Host "[ COLOR ] Schema { Error }      : Red "     -ForegroundColor Red
    Write-Host "[ COLOR ] Schema { Function }   : Green "   -ForegroundColor Green
    Write-Host "[ COLOR ] Schema { Important }  : Yellow "  -ForegroundColor Yellow
    Write-Host "[ COLOR ] Schema { Important }  : Cyan "    -ForegroundColor Cyan
}

List-Color