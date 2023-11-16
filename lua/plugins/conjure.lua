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
local function is_mark_exist(mark)
  local mark_tuple = api.nvim_buf_get_mark(0, mark)
  return (function(_2_,_3_,_4_) return (_2_ ~= _3_) or (_3_ ~= _4_) end)(0,mark_tuple[1],mark_tuple[2])
end
local function evaluate_mark_on_save()
  local eval = require("conjure.eval")
  local function _5_()
    if is_mark_exist("e") then
      return eval["marked-form"]("e")
    else
      return nil
    end
  end
  return api.nvim_create_autocmd("BufWritePost", {group = group, pattern = {"*.clj", "*.fnl"}, callback = _5_, desc = "Evaluate form undre 'e' mark on save"})
end
local function _7_()
  do end (require("conjure.main")).main()
  disable_repl_lsp()
  return evaluate_mark_on_save()
end
return {"Olical/conjure", ft = {"clojure", "fennel"}, config = _7_}
