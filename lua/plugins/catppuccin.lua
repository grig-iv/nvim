return {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    opts = {
        flavour = 'mocha',
        term_colors = true,
        transparent_background = true,
        custom_highlights = function(colors)
            return {
                Cursor = { fg = colors.teal, },
                CursorLineNR = { fg = colors.teal, },
                Keyword = { fg = '#FF6188', bold = true, },
                Statement = { fg = colors.red, bold = true, },
                Type = { fg = colors.sky, },
                Structure = { fg = colors.sky, },
                Conditional = { fg = colors.red, bold = true, },
                String = { fg = colors.yellow, },
                Function = { fg = '#A9DC76', },
                Constant = { fg = colors.blue, },
            }
        end,
        integrations = {
            alpha = true,
            cmp = true,
            indent_blankline = { enabled = true, },
            lsp_trouble = true,
            mason = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { 'undercurl', },
                    hints = { 'undercurl', },
                    warnings = { 'undercurl', },
                    information = { 'undercurl', },
                },
            },
            noice = true,
            notify = true,
            telescope = true,
            treesitter = true,
        },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd([[colorscheme catppuccin]])

        local colors = require('catppuccin.palettes').get_palette(opts.flavour)

        vim.api.nvim_set_hl(0, 'Property', { fg = colors.peach, })
        vim.api.nvim_set_hl(0, 'Operator', { fg = colors.red, })

        vim.api.nvim_set_hl(0, '@lsp.type.keyword', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@lsp.type.modifier', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@lsp.type.function', { link = 'Function', })
        vim.api.nvim_set_hl(0, '@lsp.type.method', { link = 'Function', })
        vim.api.nvim_set_hl(0, '@lsp.type.parameter', { fg = colors.peach, })
        vim.api.nvim_set_hl(0, '@lsp.type.string', { link = 'String', })
        vim.api.nvim_set_hl(0, '@lsp.type.enum', { fg = colors.blue, })
        vim.api.nvim_set_hl(0, '@lsp.type.class', { fg = colors.sky, })
        vim.api.nvim_set_hl(0, '@lsp.type.struct', { link = 'Structure', })
        vim.api.nvim_set_hl(0, '@lsp.type.interface', { fg = colors.teal, })
        vim.api.nvim_set_hl(0, '@lsp.type.number', { fg = colors.lavender, })
        vim.api.nvim_set_hl(0, '@lsp.type.operator', { fg = colors.maroon, })
        vim.api.nvim_set_hl(0, '@lsp.type.property', { link = 'Property', })
        vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg = colors.text, })
        vim.api.nvim_set_hl(0, '@lsp.mod.global', { link = 'Constant', })
        vim.api.nvim_set_hl(0, '@lsp.mod.defaultLibrary', { link = 'Constant', })

        vim.api.nvim_set_hl(0, '@keyword', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@keyword.return', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@keyword.function', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@keyword.operator', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@type.builtin', { link = 'Keyword', })
        vim.api.nvim_set_hl(0, '@variable.builtin', { link = 'Constant', })
        vim.api.nvim_set_hl(0, '@function.builtin', { link = 'Function', })
        vim.api.nvim_set_hl(0, '@property.go', { link = 'Property', })
        vim.api.nvim_set_hl(0, '@field.go', { link = 'Property', })
    end,
}
