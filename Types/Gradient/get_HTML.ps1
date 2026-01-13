<#
.SYNOPSIS
    Gets the gradient as HTML
.DESCRIPTION
    Gets the gradient as a `<div>` element with a style attribute.
#>
$styleAttribute = [Web.HttpUtility]::HtmlAttributeEncode(@(
    "width:100%"
    "height:100%"
    "background-image:$($this.CSS)"
) -join ';')
"<div style='$styleAttribute'></div>"