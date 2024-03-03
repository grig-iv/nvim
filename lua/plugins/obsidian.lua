local function fold_properties()
    -- if properties already folded then return
    if vim.fn.foldclosed(1) ~= -1 then
        return
    end

    local lines = vim.api.nvim_buf_get_lines(0, 1, -1, false)
    for i, line in ipairs(lines) do
        if line:match('^%-%-%-') then
            vim.api.nvim_command('1,' .. (i + 1) .. 'fold')
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

local function config(_, opts)
    require('obsidian').setup(opts)

    vim.api.nvim_create_autocmd('BufWinEnter', {
        pattern = '*.md',
        callback = function()
            vim.keymap.set('n', '<Enter>', follow_link_or_toggle_checkbox, { buffer = true, expr = true })
            vim.keymap.set('n', 'gr', '<cmd>e index.md<cr>', { buffer = true })
            vim.keymap.set('n', 'gi', '<cmd>e %:p:h/index.md<cr>', { buffer = true })
            vim.keymap.set('n', 'gd', '<cmd>ObsidianToday<cr>', { buffer = true })
            vim.keymap.set('n', 'gw', '<cmd>e work/index.md<cr>', { buffer = true })
            vim.keymap.set('n', 'gh', '<cmd>e home.md<cr>', { buffer = true })

            fold_properties()
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