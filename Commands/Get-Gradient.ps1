function Get-Gradient {
    <#
    .SYNOPSIS
        Gets a Gradient
    .DESCRIPTION
        Gets a Gradient between one or more inputs.
        
        A gradient can be rendered as CSS or SVG.

        If a gradient type is not specified, it will be a radial gradient.

        Conic gradients are not supported in SVG. 
    .NOTES
        Get-Gradient is implemented a function with no dependencies.

        To use it in your projects, you can simply include it inline.
    .EXAMPLE
        Gradient '#4488ff', '#224488' # We can easily generate gradients
    .EXAMPLE
        "$(Gradient '#4488ff', '#224488')" # Stringifying a gradient returns the CSS
    .EXAMPLE
        # Make a a page with just a gradient
        @(
            $gradient = Gradient '#4488ff', '#224488'
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh; background:$gradient}"
            "</style></head></html>"
        ) > ./gradient.html
    .EXAMPLE
        # Make a a page with a random gradient
        
        $gradient = @(
            # Make 2 to 4 random colors
            foreach ($n in 1..(Get-Random -Min 2 -Max 4)) {
                "#{0:x6}" -f (Get-Random -Max 0xffffff)
            }
        ) | gradient
        # Generate a minimal page with the gradient
        @(
            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh; background:$gradient}"
            "</style></head></html>"
        ) > ./randomgradient.html
    .EXAMPLE
        # Make a page with a random conic gradient
        
        $gradient = @(
            "conic"
            # Make 2 to 4 random colors
            foreach ($n in 1..(Get-Random -Min 2 -Max 4)) {
                "#{0:x6}" -f (Get-Random -Max 0xffffff)
            }
        ) | gradient
        # Generate a minimal page with the gradient
        @(
            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh; background:$gradient}"
            "</style></head></html>"
        ) > ./randomconicgradient.html
    .EXAMPLE    
        # Make a page with a random linear gradient
        
        $gradient = @(
            "linear"
            # Make 2 to 4 random colors
            foreach ($n in 1..(Get-Random -Min 2 -Max 4)) {
                "#{0:x6}" -f (Get-Random -Max 0xffffff)
            }
        ) | gradient
        # Generate a minimal page with the gradient
        @(
            
            "<html><head><style>"
            "body { max-width: 100vw; width: 100vh; background:$gradient}"
            "</style></head></html>"
        ) > ./randomlineargradient.html
    .EXAMPLE
        '#4488ff', '#224488' | Gradient # We can pipe into gradient
    
    #>
    [Alias('Gradient')]
    param()

    # All this function does is gather all of the input and arguments
    $allIn = @($input) + @($args)

    # and create a custom object.
    [PSCustomObject]@{
        PSTypeName = 'Gradient'
        Input = $allIn
    }

    # This allows us to accept any input, and modify the gradient after it has been created.

    # The implementation of the Gradient logic is in PowerShell extended types.
}
