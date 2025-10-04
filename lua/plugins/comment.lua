return {
  'numToStr/Comment.nvim',
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
  },
  keys = {
    { '<C-c>', '<Cmd>normal gcc<Cr>' },
    {
      '<C-c>',
      function()
        _G.vim.api.nvim_feedkeys('gc', 'v', false)
      end,
      mode = 'v',
    },
  },
}
