return {
    'hiphish/rainbow-delimiters.nvim',
    ft = { 'clojure', },
    config = function()
        local rainbow_delimiters = require 'rainbow-delimiters'
        require('rainbow-delimiters.setup').setup {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end,
}
