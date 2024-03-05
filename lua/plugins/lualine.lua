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
            lualine_y = {
                {
                    'diff',
                    cond = function()
                        local buf_path = vim.api.nvim_buf_get_name(0)
                        -- TODO: remove magich string
                        return vim.fn.count(buf_path, '/Extended Mind/') == 0
                    end
                }
            },
            lualine_z = { 'location' }
        }
    },
    config = function(_, opts)
        require('lualine').setup(opts)
        vim.opt.showmode = false -- disable "--INSERT--" notification in command line
    end,
}
