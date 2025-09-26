local function tmux(method)
  return function()
    require('tmux')[method]()
  end
end

return {
  'aserowy/tmux.nvim',
  keys = {
    -- Navigation
    { '<A-Left>', tmux 'move_left' },
    { '<A-Up>', tmux 'move_top' },
    { '<A-Down>', tmux 'move_bottom' },
    { '<A-Right>', tmux 'move_right' },

    -- Resize
    { '<A-C-Left>', tmux 'resize_left' },
    { '<A-C-Up>', tmux 'resize_top' },
    { '<A-C-Down>', tmux 'resize_bottom' },
    { '<A-C-Right>', tmux 'resize_right' },
  },
  opts = {
    navigation = {
      enable_default_keybindings = false,
    },
  },
}
