local p = require('catppuccin.palettes').get_palette('mocha')

-- todo move to separate module
local accent = p.peach
local primary = p.sky

local theme = {
    normal = {
        a = { bg = p.surface0, fg = primary, },
        b = { bg = 'none', fg = p.text, },
        c = { bg = 'none', fg = p.text, },
    },
    insert = {
        a = { bg = p.surface0, fg = p.red, },
        b = { bg = 'none', fg = p.text, },
        c = { bg = 'none', fg = p.text, },
    },
    visual = {
        a = { bg = p.surface0, fg = p.yellow, },
        b = { bg = 'none', fg = p.text, },
        c = { bg = 'none', fg = p.text, },
    },
    command = {
        a = { bg = p.surface0, fg = accent, },
        b = { bg = 'none', fg = p.text, },
        c = { bg = 'none', fg = p.text, },
    },
    inactive = {
        a = { bg = 'none', fg = p.surface2, },
        b = { bg = 'none', fg = p.surface2, },
        c = { bg = 'none', fg = p.surface2, },
    },
}

local mode = {
    'mode',
    color = { gui = 'bold', },
    fmt = function(str) return str:sub(1, 1) end,
}

local filename = {
    'filename',
    path = 1,
    newfile_status = true,
    symbols = {
        modified = '',
        readonly = '󰌾',
        unnamed = '[No Name]',
        newfile = '[New]',
    },
    separator = '',
}

local diagnostics = {
    'diagnostics',
    padding = { left = 0, right = 1, },
}

local diff = {
    'diff',
    cond = function()
        local buf_path = vim.api.nvim_buf_get_name(0)
        -- TODO: remove magich string
        return vim.fn.count(buf_path, '/mind/') == 0
    end,
    source = function()
        ---@diagnostic disable-next-line: undefined-field
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end,
    separator = '',
}

local branch = {
    'branch',
    icon = { '', align = 'right', },
    padding = { left = 0, right = 1, },
}

return {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile', },
    opts = {
        options = {
            section_separators = { left = '', right = '', },
            component_separators = '|',
            theme = theme,
            globalstatus = true,
            always_divide_middle = false,
        },
        sections = {
            lualine_a = { mode, },
            lualine_b = { filename, diagnostics, },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { diff, branch, },
        },
    },
    config = function(_, opts)
        require('lualine').setup(opts)
        vim.opt.showmode = false -- disable "--INSERT--" notification in command line
    end,
}
