describe Gradient {
    it 'Generates gradients' {
        $gradient = '#4488ff', '#224488' | Gradient
        "$gradient" | Should -Match '^radial-gradient\([\s\S]+?\)'
    }
    it 'Can stack gradients by joining them with commas' {
        $gradients = @(
            'linear', '217deg', 'rgb(255 0 0 / 80%)', 'transparent 70.71%' | Gradient
            'linear', '127deg', 'rgb(0 255 0 / 80%)', 'transparent 70.71%' | Gradient
            'linear', '336deg', 'rgb(0 0 255 / 80%)', 'transparent 70.71%' | Gradient
        )
        $($gradients | Gradient) | Should -Match 'linear-gradient[\s\S]+?,'
    }
    it 'Can stack gradients' {
        
        $gradients = @(
            gradient repeating-radial  @(
                'circle closest-side at 0.01% 0.01%'
                'color-mix(in srgb, red 50%, transparent) 1rem'
                'color-mix(in srgb, green 50%, transparent) 2rem'
                'color-mix(in srgb, blue 50%, transparent) 3rem'
            )

            gradient repeating-radial  @(
                'circle closest-side at 99.99% 0.01%'
                'color-mix(in srgb, red 50%, transparent) 1rem'
                'color-mix(in srgb, green 50%, transparent) 2rem'
                'color-mix(in srgb, blue 50%, transparent) 3rem'   
            )
        ) 
        
        "$($gradients | gradient)" -match 'repeating-radial-gradient[\s\S]+?repeating-radial-gradient'                     
    }

    it 'Can stack multiple types' {
        $gradients = @(
            gradient repeating-radial  @(
                'circle closest-side at 0.01% 0.01%'
                'color-mix(in srgb, red 33%, transparent) 1rem'
                'color-mix(in srgb, green 33%, transparent) 2rem'
                'color-mix(in srgb, blue 33%, transparent) 3rem'
            )

            gradient repeating-linear @(
                '135deg'
                'color-mix(in srgb, red 33%, transparent) 1rem'
                'color-mix(in srgb, green 33%, transparent) 2rem'
                'color-mix(in srgb, blue 33%, transparent) 3rem'   
            )

            gradient repeating-conic  @(
                'from 180deg at 99.99% 0.01%'
                'color-mix(in srgb, red 33%, transparent) 0% 1%'
                'color-mix(in srgb, green 33%, transparent) 1% 2%'
                'color-mix(in srgb, blue 33%, transparent) 2% 3%'   
            )            
        ) | gradient
                
        "$($gradients)" | Should -Match 'repeating-radial-gradient'
        "$($gradients)" | Should -Match 'repeating-linear-gradient'
        "$($gradients)" | Should -Match 'repeating-conic-gradient'

        $gradients.ToString("html") > ./mutli.html
    }
    it 'Can be clever with ToString' {
        gradient repeating-radial 'red 1rem', 'green 2rem', 'blue 3rem'
        
        $gradient = @(
            gradient repeating-radial  @(
                'circle closest-side at 0.01% 0.01%'
                'color-mix(in srgb, red 50%, transparent) 1rem'
                'color-mix(in srgb, green, transparent) 2rem'
                'color-mix(in srgb, blue, transparent) 3rem'    
            )

            gradient repeating-radial  @(
                'circle closest-side at 99.99% 0.01%'
                'color-mix(in srgb, red 50%, transparent) 1rem'
                'color-mix(in srgb, green 50%, transparent) 2rem'
                'color-mix(in srgb, blue 50%, transparent) 3rem'
            )
        ) | Gradient

        $gradient.ToString("html") > ./test.html 
    }
}
