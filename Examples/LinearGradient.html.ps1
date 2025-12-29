<#
.SYNOPSIS
    Simple Linear Gradient Example    
.DESCRIPTION
    Creates a page with a simple linear gradient
.EXAMPLE
    ./LinearGradient.html.ps1 > ./LinearGradient.html
#>
if ($PSScriptRoot) { Push-Location $PSScriptRoot}

$gradient = Gradient 'linear' '#4488ff', '#224488'

"<html><head><style>"
"body { max-width: 100vw; width: 100vh; background:$gradient}"
"</style></head></html>"

if ($PSScriptRoot) { Pop-Location }
