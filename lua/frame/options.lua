-- :fennel:1699650769
local function _1_(opts)
  for opt, val in pairs(opts) do
    vim.opt[opt] = val
  end
  return nil
end
local function _2_(gs)
  for opt, val in pairs(gs) do
    vim.g[opt] = val
  end
  return nil
end
return {["set-opts"] = _1_, ["set-gs"] = _2_}