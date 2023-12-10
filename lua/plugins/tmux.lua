-- [nfnl] Compiled from fnl/plugins/tmux.fnl by https://github.com/Olical/nfnl, do not edit.
local function tmux(method)
  return (require("tmux"))[method]()
end
local function _1_()
  return tmux("move_left")
end
local function _2_()
  return tmux("move_top")
end
local function _3_()
  return tmux("move_bottom")
end
local function _4_()
  return tmux("move_right")
end
local function _5_()
  return tmux("resize_left")
end
local function _6_()
  return tmux("resize_top")
end
local function _7_()
  return tmux("resize_bottom")
end
local function _8_()
  return tmux("resize_right")
end
return {"aserowy/tmux.nvim", opts = {navigation = {enable_default_keybindings = false}}, keys = {{"<A-Left>", _1_}, {"<A-Up>", _2_}, {"<A-Down>", _3_}, {"<A-Right>", _4_}, {"<A-C-Left>", _5_}, {"<A-C-Up>", _6_}, {"<A-C-Down>", _7_}, {"<A-C-Right>", _8_}}}
