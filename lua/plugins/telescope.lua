local vim = _G.vim
local get_root = require('utils').get_root

-- this will return a function that calls telescope.
-- cwd will default to lazyvim.util.get_root
-- for `files`, git_files or find_files will be chosen depending on .git
local function telescope(builtin, opts)
    local params = { builtin = builtin, opts = opts, }
    return function()
        builtin = params.builtin
        opts = params.opts
        opts = vim.tbl_deep_extend('force', { cwd = get_root(), }, opts or {})
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
                    telescope(
                        params.builtin,
                        vim.tbl_deep_extend('force', {}, params.opts or {}, { cwd = false, default_text = line, })
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
        dependencies = {
            'nvim-lua/plenary.nvim',
            'smartpde/telescope-recent-files',
        },
        cmd = 'Telescope',
        keys = {
            { '<C-f>',      telescope('files'),                                 desc = 'Find files', },
            { '<Leader>/',  '<cmd>Telescope live_grep<cr>',                     desc = 'Find text in files', }, -- in therminal <C-/> interpreting as <C-_>
            { '<C-p>',      '<cmd>Telescope commands<cr>',                      desc = 'Find command', },
            { 'gu',         '<cmd>Telescope lsp_references<cr>',                desc = 'Go to usages', },
            { 'gr',         '<cmd>Telescope lsp_references<cr>',                desc = 'Go to references', },
            { 'gs',         '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Go to symbols', },
            { 'gd',         '<cmd>Telescope lsp_definitions<cr>',               desc = 'Go to definitions', },
            { 'gi',         '<cmd>Telescope lsp_implementations<cr>',           desc = 'Go to implementations', },
            { 'gt',         '<cmd>Telescope lsp_type_definitions<cr>',          desc = 'Go to type', },
            { '<Leader>tt', '<cmd>Telescope<cr>',                               desc = 'Toggle telescope', },
            {
                '<C-t>',
                function()
                    require('telescope').extensions.recent_files.pick({ only_cwd = true, })
                end,
                desc = 'Find files',
            },
        },
        config = function()
            require('telescope').load_extension('recent_files')
        end,
    },
}
