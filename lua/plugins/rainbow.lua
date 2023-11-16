-- [nfnl] Compiled from fnl/plugins/rainbow.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  _G.vim.g.rainbow_active = 1
  return nil
end
return {"luochen1990/rainbow", init = _1_, event = "BufReadPost"}
