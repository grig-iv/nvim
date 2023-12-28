return {
    'simrat39/rust-tools.nvim',
    ft = "rust",
    dependencies = 'neovim/nvim-lspconfig',
    opts = {
        tools = {
            inlay_hints = {
                auto = false,
            },
        },
        server = {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    },
}
