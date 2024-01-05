return {
    {
        'jaawerth/fennel.vim',
        ft = 'fennel',
        config = function()
            local function set_hl(name, val)
                vim.api.nvim_set_hl(0, name, val)
            end

            set_hl('FennelSpecialForm', { link = 'Keyword' })
            set_hl('FennelKeyword', { link = '@lsp.type.parameter' })
        end
    },
}
