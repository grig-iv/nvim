local utils = require('utils')
local map = utils.map

-- TODO add which key just for documenting purpose

-- nopes
map('', '^', '<Nop>')
map('', '$', '<Nop>')
map('', '<C-d>', '<Nop>')
map('', '<C-u>', '<Nop>')
map('', '<Enter>', '<Nop>')

-- operators
map('o', 'iw', ']w')
map('o', 'w', 'iw')
map('o', 'W', 'iW')
map('o', '<Leader>w', 'w')
map('o', '<Leader>W', 'W')

local pairs = { '{}', '()', '[]', '<>', }
for _, p in ipairs(pairs) do
    map('o', p:sub(1, 1), 'i' .. p:sub(1, 1))
    map('o', p:sub(2, 2), 'a' .. p:sub(2, 2))
end

-- navigation
map('', '<Up>', 'gk')
map('', '<Down>', 'gj')
map('i', '<Up>', '<C-o>gk')
map('i', '<Down>', '<C-o>gj')
map('', '<C-Left>', 'B')
map('', '<C-Up>', '{')
map('', '<C-Down>', '}')
map('', '<C-Right>', 'W')
map('', '<S-Up>', 'ddkP')
map('', '<S-Down>', 'ddjP')

map('', 'n', 'b')
map('', 'N', 'B')
map('', 'e', 'ge')
map('', 'E', 'gE')
map({ 'n', 'v', }, 'i', 'e')
map('', 'I', 'E')
map('', 'o', 'w')
map('', 'O', 'W')

map('n', 'w', 'o')
map('n', 'W', 'O')
map('n', 'a', 'i')
map('n', 'A', 'I')
map('n', 't', 'a')
map('n', 'T', 'A')

map('', 'm', 'n')
map('', 'M', 'N')

map('n', 'b', 'm')

map('', '<Home>', '^')
map('', '<End>', 'g_')
map({ 'n', 'v', }, '<S-Home>', 'g0')
map('', '<S-End>', 'g$')

map('', '<PageUp>', '<C-u>')
map('', '<PageDown>', '<C-d>')
map('', '<C-S-PageUp>', '<C-b>')
map('', '<C-S-PageDown>', '<C-f>')
map('', '<C-PageUp>', 'gg')
map('', '<C-PageDown>', 'G')

map('n', '<F19>', '<C-o>')
map('n', '<F22>', '<Cmd>execute "normal! \\<C-i>"<CR>')

map('n', '<Tab>', '<C-^>') -- alternate with perv buffer

map('', 'gn', 'n')
map('', 'gN', 'N')

-- panes
map('n', '<Leader>v', '<C-w>v')
map('n', '<Leader>h', '<C-w>s')
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

map('n', 'j', 'J')     -- join next line
map('n', 'J', 'kJ')    -- join previous line

map('', '<C-,>', 'F.') -- jump to previous dot in line
map('', '<C-.>', 'f.') -- jump to next dot in line

map('', '<C-S-s>', '<Esc><Cmd>w<CR>')

-- increment number or upper char under cursor
map('n', '<S-PageUp>', function()
    if utils.char_under_cursor_is_digit() then
        return '<C-a>'
    else
        return 'gUl'
    end
end, { expr = true, })

-- decrement number or lower char under cursor
map('n', '<S-PageDown>', function()
    if utils.char_under_cursor_is_digit() then
        return '<C-x>'
    else
        return 'gul'
    end
end, { expr = true, })
