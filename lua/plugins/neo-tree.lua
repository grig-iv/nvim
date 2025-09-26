return {
  'nvim-neo-tree/neo-tree.nvim',
  version = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { '<C-e>', ':Neotree reveal position=float<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    window = {
      mappings = {
        ['<left>'] = 'close',
        ['<right>'] = 'open',
        ['o'] = 'open',
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['.'] = 'toggle_hidden',
        },
      },
    },
  },
}
