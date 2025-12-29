describe Gradient {
    it 'Generates gradients' {
        $gradient = '#4488ff', '#224488' | Gradient
        "$gradient" | Should -Match '^radial-gradient\(.+?\)'
    }
    it 'Can stack gradients by joining them with commas' {
        $gradients = @(
            'linear', '217deg', 'rgb(255 0 0 / 80%)', 'transparent 70.71%' | Gradient
            'linear', '127deg', 'rgb(0 255 0 / 80%)', 'transparent 70.71%' | Gradient
            'linear', '336deg', 'rgb(0 0 255 / 80%)', 'transparent 70.71%' | Gradient
        )
        
        $($gradients -join ',') | Should -Match 'linear-gradient.+?,'
        
    }
    
}
