return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
        flavour = 'mocha',
        integrations = {
            alpha = true,
            cmp = true,
            indent_blankline = { enabled = true },
            lsp_trouble = true,
            mason = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { 'undercurl' },
                    hints = { 'undercurl' },
                    warnings = { 'undercurl' },
                    information = { 'undercurl' },
                },
            },
            noice = true,
            notify = true,
            telescope = true,
            treesitter = true,
        },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd([[colorscheme catppuccin]])
    end,
}
