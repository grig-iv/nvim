return {
    'gbprod/substitute.nvim',
    keys = {
        { 'r',  "<cmd>lua require('substitute').operator()<cr>",      desc = 'Replace text object' },
        { 'rl', "<cmd>lua require('substitute').line()<cr>",          desc = 'Replace line' },
        { 'R',  "<cmd>lua require('substitute').operator()<cr><end>", desc = 'Replace to the end of line' },
        { 'r',  "<cmd>lua require('substitute').visual()<cr>",        mode = 'x',                         desc = 'Replace selection' },
    },
    config = function()
        require('substitute').setup()
        require('utils').set_highlights {
            SubstituteSubstituted = { link = 'Visual' }
        }
    end,
}
