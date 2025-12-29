<#
.SYNOPSIS
    Gets the gradient type pattern
.DESCRIPTION
    Gets the regular expression used to identify a gradient type
.EXAMPLE
    Get-Gradiant '#4488ff' ,'#224488' |
       Select-Object -Expand GradientTypePattern
#>
'(?:repeating-)?(?>conic|linear|radial)(?:-gradient)?$'