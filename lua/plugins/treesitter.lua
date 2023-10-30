return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync' },
    config = function(_, opts)
        require('nvim-treesitter.install').compilers = { 'gcc' }
        require('nvim-treesitter.configs').setup(opts)
    end,
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = { enable = false },
        indent = { enable = true }
    },
}
