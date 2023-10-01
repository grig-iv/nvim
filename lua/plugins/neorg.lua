return {
    'nvim-neorg/neorg',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
    build = ':Neorg sync-parsers',
    ft = 'norg',
    cmd = 'Neorg',
    config = function(_, opts)
        require('neorg').setup(opts)

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
            pattern = '*.norg',
            callback = function()
                local buf = vim.api.nvim_get_current_buf()
                local win = vim.api.nvim_get_current_win()

                vim.api.nvim_win_set_option(win, 'conceallevel', 2)
                vim.api.nvim_win_set_option(win, 'wrap', true)

                vim.keymap.set('n', 'gi', '<cmd>e index.norg<cr>', { buffer = buf })
                vim.keymap.set('n', 'gh', '<cmd>e home/index.norg<cr>', { buffer = buf })
                vim.keymap.set('n', 'gf', '<cmd>e free-time/index.norg<cr>', { buffer = buf })
                vim.keymap.set('n', 'gw', '<cmd>e work/index.norg<cr>', { buffer = buf })

                vim.keymap.set('n', '<Leader>tc', '<cmd>Neorg toggle-concealer<cr>', { buffer = buf })
            end,
        })
    end,
    opts = {
        load = {
            ['core.defaults'] = {},
            ['core.concealer'] = {
                config = {
                    folds = false,
                    icon_preset = 'diamond',
                },
            },
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        mind = '~/extended-mind',
                        default_workspace = 'mind',
                    },
                },
            },
        },
    },
}
