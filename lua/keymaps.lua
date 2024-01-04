local map = require('utils').map

-- TODO add which key just for documenting purpose

-- nopes
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
map({ 'n', 'v' }, '<S-Home>', 'g0')
map('', '<S-End>', 'g$')

map('', '<PageUp>', '<C-u>')
map('', '<PageDown>', '<C-d>')
map('', '<C-S-PageUp>', '<C-b>')
map('', '<C-S-PageDown>', '<C-f>')
map('', '<C-PageUp>', 'gg')
map('', '<C-PageDown>', 'G')

map('n', '<F19>', '<C-o>')
map('n', '<F22>', '<C-i>')

-- panes
map('n', '<Leader>v', '<C-w>v')
map('n', '<Leader>h', '<C-w>s')
map('n', '<M-Left>', '<C-w>h')
map('n', '<M-Up>', '<C-w>k')
map('n', '<M-Down>', '<C-w>j')
map('n', '<M-Right>', '<C-w>l')
map('n', '<C-q>', '<Cmd>wa<Cr><C-w>q')

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

-- enhance
map('n', '<C-s>', '<Cmd>silent wa<Cr>')        -- save
map('n', '<C-S-q>', '<Cmd>wa<Cr><Cmd>qa!<Cr>') -- force exit
map('n', 'Q', '@q')                            -- perform mackro saved on "q"
map('n', 'Y', 'y$')                            -- yank to the EOL
map('n', 'U', '<C-r>')                         -- redo
map('', '<C-y>', '"+y')
map('', '<C-p>', '"+p')

map('n', '<S-PageUp>', '<C-a>gUl')   -- increment number or upper char under cursor
map('n', '<S-PageDown>', '<C-x>gul') -- decrement number or lower char under cursor

map('n', 'j', 'J')                   -- join next line
map('n', 'J', 'kJ')                  -- join previous line

map('', '<C-,>', 'F.')               -- jump to previous dot in line
map('', '<C-.>', 'f.')               -- jump to next dot in line

map('', '<C-S-s>', '<Esc><Cmd>w<CR>')
map('n', '<Tab>', '<C-^>')
