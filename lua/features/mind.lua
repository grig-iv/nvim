local function telescope_default_search()
    require('telescope.builtin').find_files({
        cwd = '~/mind/',
        find_command = { 'rg', '--files', '-g', '!archives/**', '-g', '*.md', '-g', '*.txt', },
    })
end

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*/mind/*',
    callback = function()
        vim.keymap.set('n', '<C-f>', telescope_default_search)
        vim.keymap.set('n', 'gi', '<cmd>e index.md<cr>')
        vim.keymap.set('n', 'gc', '<cmd>e context.md<cr>')
        vim.keymap.set('n', 'gt', '<cmd>e todos.md<cr>')
        vim.keymap.set('n', 'gw', '<cmd>e work/index.md<cr>')
        vim.keymap.set('n', 'gh', '<cmd>e areas/home/index.md<cr>')
        vim.keymap.set('n', 'gs', '<cmd>e areas/sport/index.md<cr>')
        vim.keymap.set('n', 'gp', '<cmd>e areas/photography/index.md<cr>')
    end,
})
