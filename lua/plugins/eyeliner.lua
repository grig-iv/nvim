return {
    'jinh0/eyeliner.nvim',
    event = { 'VeryLazy', },
    config = function()
        require('eyeliner').setup { highlight_on_key = false, }
        require('utils').set_highlights {
            EyelinerPrimary = { underline = true, },
            EyelinerSecondary = { underline = true, italic = true, },
        }
    end,
}
