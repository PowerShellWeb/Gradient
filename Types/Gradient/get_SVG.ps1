<#
.SYNOPSIS
    Gets a SVG gradient
.DESCRIPTION
    Gets the gradient as SVG.

    SVG Gradients are a bit more picky than their CSS counterpart,
    and do not support conic gradients.

#>
$gradientTypeHint = $this.GradientType
if (-not $gradientTypeHint) {
    $gradientTypeHint = 'radial'
}
if ($gradientTypeHint) {
    $gradientTypeHint = $gradientTypeHint -replace '-gradient', 'Gradient'
    $gradientTypeHint = $gradientTypeHint.Substring(0,1).ToLower() + $gradientTypeHint.Substring(1)
}
# AFAIK, SVG does not support conic gradients.
if ($gradientTypeHint -match 'conic') { return }
$gradientValues = @(foreach ($in in $this.input) {
    if ($in -match '\#[a-f0-9]{6}') {
        $matches.0
    }
})
if (-not $gradientValues) { return }
if ($gradientValues.Count -eq 1) {
    $gradientValues = @($gradientValues) * 2
}

# Now we have at least two colors we want to be a gradient
# We need to make sure the offset starts at 0% an ends at 100%
# and so we actually need to divide by one less than our fill color, so we end at 100%.
$offsetStep = 1 / ($gradientValues.Count - 1)

@(
    # Construct our gradient element.
    "<${gradientTypeHint}$(
        # propagate our attributes                
        " id='${gradientTypeHint}-$($gradientValues -replace '#' -join '-')'"                
    )>"
    @(
        # and put in our stop colors
        for ($StopNumber = 0; $StopNumber -lt $gradientValues.Count; $StopNumber++) {
            "<stop offset='$($offsetStep * $StopNumber * 100)%' stop-color='$($gradientValues[$StopNumber])' />"
        }
    )
    "</${gradientTypeHint}>"
) -join [Environment]::NewLine