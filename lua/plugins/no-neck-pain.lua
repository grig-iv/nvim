return {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    config = function(_, opts)
        local no_neck_pain = require('no-neck-pain')

        no_neck_pain.setup(opts)

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', }, {
            pattern = { '*.norg', '*.md', },
            callback = function()
                local buf_name = vim.api.nvim_buf_get_name(0)
                if buf_name == '/tmp/scratchpad.md' then
                    return
                end

                vim.schedule(no_neck_pain.enable)
            end,
        })
    end,
}
