<#
.SYNOPSIS
    Simple Gradient Example    
.DESCRIPTION
    Creates a page with a simple gradient
.EXAMPLE
    ./Gradient.html.ps1 > ./Gradient.html
#>
if ($PSScriptRoot) { Push-Location $PSScriptRoot}

$gradient = Gradient '#4488ff', '#224488'

"<html><head><style>"
"body { max-width: 100vw; width: 100vh; background:$gradient}"
"</style></head></html>"

if ($PSScriptRoot) { Pop-Location }
