-- :fennel:1699581257
local function merge_tables(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end
local options = require("frame.options")
return merge_tables({}, options)