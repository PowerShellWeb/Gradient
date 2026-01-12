<#
.SYNOPSIS
    Stringifies the gradient
.DESCRIPTION
    Gets the gradient as a string.  By default, returns the CSS gradient.

    If any arguments are passed and are properties of this object,
    they will be returned as strings.
.EXAMPLE
    "$(gradient '#4488ff' '#224488')"
.EXAMPLE
    (gradient '#4488ff' '#224488').ToString("html")
#>
param()

if ($args) {
    $anymatching = @(foreach ($arg in $args) {
        $thisArg = $this.$arg
        if ($thisArg) {
            if ($thisArg -is [xml]) {
                $thisArg.Outerxml
            } else {
                $thisArg
            }
        }
    })
    if ($anymatching) {
        return ($anymatching -as 'string[]' -join [Environment]::NewLine)
    }
}

return "$($this.CSS)"