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

$gradientStack = @()

$gradientValues = @(foreach ($in in $this.input) {
    if ($in.pstypenames -eq 'gradient') {
        $gradientStack += $in
        continue
    }
    if ($in -notmatch $this.GradientTypePattern) {
        $in
    }
})

if ($gradientValues) {
    if (-not $gradientTypes) { $gradientTypes = 'radial-gradient'}
    $gradientCss = @(foreach ($gradientType in $gradientTypes) {
        "$gradientType($(
            [Environment]::NewLine + (' ' * 2) + 
            $(
                @(
                    $gradientValues     
                ) -join (', ' + [Environment]::NewLine + (' ' * 2))
            )
        ))"
    }) -join ', '    
}
if ($gradientStack) {
    $deepJoiner = (', ' + [Environment]::NewLine)
    if (-not $gradientValues) {
        $gradientStack -join $deepJoiner
    } else {
        @($gradientStack;$gradientCss) -join $deepJoiner
    }
} elseif ($gradientValues) {
    $gradientCss
}

