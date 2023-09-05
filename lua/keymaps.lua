local map = require('utils').map

-- nopes
map('', 'W', '<Nop>')
map('', 'B', '<Nop>')
map('', '^', '<Nop>')
map('', '$', '<Nop>')
map('', '<C-d>', '<Nop>')
map('', '<C-u>', '<Nop>')

-- operators
map('o', 'iw', ']w')
map('o', 'w', 'iw')
map('o', 'W', 'iW')
map('o', '<Leader>w', 'w')
map('o', '<Leader>W', 'W')

local pairs = { '{}', '()', '[]', '<>' }
for _, p in ipairs(pairs) do
    map('o', p:sub(1, 1), 'a' .. p:sub(1, 1))
    map('o', p:sub(2, 2), 'i' .. p:sub(2, 2))
end

-- navigation
map('', '<Up>', 'gk')
map('', '<Down>', 'gj')
map('', '<C-Left>', 'B')
map('', '<C-Up>', '{')
map('', '<C-Down>', '}')
map('', '<C-Right>', 'W')

map('', '<Home>', 'g^')
map('', '<End>', 'g$')

map('', '<PageUp>', '<C-u>')
map('', '<PageDown>', '<C-d>')
map('', '<S-PageUp>', '<C-b>')
map('', '<S-PageDown>', '<C-f>')
map('', '<C-PageUp>', 'gg')
map('', '<C-PageDown>', 'G')

map('n', '<F14>', '<C-o>')
map('n', '<F17>', '<C-i>')

-- buffers
map('n', '<C-Tab>', '<Cmd>bn<Cr>')
map('n', '<S-C-Tab>', '<Cmd>bp<Cr>')

map('n', '<C-w>', '<Cmd>bd<Cr>')

-- enhance
map('n', 'Q', '@q')
map('n', 'Y', 'y$')
map('n', 'U', '<C-r>')
map('n', 'X', 'r')

map('n', 'j', 'J')
map('n', 'J', 'kJ')
map('n', 'h', 'H')

map('', '<C-,>', 'F.')
map('', '<C-.>', 'f.')

map('', '<C-s>', '<Esc><Cmd>w<CR>')
map('n', '<Tab>', '<C-^>')
map('n', '<Esc>', ':nohl<CR>')
