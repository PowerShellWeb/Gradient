<#
.SYNOPSIS
    Simple Conic Gradient Example    
.DESCRIPTION
    Creates a page with a simple conic gradient
.EXAMPLE
    ./ConicGradient.html.ps1 > ./ConicGradient.html
#>
if ($PSScriptRoot) { Push-Location $PSScriptRoot}

$gradient = Gradient 'conic' '#4488ff', '#224488'

"<html><head><style>"
"body { max-width: 100vw; width: 100vh; background:$gradient}"
"</style></head></html>"

if ($PSScriptRoot) { Pop-Location }
