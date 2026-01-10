<#
.SYNOPSIS
    Gets Gradient CSS
.DESCRIPTION
    Gets the Gradient as CSS.
.EXAMPLE
    gradient '#4488ff', '#224488' |
        Select-Object -Expand CSS
#>
param()
# Get our gradient type
$gradientTypes = $this.GradientTypes
$gradientValues = @(foreach ($in in $this.input) {
    if ($in -notmatch $this.GradientTypePattern) {
        $in
    }
})

if (-not $gradientTypes) { $gradientTypes = 'radial-gradient'}        
@(foreach ($gradientType in $gradientTypes) {
    "$gradientType($(
        @(
            $gradientValues     
        ) -join (', ' + [Environment]::NewLine + (' ' * 2))
    ))"
}) -join ', '