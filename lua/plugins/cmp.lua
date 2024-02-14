return {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',     -- Autocompletion with LSPs
        'hrsh7th/cmp-buffer',       -- Autocompletion from words in buffer
        'hrsh7th/cmp-path',         -- Autocompletion from files
        'hrsh7th/cmp-cmdline',      -- Autocompletion for nvim commands

        'PaterJason/cmp-conjure',   -- conjure
        'L3MON4D3/LuaSnip',         -- lua snip
        'saadparwaiz1/cmp_luasnip', -- lua snip
        'onsails/lspkind.nvim',     -- vscode-like pictograms
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Down>'] = cmp.mapping.select_next_item(),
                ['<Up>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer',  keyword_length = 4 },
                {
                    name = 'buffer',
                    option = {
                        sources = {
                            { name = 'conjure' },
                        },
                    },
                },
                { name = 'path' },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format()
            }
        })
    end,
}
