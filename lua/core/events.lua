-- [nfnl] Compiled from fnl/core/events.fnl by https://github.com/Olical/nfnl, do not edit.
local rx = require("libs.rx")
local group = _G.vim.api.nvim_create_augroup("rx", {clear = false})
local function create_observable(event, _3fopts)
  local opts = (_3fopts or {})
  local subject = rx.Subject.create()
  local function _1_(...)
    return subject:onNext(...)
  end
  _G.vim.api.nvim_create_autocmd(event, {group = group, pattern = (opts.pattern or "*"), callback = _1_, desc = "Reactive event"})
  return subject
end
local M = {}
M.When = function(event, _3fopts)
  return create_observable(event, _3fopts)
end
local function add_observable(event)
  local function _2_(_3fopts)
    return create_observable(event, _3fopts)
  end
  M[("When" .. event)] = _2_
  return nil
end
add_observable("FocusLost")
add_observable("TextYankPost")
return M
