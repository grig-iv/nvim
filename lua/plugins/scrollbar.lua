local colors = require('catppuccin.palettes').get_palette('mocha')

return {
    'petertriho/nvim-scrollbar',
    event = { 'BufReadPost', },
    config = true,
    opts = {
        excluded_buftypes = {
            'terminal',
        },
        excluded_filetypes = {
            'prompt',
            'TelescopePrompt',
            'noice',
            'Git',
            'cmp_menu',
            'cmp_docs',
        },
        handlers = {
            cursor = false,
        },
        handle = {
            color = colors.surface2,
        },
    },
}
