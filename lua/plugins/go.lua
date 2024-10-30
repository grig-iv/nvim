return {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
        'ray-x/guihua.lua',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
    },
    event = { 'CmdlineEnter', },
    ft = { 'go', 'gomod', },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
        require('go').setup()

        vim.api.nvim_create_autocmd('BufWinEnter', {
            pattern = '*.go',
            group = vim.api.nvim_create_augroup('goBufSetup', {}),
            callback = function(buf)
                vim.keymap.set('n', 'gm', '<cmd>e main.go<cr>', { buffer = true, })
            end,
        })
    end,
}
