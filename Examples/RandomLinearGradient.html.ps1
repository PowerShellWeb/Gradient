<#
.SYNOPSIS
    Random Linear Gradient Example    
.DESCRIPTION
    Creates a page with a random gradient
.EXAMPLE
    ./RandomLinearGradient.html.ps1 > ./RandomLinearGradient.html
#>
param([byte]$GradientColorMax = 4)
if ($PSScriptRoot) { Push-Location $PSScriptRoot}

# Make a random 2-N color gradient
$gradient = @(
    'linear'
    foreach ($n in 1..(Get-Random -Min 2 -Max $GradientColorMax)) {
        "#{0:x6}" -f (Get-Random -Max 0xffffff)
    }
) | Gradient

"<html><head><style>"
"body { max-width: 100vw; width: 100vh; background:$gradient}"
"</style></head></html>"

if ($PSScriptRoot) { Pop-Location }
