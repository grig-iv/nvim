local M = {}

---@param higlights table
function M.set_highlights(higlights)
  for name, value in pairs(higlights) do
    vim.api.nvim_set_hl(0, name, value)
  end
end

return M
