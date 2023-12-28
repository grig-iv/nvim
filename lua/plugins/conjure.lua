-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = _G.vim
local api = _G.vim.api
local group = api.nvim_create_augroup("conjure", {clear = false})
local function setup_repl_buf()
  local function setup()
    print("yo")
    vim.diagnostic.disable(0)
    return vim.api.nvim_win_set_option(0, "wrap", true)
  end
  return api.nvim_create_autocmd("BufReadPost", {group = group, pattern = {"conjure-log-*"}, callback = setup, desc = "Conjure Log disable LSP diagnostics"})
end
local function _1_()
  do end (require("conjure.main")).main()
  return setup_repl_buf()
end
return {"Olical/conjure", ft = {"clojure", "fennel", "rust"}, config = _1_}
