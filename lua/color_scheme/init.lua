require('utils').set_highlights(function(c)
    return {
        -- Core
        LineNR = { fg = c.surface2, },
        SignColumn = {},
        CursorLineNR = { fg = c.accent, },
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
        Error = { fg = c.critical, },
        Todo = { fg = c.warning, },
        Special = { fg = c.accent, },
        Pmenu = { fg = c.text, bg = 'none', },
        FloatBorder = { fg = c.primary, },
        FloatTitle = { fg = c.primary, bold = true, },
        VertSplit = { fg = c.overlay0, },
        ColorColumn = { bg = c.surface0, },

        -- Syntax
        Keyword = { fg = c.keyword, bold = true, },
        Statement = { link = 'Keyword', },
        Exception = { link = 'Keyword', },
        PreProc = { link = 'Keyword', },
        Comment = { fg = c.comment, italic = true, },
        Function = { fg = c['function'], },
        Type = { fg = c.type, },
        String = { fg = c.string, },
        Constant = { fg = c.constant, },
        Identifier = { fg = c.variable, },
        Property = { fg = c.property, },

        -- Lsp
        DiagnosticError = { fg = c.critical, },
        DiagnosticWarn = { fg = c.warning, },
        DiagnosticInfo = { fg = c.mauve, },
        DiagnosticHint = { fg = c.green, },
        DiagnosticVirtualTextError = { fg = c.critical, italic = true, },
        DiagnosticVirtualTextWarn = { fg = c.warning, italic = true, },
        DiagnosticVirtualTextInfo = { fg = c.mauve, italic = true, },
        DiagnosticVirtualTextHint = { fg = c.green, italic = true, },

        -- Semantic Tokens
        ['@lsp.type.method'] = { link = 'Function', },
        ['@lsp.type.string'] = { link = 'String', },
        ['@lsp.mod.defaultLibrary'] = { link = 'Constant', },
        ['@lsp.typemod.variable.defaultLibrary'] = { link = 'Constant', },
        ['@lsp.type.property'] = { link = 'Property', },
        ['@lsp.type.variable'] = { fg = c.variable, },
        ['@lsp.type.parameter'] = { fg = c.parameter, },

        -- Treesitter
        ['@punctuation'] = { fg = c.text, },
        ['@property'] = { link = 'Property', },
        ['@function.builtin'] = { link = 'Constant', },
        ['@type.builtin'] = { link = 'Constant', },

        -- Syntax

        -- lua
        luaTable = { fg = c.text, },
        luaFunction = { link = 'Keyword', },

        -- nix
        nixIntropolation = {},
        nixIntropolationParam = {},
        nixIntropolationDelimiter = { link = 'Constant', bold = true, },

        -- markdown
        markdownH1 = { fg = c.base, bg = c.accent, bold = true, },
        markdownH2 = { fg = c.accent, bold = true, },
        markdownH3 = { fg = c.accent, },
        markdownH4 = { fg = c.accent, italic = true, },
        markdownH5 = { fg = c.accent, italic = true, },
        markdownH6 = { fg = c.accent, italic = true, },
        markdownCode = { fg = c.primary, bg = c.surface0, },
    }
end)
