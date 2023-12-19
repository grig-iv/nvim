-- [nfnl] Compiled from fnl/plugins/comment.fnl by https://github.com/Olical/nfnl, do not edit.
local api = _G.vim.api
local function _1_()
  return api.nvim_feedkeys("gc", "v", false)
end
return {"numToStr/Comment.nvim", opts = {}, keys = {{"<C-c>", "<Cmd>normal gcc<Cr>"}, {"<C-c>", _1_, mode = "v"}}}
