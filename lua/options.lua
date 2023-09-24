local opt = vim.opt

opt.number = true -- show line numbers
opt.relativenumber = true -- enable relative line numbers
-- opt.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
opt.scrolloff = 5 -- lead scroll by 8 lines

opt.ignorecase = true -- always case-insensitive
opt.smartcase = true -- enable smart-case search
opt.incsearch = true -- searches for strings incrementally
opt.hlsearch = false -- highlight all matches on previous search pattern

opt.autoindent = true -- auto-indent new lines
opt.smartindent = true -- enable smart-indent
opt.expandtab = true -- use spaces instead of tabs
opt.tabstop = 4 -- number of columns per tab
opt.softtabstop = 4 -- number of spaces per Tab
opt.shiftwidth = 4 -- number of auto-indent spaces

opt.confirm = true -- confirm to save changes before exit
opt.swapfile = false -- create swap file
opt.wrap = false -- do not wrap long lines
opt.updatetime = 100 -- faster completion
opt.cursorline = true -- highlight cursor line
opt.spelllang = 'en_us' -- use en_us to spellcheck
opt.mouse = 'a' -- allow the mouse to be used in neovim
opt.termguicolors = true -- enable highlight groups

local g = vim.g

g.mapleader = ' ' -- space as leader key
g.maplocalleader = '/' -- fowardslash as local leader key

