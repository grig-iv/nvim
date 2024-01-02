local vim = _G.vim

return {
    'chrisgrieser/nvim-various-textobjs',
    lazy = false,
    opts = { useDefaultKeymaps = true },
    config = function(_, opts)
        require('various-textobjs').setup(opts)

        vim.keymap.set({ 'o', 'x' }, 'as', '<cmd>lua require("various-textobjs").subword("outer")<CR>')
        vim.keymap.set({ 'o', 'x' }, 'is', '<cmd>lua require("various-textobjs").subword("inner")<CR>')
    end,
}
