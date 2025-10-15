local map = vim.keymap.set

-- enhance
map('n', '<C-s>', '<cmd>silent wa<cr><esc>') -- Ctrl-s for save

map('n', 'Q', '@q') -- perform mackro saved on "q"
map('n', 'Y', 'y$') -- yank to the EOL
map('n', 'U', '<C-r>') -- redo
map('n', 'x', '"_x') -- dont save deleted char
map('n', '%', 'ggVG') -- select all buffer
map('n', '<Esc>', '<cmd>nohlsearch<CR>') -- off search higlight

map('n', '+', '<C-a>') -- inc
map('n', '-', '<C-x>') -- dec

map('n', 'j', 'J') -- join next line
map('n', 'J', 'kJ') -- join previous line

map('', '<C-,>', 'F.') -- jump to previous dot in line
map('', '<C-.>', 'f.') -- jump to next dot in line

map({ 'n', 'v' }, 'c', '"_c') -- don't copy cuted text
map('n', 'C', '"_C') -- don't copy cuted text

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- removing double click
map('n', 'dl', 'dd')
map('n', 'cl', 'cc')
map('n', 'yl', 'yy')

-- navigation
map('', '<PageUp>', '<C-u>') -- half page up
map('', '<PageDown>', '<C-d>') -- half page donw
map('', '<C-S-PageUp>', '<C-b>') -- full page up
map('', '<C-S-PageDown>', '<C-f>') -- full page down
map('', '<C-PageUp>', 'gg') -- go to the buffer start
map('', '<C-PageDown>', 'G') -- go to the buffer end

map('', '<Home>', '^') -- <Home> for go to the line start
map('', '<End>', 'g_') -- <End> for go to the line end
map({ 'n', 'v' }, '<S-Home>', 'g0')
map('', '<S-End>', 'g$')

map('n', '<Tab>', '<C-^>') -- alternate with perv buffer

-- panes
map('n', '<Leader>v', '<C-w>v')
map('n', '<Leader>h', '<C-w>s')
map('n', '<C-q>', '<Cmd>wa<Cr><C-w>q')

-- nopes
map('', '<Enter>', '<Nop>') -- disable Enter

-- operators
map('o', 'iw', ']w')
map('o', 'w', 'iw')
map('o', 'W', 'iW')
