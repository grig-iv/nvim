-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = _G.vim
local api = _G.vim.api
local group = api.nvim_create_augroup("conjure", {clear = false})
local function disable_repl_lsp()
  local function _1_()
    return vim.diagnostic.disable(0)
  end
  return api.nvim_create_autocmd("BufNewFile", {group = group, pattern = {"conjure-log-*"}, callback = _1_, desc = "Conjure Log disable LSP diagnostics"})
end
local function _2_()
  do end (require("conjure.main")).main()
  return disable_repl_lsp()
end
return {"Olical/conjure", ft = {"clojure", "fennel"}, config = _2_}
