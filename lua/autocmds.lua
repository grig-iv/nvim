vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto-change to project root based on .git directory',
  group = vim.api.nvim_create_augroup('cd-root', { clear = true }),
  callback = function()
    local root_markers = { '.git', '.gitignore', 'package.json', 'Cargo.toml', 'go.mod' }
    local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])
    if root_dir then
      vim.cmd('cd ' .. root_dir)
    end
  end,
})

local filetype_group = vim.api.nvim_create_augroup('filetype-conf', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = filetype_group,
  pattern = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = filetype_group,
  pattern = { 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 0
  end,
})
