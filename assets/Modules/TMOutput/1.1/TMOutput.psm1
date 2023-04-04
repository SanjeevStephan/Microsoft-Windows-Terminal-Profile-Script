Function Write-TMOutput {
<#
.SYNOPSIS
    Sends the specified objects to the next command in the pipeline. If the command is the last command in the pipeline, the objects are displayed in the console.

.DESCRIPTION
    Sends the specified objects to the next command in the pipeline. If the command is the last command in the pipeline, the objects are displayed in the console. This function is a wrapper for the Write-Output cmdlet with some additional features. It allows for changing the color of the text (foreground color), and the color behind the text (background color). It also allows for horizontal and vertical padding.

.PARAMETER InputObject
    Specifies the objects to send down the pipeline. Enter a variable that contains the objects, or type a command or expression that gets the objects.

.PARAMETER ForegroundColor
    Specifies the text color. The default is the current foreground color.

.PARAMETER BackgroundColor
    Specifies the background color. The default is the current background color.

.PARAMETER HorizontalPad
    Specifies the amount of space on each side of the included objects. If this value doubled and added to length of the object is greater than the width of the console, it will wrap and likely cause unintended results.

.PARAMETER VerticalPad
    Specifies the number of blank lines above and below the included objects.

.PARAMETER NoEnumerate
    By default, the Write-Output cmdlet always enumerates its output. The NoEnumerate parameter suppresses the default behavior, and prevents Write-Output from enumerating output. The NoEnumerate parameter has no effect on collections that were created by wrapping commands in parentheses, because the parentheses force enumeration. The Write-TMOutput function is a wrapper for Write-Output cmdlet.

.INPUTS
    System.Management.Automation.PSObject
    You can pipe objects to Write-TMOutput.

.OUTPUTS
    System.Management.Automation.PSObject
    Write-TMOutput returns the objects that are submitted as input.

.EXAMPLE
    Write-TMOutput -InputObject 'Testing 1, 2, 3'
    This example writes the text object to the console.

.EXAMPLE
    Write-TMOutput -InputObject 'Testing 1, 2, 3' -ForegroundColor Gray -BackgroundColor Black
    This example writes the text object to the console in a gray font on a black background.

.EXAMPLE
    Write-TMOutput -InputObject 'Testing 1, 2, 3' -ForegroundColor Gray -BackgroundColor Black -HorizontalPad 10 -VerticalPad 2
    This example writes the text object to the console in a gray font on a black background. It will also pad the area around the text object with the background color in both horizontal and vertical directions.

.NOTES
    NAME: Write-TMOutput
    AUTHOR: Tommy Maynard
    LASTEDIT: 05/12/2016
    VERSION 1.1: Removed ISE protection code; PowerShellHostName (currently) requires ConsoleHost only.
    PERSONAL WEBSITE POST: http://tommymaynard.com/quick-learn-write-output-gets-foreground-and-background-colors-and-more-2016
#>
    [CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeline=$true)]
        [psobject[]]$InputObject,

        [Parameter()]
        [ValidateSet('Black','Blue','Cyan','DarkBlue','DarkCyan',
                    'DarkGray','DarkGreen','DarkMagenta','DarkRed','DarkYellow',
                    'Gray','Green','Magenta','Red','White','Yellow')]      
        [string]$ForegroundColor = [System.Console]::ForegroundColor,

        [Parameter()]
        [ValidateSet('Black','Blue','Cyan','DarkBlue','DarkCyan',
                    'DarkGray','DarkGreen','DarkMagenta','DarkRed','DarkYellow',
                    'Gray','Green','Magenta','Red','White','Yellow')]    
        [string]$BackgroundColor = [System.Console]::BackgroundColor,

        [Parameter()]
        [int]$HorizontalPad = 0,

        [Parameter()]
        [int]$VerticalPad = 0,

        [Parameter()]
        [switch]$NoEnumerate
    )

    ##### BEGIN.
    Begin {
        # Collect default foreground and background colors.
        $ResetColorCheck = [bool]([System.Console] | Get-Member -Static -MemberType Method -Name ResetColor)
        If (-Not $ResetColorCheck) {
            $DefaultConsoleForegroundColor = [System.Console]::ForegroundColor
            $DefaultConsoleBackgroundColor = [System.Console]::BackgroundColor
        }
    } # End Begin.

    ##### PROCESS.
    Process {
        Foreach ($Object in $InputObject) {
            # Set foreground and background colors.
            [System.Console]::ForegroundColor = $ForeGroundColor
            [System.Console]::BackgroundColor = $BackGroundColor

            # *Possibly* pad left and right.
            If ($HorizontalPad -gt 0) {
                $Object = $Object.PadLeft($Object.Length + $HorizontalPad)
                $Object = $Object.PadRight($Object.Length + $HorizontalPad)
            }

            # *Possibly* pad top.
            If ($VerticalPad -gt 0) {
                $BlankLine = ' ' * $Object.Length
                1..$VerticalPad | ForEach-Object {
                    Microsoft.PowerShell.Utility\Write-Output -InputObject $BlankLine
                }
            }

            # Write message.
            If ($PSBoundParameters.ContainsKey('NoEnumerate')) {
                Microsoft.PowerShell.Utility\Write-Output -InputObject $Object -NoEnumerate
            } Else {
                Microsoft.PowerShell.Utility\Write-Output -InputObject $Object
            }

            # *Possibly* pad bottom.
            If ($VerticalPad -gt 0) {
                1..$VerticalPad | ForEach-Object {
                    Microsoft.PowerShell.Utility\Write-Output -InputObject $BlankLine
                }
            }
        } # End Foreach
    } # End Process

    ##### END.
    End {
        # Reset Colors with ResetColor Method.
        If ($ResetColorCheck) {
            [System.Console]::ResetColor()
        # Reset Colors *without* ResetColor Method.
        } Else {
            [System.Console]::ForegroundColor = $DefaultConsoleForegroundColor
            [System.Console]::BackgroundColor = $DefaultConsoleBackgroundColor
        }
    } # End End.
} # End Function: Write-TMOutput.

Function Show-TMOutputColor {
<#
.SYNOPSIS
    This function will display the available colors that can be used with the Write-TMOutput function.

.DESCRIPTION
    This function will display the available colors that can be used with the Write-TMOutput function. Colors can be used for either the ForegroundColor or BackgroundColor parameter of Write-TMOutput.

.NOTES
    NAME: Show-TMOutputColor
    AUTHOR: Tommy Maynard
    LASTEDIT: 05/12/2016
    VERSION: 1.0
#>
    If (Get-Command -Name Write-TMOutput) {
        [System.Enum]::GetNames([System.ConsoleColor]) | ForEach-Object {
            $_
            Write-TMOutput -InputObject (' ' * 20) -BackgroundColor $_
        }
    }
} # End Function: Show-TMOutputColor