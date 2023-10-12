return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync' },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            'norg',
            'bash',
            'json',
            'yaml',
            'markdown',
            'markdown_inline',
            'lua',
        },
    },
}
