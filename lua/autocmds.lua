local vim = _G.vim

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function() vim.highlight.on_yank() end,
    desc = 'Highlight on yank'
})

vim.api.nvim_create_autocmd('FocusLost', {
    pattern = '*',
    callback = function()
        if vim.fn.bufname('%') ~= '' and vim.api.nvim_buf_get_option(0, 'buftype') == '' then
            vim.api.nvim_command(':wa')
        end
    end,
    desc = 'Highlight on yank'
})
