return {
    'mikavilpas/yazi.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = 'VeryLazy',
    keys = {
        { '<C-e>', function() require('yazi').yazi() end, desc = 'Open the file manager', },
    },
    opts = {
        yazi_floating_window_border = 'none',
    },
}
