local vim = _G.vim

local function repl_buf_setup()
    vim.api.nvim_create_autocmd('BufReadPost', {
        pattern = { 'conjure-log-*' },
        callback = function()
            vim.diagnostic.disable(0)
            vim.api.nvim_win_set_option(0, 'wrap', true) -- FIXME
        end,
        desc = 'Conjure Log disable LSP diagnostics'
    })
end

return {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'rust', 'lua' },
    config = function()
        require('conjure.main').main()
        repl_buf_setup()

        vim.g['conjure#log#hud#ignore_low_priority'] = false
    end,
}
