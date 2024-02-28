-- bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- open plugins github pages
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*/nvim/lua/plugins/*.lua',
    callback = function()
        vim.keymap.set(
            'n',
            'gg',
            function()
                local line = vim.api.nvim_get_current_line()
                local github_uri = line:match("'.*'")
                if github_uri ~= nil then
                    local utils = require('utils')
                    utils.open_link('https://github.com/' .. github_uri:sub(2, -2))
                end
            end,
            { buffer = true }
        )
    end,
})

-- plugins
require('lazy').setup('plugins', {
    defaults = { cond = not vim.g.vscode },
    change_detection = {
        notify = false, -- print a notification when changes are found
    },
    performance = {
        reset_packpath = false,
    },
})
