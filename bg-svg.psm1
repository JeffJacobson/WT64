using namespace System.Xml.Linq
<#
.EXAMPLE
    Get-WindowSize
    Width Height
    ----- ------
    3824    126
#>
function Get-WindowSize {
    (Get-Host).UI.RawUI.MaxPhysicalWindowSize
}

<#
.SYNOPSIS
    Creates a new SVG background image.
#>
function New-BGSvg {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        $Width = 1920,

        [Parameter()]
        [int]
        $Height = 1004,

        [Parameter()]
        [System.Drawing.Color]
        $FillColor = '#4343ed',

        [Parameter()]
        [System.Drawing.Color]
        $StrokeColor = '#a9a9ff',

        [Parameter()]
        [int]
        $StrokeWidth = 75,

        [Parameter()]
        [int]
        $X = 1,

        [Parameter()]
        [int]
        $Y = 1
    )

    $fillHexColor, $strokeHexColor = $FillColor, $StrokeColor | ForEach-Object {
        [System.Drawing.ColorTranslator]::ToHtml($_)
    }

    
    "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 $Width $Height'>
        <title>C64</title>
        <rect fill='$fillHexColor' stroke='$strokeHexColor' stroke-width='$StrokeWidth' x='$X' y='$Y' width='$Width' height='$Height' />
    </svg>"
}