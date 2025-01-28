local vim = _G.vim

-- higlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'Visual', }
    end,
    desc = 'Highlight on yank',
})

-- save on focus lost
vim.api.nvim_create_autocmd('FocusLost', {
    pattern = '*',
    callback = function()
        if vim.fn.bufname('%') ~= '' and vim.api.nvim_buf_get_option(0, 'buftype') == '' then
            vim.api.nvim_command(':silent wa')
        end
    end,
    desc = 'Highlight on yank',
})

-- clear jump list on start
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    once = true,
    callback = function()
        vim.cmd('tabdo windo clearjumps')
    end,
})

-- insert enter/exit shell hook
local utils = require('utils')
if not utils.is_wsl_host then
    vim.api.nvim_create_autocmd('InsertEnter', {
        pattern = '*',
        callback = function()
            os.execute('on-insert-enter')
        end,
    })

    vim.api.nvim_create_autocmd('InsertLeave', {
        pattern = '*',
        callback = function()
            os.execute('on-insert-exit')
        end,
    })
end
