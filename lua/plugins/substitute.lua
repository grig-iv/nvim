return {
    {
        'gbprod/substitute.nvim',
        config = true,
        keys = {
            { 'r', "<cmd>lua require('substitute').operator()<cr>", desc = 'Replace text object' },
            { 'rr', "<cmd>lua require('substitute').line()<cr>", desc = 'Replace line' },
            { 'R', "<cmd>lua require('substitute').eol()<cr>", desc = 'Replace to the end of line' },
            { 'r', "<cmd>lua require('substitute').visual()<cr>", mode = 'x', desc = 'Replace selection' },
        },
    },
}
