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
