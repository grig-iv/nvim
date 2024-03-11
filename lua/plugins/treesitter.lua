return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cmd = 'TSUpdateSync',
    config = function(_, opts)
        require('nvim-treesitter.install').compilers = { 'gcc' }
        require('nvim-treesitter.configs').setup(opts)
    end,
    opts = {
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang)
                local enabled = { 'go' }
                return not vim.tbl_contains(enabled, lang)
            end,
        },
    },
}
