<#
.SYNOPSIS
    Gets a json gradient
.DESCRIPTION
    Gets the gradient in JavaScript Object Notation (JSON)

    This describes the gradient as a background-image with the css inline in a string.

    This should work seamlessly with
    [Element.animate](https://developer.mozilla.org/en-US/docs/Web/API/Element/animate)
    to allow you to animate a gradient change.
.LINK
    https://developer.mozilla.org/en-US/docs/Web/API/Element/animate
#>
@{
    'background-image' = "$($this.CSS)"
} | ConvertTo-Json 