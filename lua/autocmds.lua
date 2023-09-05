local cmd = vim.cmd

-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

cmd([[
  augroup chezmoi
    autocmd!
    autocmd BufWritePost ~/.local/share/chezmoi/* silent ! chezmoi apply --source-path "%"
    autocmd BufWritePost ~/.local/share/chezmoi/dot_contig/nvim/* source % | echom "Reloaded %"
    augroup end
]])
