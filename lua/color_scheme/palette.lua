package.path = package.path .. ';' .. os.getenv('HOME') .. '/.config/colors/?.lua'
local _, c = pcall(require, 'colors')

return c or {}
