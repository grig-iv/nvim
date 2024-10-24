return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    event = { 'LspAttach', },
    keys = {
        { 'gt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)', },
    },
    opts = {
        focus = true,
        auto_close = true,
    },
}
