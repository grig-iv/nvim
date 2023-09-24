return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<C-e>', '<cmd>Oil<cr>', desc = 'Oil file explorer' },
    },
    opts = {
        default_file_explorer = true,
        keymaps = {
            ['<Backspace>'] = 'actions.parent',
        },
    },
}
