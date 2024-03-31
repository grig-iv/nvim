return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'davidmh/cspell.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.jq,
            },
        })
    end,
}
