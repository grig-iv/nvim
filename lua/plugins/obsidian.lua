local function fold_properties()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
        local is_separator = line:match('^%-%-%-')
        if i == 1 and not is_separator then
            return
        elseif i > 1 and is_separator then
            vim.api.nvim_command('1,' .. i .. 'fold')
            return
        end
    end
end

local function set_cursor_on_title()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
        if line:match('.*# ') then
            vim.api.nvim_win_set_cursor(0, { i, 0 })
            return
        end
    end
end

local function follow_link_or_toggle_checkbox()
    if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>ObsidianFollowLink<CR>'
    elseif vim.api.nvim_get_current_line():match('%s*%- %[.%]') then
        return "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>"
    end
end

local function on_buffer_first_enter()
    vim.keymap.set('n', '<Enter>', follow_link_or_toggle_checkbox, { buffer = true, expr = true })
    vim.keymap.set('n', 'gr', '<cmd>e index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gi', '<cmd>e %:p:h/index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gd', '<cmd>ObsidianToday<cr>', { buffer = true })
    vim.keymap.set('n', 'gw', '<cmd>e work/index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gh', '<cmd>e home.md<cr>', { buffer = true })

    fold_properties()
    set_cursor_on_title()
end

local function config(_, opts)
    require('obsidian').setup(opts)

    local opened_buffers = {}
    vim.api.nvim_create_autocmd('BufWinEnter', {
        pattern = '*.md',
        callback = function(ev)
            if not vim.tbl_contains(opened_buffers, ev.buf) then
                table.insert(opened_buffers, ev.buf)
                on_buffer_first_enter()
            end
        end,
    })
end

return {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = config,
    opts = {
        workspaces = {
            {
                name = 'extended-mind',
                path = '~/Extended Mind/',
            },
        },
        ui = {
            checkboxes = {
                [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
                ['x'] = { char = '', hl_group = 'ObsidianDone' },
                ['_'] = { char = '󰩹', hl_group = 'ObsidianTodo' },
                ['='] = { char = '󰏤', hl_group = 'ObsidianTodo' },
                ['~'] = { char = '󰋖', hl_group = 'ObsidianTodo' },
            },
        },
        daily_notes = {
            folder = 'journal/' .. os.date('%Y/%m-%B/'),
            date_format = '%d-%A',
            template = 'daily.md',
        },
        templates = {
            subdir = '.templates',
            substitutions = {
                daily_title = function() return os.date('%A, %B %-d, %Y') end,
                creation_time = function() return os.date('%Y-%m-%d') end
            }
        },
        disable_frontmatter = false,
        note_frontmatter_func = function(note)
            if note.title then
                note:add_alias(note.title)
            end

            local out = { aliases = note.aliases }

            if #note.tags ~= 0 then
                out.tags = note.tags
            end

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,
        note_id_func = function(title)
            return tostring(title)
        end,
        follow_url_func = function(url)
            require('utils').open_link(url)
        end,
    },
}
