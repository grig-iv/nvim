local mode = {
  'mode',
  color = { gui = 'bold' },
  fmt = function(str)
    return str:sub(1, 1)
  end,
}

local filename = {
  'filename',
  path = 1,
  newfile_status = true,
  symbols = {
    modified = '',
    readonly = '󰌾',
    unnamed = '[No Name]',
    newfile = '[New]',
  },
  separator = '',
}

local diagnostics = {
  'diagnostics',
  padding = { left = 0, right = 1 },
}

local diff = {
  'diff',
  cond = function()
    local buf_path = vim.api.nvim_buf_get_name(0)
    -- TODO: remove magich string
    return vim.fn.count(buf_path, '/mind/') == 0
  end,
  source = function()
    ---@diagnostic disable-next-line: undefined-field
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  separator = '',
}

local branch = {
  'branch',
  icon = { '', align = 'right' },
  padding = { left = 1, right = 1 },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      section_separators = { left = '', right = '' },
      component_separators = '|',
      globalstatus = true,
      always_divide_middle = false,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { 'location' },
      lualine_c = { filename, diagnostics },
      lualine_x = {},
      lualine_y = { diff, branch },
      lualine_z = {},
    },
  },
}
