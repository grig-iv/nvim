return {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('neorg').setup({
            load = {
                ['core.defaults'] = {}, -- Loads default behaviour
                ['core.concealer'] = {
                    config = {
                        folds = false,
                        icon_preset = 'diamond',
                    },
                }, -- Adds pretty icons to your documents
                ['core.dirman'] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            mind = '~/extended-mind',
                            default_workspace = 'mind',
                        },
                    },
                },
            },
        })

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
            pattern = '*.norg',
            callback = function()
                vim.opt.conceallevel = 2
                vim.opt.wrap = ture
            end,
        })
    end,
}
