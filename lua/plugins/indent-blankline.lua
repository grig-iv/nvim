local p = require('color_scheme.palette')

vim.api.nvim_set_hl(0, '_IndentLine', { fg = p.surface0 })

return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        indent = {
            char = '┊',
            highlight = { '_IndentLine' },
        },
        scope = {
            char = '┆',
            highlight = { 'CursorLineNR' },
            show_start = false,
            show_end = false,
        },
    }
}
