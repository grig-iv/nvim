-- [nfnl] Compiled from fnl/events.fnl by https://github.com/Olical/nfnl, do not edit.
local events = require("core.events")
local function _1_()
  return _G.vim.highlight.on_yank()
end
events.WhenTextYankPost({pattern = "*"}):subscribe(_1_)
local function _2_()
  return _G.vim.api.nvim_command(":wa")
end
return events.WhenFocusLost({pattern = "*"}):subscribe(_2_)
