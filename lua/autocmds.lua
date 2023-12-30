local vim = _G.vim

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function() vim.highlight.on_yank() end,
    desc = "Highlight on yank"
})

vim.api.nvim_create_autocmd("FocusLost", {
    pattern = "*",
    callback = function() vim.api.nvim_command(":wa") end,
    desc = "Highlight on yank"
})
