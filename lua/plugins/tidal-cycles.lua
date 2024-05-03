return {
    {
        'tidalcycles/vim-tidal',
        ft = { 'tidal', },
        config = function()
            vim.g.tidal_ghci = 'tidal'

            local map = require('utils').map

            local send = function()
                local pos = vim.fn.getcurpos()
                vim.cmd('TidalSend')
                vim.fn.setpos('.', pos)
            end

            map('', 'h', '<cmd>TidalHush<cr>')
            map('', '<Enter>', send)
        end,
    },
}
