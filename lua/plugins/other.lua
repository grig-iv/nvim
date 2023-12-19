-- [nfnl] Compiled from fnl/plugins/other.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_241, _242)
  local other = require("other-nvim")
  return other.setup(_242)
end
return {"rgroli/other.nvim", event = "VeryLazy", config = _1_, opts = {mappings = {{pattern = "/fnl/(.*)/(.*).fnl$", target = "/lua/%1/%2.lua"}}}}
