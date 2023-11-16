return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'davidmh/cspell.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local null_ls = require('null-ls')
        local cspell = require('cspell')
        local cspell_filetypes = { 'markdown', 'text', 'txt', 'org', 'norg' }
        null_ls.setup({
            sources = {
                cspell.diagnostics.with({ filetypes = cspell_filetypes }),
                cspell.code_actions.with({ filetypes = cspell_filetypes }),
                null_ls.builtins.formatting.fnlfmt
            },
        })
    end,
}
