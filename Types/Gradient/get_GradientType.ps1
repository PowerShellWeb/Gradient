<#
.SYNOPSIS
    Gets the Gradient Type
.DESCRIPTION
    Gets the Gradient Types found in the Gradient's input.

    If no type is found, radial-gradient is the default.
#>

$foundTypes = @(foreach ($in in $this.input) {
    if ($in -match $this.GradientTypePattern) {
        $in -replace '(?:-gradient)?$', '-gradient'
    }
})

if (-not $foundTypes) {
    $foundTypes = @('radial-gradient')    
}
return $foundTypes

