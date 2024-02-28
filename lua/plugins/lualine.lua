local function repl_component()
    return 'REPL'
end

local function on_click(...)
    print('under development')
end

-- TODO syncthing status integration
return {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        options = {
            section_separators = { left = '', right = '' },
            component_separators = '|',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { {
                'filename',
                path = 1,
                newfile_status = true,
                symbols = {
                    modified = '',
                    readonly = '󰌾',
                    unnamed = '[No Name]',
                    newfile = '[New]',
                }
            } },
            lualine_x = { 'diagnostics' },
            lualine_y = { 'diff' },
            lualine_z = { 'location' }
        }
    },
    config = function(_, opts)
        require('lualine').setup(opts)
        vim.opt.showmode = false -- disable "--INSERT--" notification in command line
    end,
}
