return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    event = { 'LspAttach', },
    keys = {
        { '<Leader>td', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle diagnostics', },
    },
    opts = {
        focus = true,
        auto_close = true,
    },
}
