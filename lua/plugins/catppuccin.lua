local function set_highlights(c)
    local accent = c.peach
    local critical = c.red
    local warning = c.yellow
    local primary = c.sky

    return {
        -- Core
        Normal = {},
        LineNR = { fg = c.surface2, },
        StatusLine = { link = 'Normal', },
        SignColumn = {},
        CursorLineNR = { fg = accent, },
        CursorLine = { bg = c.surface0, },
        EndOfBuffer = { fg = c.base, },
        DiffAdd = { fg = c.green, },
        DiffChange = { fg = c.yellow, },
        DiffDelete = { fg = c.red, },
        ErrorMsg = { fg = c.red, },
        WarningMsg = { fg = c.yellow, },
        Underlined = { underline = true, },
        Visual = { bg = c.surface1, italic = true, },
        Conceal = {},
        Title = { link = 'Keyword', },
        Folded = { link = 'Comment', },
        Error = { fg = critical, },
        Todo = { fg = warning, },
        Special = { fg = accent, },
        Pmenu = { fg = c.text, bg = 'none', },
        FloatBorder = { fg = primary, },
        FloatTitle = { fg = primary, bold = true, },
        VertSplit = { fg = c.overlay0, },
        ColorColumn = { bg = c.surface0, },

        -- Syntax
        Keyword = { fg = c.red, bold = true, },
        Statement = { link = 'Keyword', },
        Exception = { link = 'Keyword', },
        PreProc = { link = 'Keyword', },
        Comment = { fg = c.surface2, italic = true, },
        Function = { fg = c.green, },
        Type = { fg = c.sapphire, },
        String = { fg = c.yellow, },
        Constant = { fg = c.mauve, },
        Identifier = { fg = c.text, },
        Property = { fg = c.blue, },

        -- Lsp
        DiagnosticError = { fg = critical, },
        DiagnosticWarn = { fg = warning, },
        DiagnosticInfo = { fg = c.mauve, },
        DiagnosticHint = { fg = c.green, },
        DiagnosticVirtualTextError = { fg = critical, italic = true, },
        DiagnosticVirtualTextWarn = { fg = warning, italic = true, },
        DiagnosticVirtualTextInfo = { fg = c.mauve, italic = true, },
        DiagnosticVirtualTextHint = { fg = c.green, italic = true, },

        -- Semantic Tokens
        ['@lsp.type.method'] = { link = 'Function', },
        ['@lsp.type.string'] = { link = 'String', },
        ['@lsp.mod.defaultLibrary'] = { link = 'Constant', },
        ['@lsp.mod.readonly'] = { link = 'Constant', },
        ['@lsp.typemod.variable.defaultLibrary'] = { link = 'Constant', },
        ['@lsp.type.property'] = { link = 'Property', },
        ['@lsp.type.variable'] = { fg = c.text, },
        ['@lsp.type.parameter'] = { fg = c.peach, },

        -- Treesitter
        ['@punctuation'] = { fg = c.text, },
        ['@property'] = { link = 'Property', },
        ['@function.builtin'] = { link = 'Constant', },
        ['@type.builtin'] = { link = 'Constant', },

        -- Syntax

        -- typescript
        typescriptBraces = { fg = c.text, },

        -- lua
        luaTable = { fg = c.text, },
        luaFunction = { link = 'Keyword', },

        -- nix
        nixFunctionCall = { link = 'Function', },
        nixIntropolation = {},
        nixIntropolationParam = {},
        nixIntropolationDelimiter = { link = 'Constant', bold = true, },

        -- markdown
        markdownH1 = { fg = c.base, bg = accent, bold = true, },
        markdownH2 = { fg = accent, bold = true, },
        markdownH3 = { fg = accent, },
        markdownH4 = { fg = accent, italic = true, },
        markdownH5 = { fg = accent, italic = true, },
        markdownH6 = { fg = accent, italic = true, },
        markdownCode = { fg = primary, bg = c.surface0, },
    }
end

return {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    priority = 1000,
    opts = {
        flavour = 'mocha',
        term_colors = true,
        transparent_background = true,
        custom_highlights = set_highlights,
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
        vim.cmd.colorscheme 'catppuccin'
    end,
}
