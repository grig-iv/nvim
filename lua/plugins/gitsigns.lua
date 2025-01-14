return {
    'lewis6991/gitsigns.nvim',
    opts = {
        on_attach = function(buf)
            if vim.fn.count(vim.api.nvim_buf_get_name(buf), '/mind/') > 0 then
                return false
            end

            local gitsigns = require('gitsigns')
            local map = require('utils').map

            local opts = { buffer = buf, }

            map('n', '<leader>hp', gitsigns.preview_hunk, opts)
            map('n', '<leader>hr', gitsigns.reset_hunk, opts)
            map('n', '<leader>ho', gitsigns.show, opts)
        end,
    },
}
