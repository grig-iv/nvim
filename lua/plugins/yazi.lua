return {
    'DreamMaoMao/yazi.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<C-e>', '<cmd>Yazi<CR>', desc = 'Toggle Yazi' },
    },
}
