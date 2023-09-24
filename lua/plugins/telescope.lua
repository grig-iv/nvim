local get_root = require('utils').get_root

-- this will return a function that calls telescope.
-- cwd will default to lazyvim.util.get_root
-- for `files`, git_files or find_files will be chosen depending on .git
local function telescope(builtin, opts)
    local params = { builtin = builtin, opts = opts }
    return function()
        builtin = params.builtin
        opts = params.opts
        opts = vim.tbl_deep_extend('force', { cwd = get_root() }, opts or {})
        if builtin == 'files' then
            if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. '/.git') then
                opts.show_untracked = true
                builtin = 'git_files'
            else
                builtin = 'find_files'
            end
        end
        if opts.cwd and opts.cwd ~= vim.loop.cwd() then
            opts.attach_mappings = function(_, map)
                map('i', '<a-c>', function()
                    local action_state = require('telescope.actions.state')
                    local line = action_state.get_current_line()
                    M.telescope(
                        params.builtin,
                        vim.tbl_deep_extend('force', {}, params.opts or {}, { cwd = false, default_text = line })
                    )()
                end)
                return true
            end
        end
        require('telescope.builtin')[builtin](opts)
    end
end

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = 'Telescope',
        keys = {
            { '<C-f>', telescope('files'), desc = 'Find Files (root + git)' },
            { 't', '<cmd>Telescope<cr>', desc = 'Telescope' },
        },
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'kkharji/sqlite.lua' },
        enabled = false,
        config = function()
            require('telescope').load_extension('frecency')
        end,
        keys = {
            { '<C-s>', '<cmd>Telescope frecency<cr>', desc = 'Switch to resent files' },
        },
    },
}
