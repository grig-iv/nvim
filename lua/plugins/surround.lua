-- [nfnl] Compiled from fnl/plugins/surround.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local surround = require("nvim-surround")
  return surround.setup(opts)
end
return {"kylechui/nvim-surround", version = "*", event = "VeryLazy", config = _1_}
