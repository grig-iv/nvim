local function fold_properties(buf)
    -- if properties already folded then return
    if vim.fn.foldclosed(1) ~= -1 then
        return
    end

    local lines = vim.api.nvim_buf_get_lines(buf, 1, -1, false)
    for i, line in ipairs(lines) do
        if line:match('^%-%-%-') then
            vim.api.nvim_command('1,' .. (i + 1) .. 'fold')
            return
        end
    end
end

return {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        workspaces = {
            {
                name = 'extended-mind',
                path = '~/Extended Mind/',
            },
        },
        disable_frontmatter = false,
        note_frontmatter_func = function(note)
            if note.title then
                note:add_alias(note.title)
            end

            local out = { aliases = note.aliases }

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
            vim.fn.jobstart({ 'xdg-open', url })
        end,
        mappings = {
            ['<Enter>'] = {
                action = function()
                    if require('obsidian').util.cursor_on_markdown_link() then
                        return '<cmd>ObsidianFollowLink<CR>'
                    elseif vim.api.nvim_get_current_line():match('%s*%- %[.%]') then
                        return "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>"
                    end
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },
    },
    config = function(_, opts)
        require('obsidian').setup(opts)

        vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
            pattern = '*.md',
            callback = function()
                local buf = vim.api.nvim_get_current_buf()

                vim.keymap.set('n', 'gh', '<cmd>e index.md<cr>', { buffer = buf })
                vim.keymap.set('n', 'gi', '<cmd>e %:p:h/index.md<cr>', { buffer = buf })
                vim.keymap.set('n', 'gw', '<cmd>e work/index.md<cr>', { buffer = buf })

                fold_properties(buf)
            end,
        })
    end,
}
