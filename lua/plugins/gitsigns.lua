return {
    'lewis6991/gitsigns.nvim',
    opts = {
        on_attach = function(buf)
            if vim.fn.count(vim.api.nvim_buf_get_name(buf), '/Extended Mind/') > 0 then
                return false
            end
        end
    },
}
