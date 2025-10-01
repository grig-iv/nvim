vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto-change to project root based on .git directory',
  callback = function()
    local root_markers = { '.git', '.gitignore', 'package.json', 'Cargo.toml', 'go.mod' }
    local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])
    if root_dir then
      vim.cmd('cd ' .. root_dir)
    end
  end,
})
