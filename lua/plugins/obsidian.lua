local function is_journal_buf()
    local path = vim.api.nvim_buf_get_name(0)
    return path:match('/journal/%d%d%d%d/')
end

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

local function openSxiv(imagePath)
    local cmd = 'sxiv'

    local handle
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)

    local function onExit(code, signal)
        stdout:close()
        stderr:close()
        handle:close()

        if code ~= 0 then
            print('sxiv exited with code', code, 'and signal', signal)
        end
    end

    -- Spawn sxiv with the image path
    handle = vim.loop.spawn(cmd, {
        args = { imagePath },
        stdio = { nil, stdout, stderr },
    }, onExit)
end

local function follow_link_or_toggle_checkbox()
    local link_path = require('obsidian').util.parse_cursor_link()
    if link_path ~= nil and (vim.endswith(link_path, '.png') or vim.endswith(link_path, '.jpg')) then
        openSxiv(vim.fn.expand('%:p:h/') .. '/' .. link_path)
        return nil
    elseif link_path then
        return '<cmd>ObsidianFollowLink<CR>'
    elseif vim.api.nvim_get_current_line():match('%s*%- %[.%]') then
        return "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>"
    end
end

local function telescope_default_search()
    require('telescope.builtin').find_files({
        cwd = '~/Extended Mind/',
        find_command = { 'rg', '--files', '-g', '!archives/**', '-g', '*.md', '-g', '*.txt', },
    })
end

local function on_buffer_first_enter()
    vim.keymap.set('n', '<Enter>', follow_link_or_toggle_checkbox, { buffer = true, expr = true })
    vim.keymap.set('n', '<C-f>', telescope_default_search, { buffer = true })
    vim.keymap.set('n', 'gr', '<cmd>cd ~/Extended Mind/<cr><cmd>e index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gw', '<cmd>cd ~/Extended Mind/<cr><cmd>e work/index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gh', '<cmd>cd ~/Extended Mind/<cr><cmd>e areas/home/index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gs', '<cmd>cd ~/Extended Mind/<cr><cmd>e areas/sport/index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gi', '<cmd>e %:p:h/index.md<cr>', { buffer = true })
    vim.keymap.set('n', 'gd', '<cmd>ObsidianToday<cr>', { buffer = true })
    vim.keymap.set('n', 'gy', '<cmd>ObsidianToday -1<cr>', { buffer = true })

    vim.fn.matchadd('Conceal', '^# ', 10, -1)
    vim.fn.matchadd('Conceal', '^## ', 10, -1)
    vim.fn.matchadd('Conceal', '^### ', 10, -1)
    vim.fn.matchadd('Conceal', '^#### ', 10, -1)
    vim.fn.matchadd('Conceal', '^##### ', 10, -1)
    vim.fn.matchadd('Conceal', '^###### ', 10, -1)
    vim.fn.matchadd('Conceal', ' `', 10, -1, { conceal = ' ' })
    vim.fn.matchadd('Conceal', '` ', 10, -1, { conceal = ' ' })

    if not is_journal_buf() then
        fold_properties()
    end
    set_cursor_on_title()
end

local function config(_, opts)
    require('obsidian').setup(opts)

    local opened_buffers = {}
    vim.api.nvim_create_autocmd('BufWinEnter', {
        pattern = '*/Extended Mind/*',
        callback = function(ev)
            if not vim.tbl_contains(opened_buffers, ev.buf) then
                table.insert(opened_buffers, ev.buf)
                on_buffer_first_enter()
            end
        end,
    })

    require('utils').set_highlights(function(c)
        return {
            ObsidianTodo = { fg = c.primary },
            ObsidianDone = { fg = c.accent },
            ObsidianRefText = { fg = c.constant, underline = true },
            ObsidianHighlightText = { bg = c.yellow, fg = c.surface1, italic = true },
        }
    end)
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
        -- image_name_func = function()
        --     return os.date('%d-%A-')
        -- end,
        attachments = {
            img_folder = '',
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
