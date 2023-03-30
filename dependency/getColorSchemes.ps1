$COLOR = @{

    1 =  @{Color = "Blue";       Schemes = "Dependency"; Desc = "Important Dependency Files"}
    2 =  @{Color = "Green";      Schemes = "Function"  ; Desc = "Represent Functions"}
    3 =  @{Color = "Red";        Schemes = "Error"     ; Desc = "Means Missing | Error | Don't Ignore These Error"}
    4 =  @{Color = "Yellow";     Schemes = "Important" ; Desc = "Pay Attentiong to these Lines"}
    5 =  @{Color = "White";      Schemes = "Casual"    ; Desc="General Log Messages"}
}

$COLOR.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Color"; expression={$_.Value.Color}}, @{label="Schemes"; expression={$_.Value.Schemes}}, @{label="Description"; expression={$_.Value.Desc}} -AutoSize
