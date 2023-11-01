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

map('', '<Home>', '^')
map('', '<End>', 'g_')
map({'n', 'v'}, '<S-Home>', 'g0')
map('', '<S-End>', 'g$')

map('', '<PageUp>', '<C-u>')
map('', '<PageDown>', '<C-d>')
map('', '<S-PageUp>', '<C-b>')
map('', '<S-PageDown>', '<C-f>')
map('', '<C-PageUp>', 'gg')
map('', '<C-PageDown>', 'G')

map('n', '<Backspace>', '<C-o>')
map('n', '<Space>', '<C-i>')

-- pane navigation
map('n', '<Leader>|', '<C-w>v')
map('n', '<Leader>-', '<C-w>s')
map('n', '<M-Left>', '<C-w>h')
map('n', '<M-Up>', '<C-w>k')
map('n', '<M-Down>', '<C-w>j')
map('n', '<M-Right>', '<C-w>l')

-- removing double click
map('n', 'dd', '<Nop>')
map('n', 'cc', '<Nop>')
map('n', 'yy', '<Nop>')
map('n', 'dl', 'dd')
map('n', 'cl', 'cc')
map('n', 'yl', 'yy')
map('n', 'dx', 'dl')
map('n', 'cx', 'cl')
map('n', 'yx', 'yl')

-- buffers
map('n', '<C-Tab>', '<Cmd>bn<Cr>')
map('n', '<S-C-Tab>', '<Cmd>bp<Cr>')

map('n', '<C-w>', '<Cmd>bd<Cr>')

-- rework X key
map('n', 'xu', 'gUl')
map('n', 'xl', 'gul')
map('n', 'xi', '<C-a>')
map('n', 'xd', '<C-x>')

-- enhance
map('n', '<C-q>', '<Cmd>xa<Cr>')
map('n', '<C-S-q>', '<Cmd>q!<Cr>')
map('n', 'Q', '@q')
map('n', 'Y', 'y$')
map('n', 'U', '<C-r>')
map('', '<C-y>', '"+y')
map('', '<C-p>', '"+p')

map('n', 'j', 'J')
map('n', 'J', 'kJ')

map('', '<C-,>', 'F.')
map('', '<C-.>', 'f.')

map('', '<C-S-s>', '<Esc><Cmd>w<CR>')
map('n', '<Tab>', '<C-^>')
