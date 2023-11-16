-- [nfnl] Compiled from fnl/options.fnl by https://github.com/Olical/nfnl, do not edit.
local frame = require("frame")
frame["set-opts"]({number = true, relativenumber = true, clipboard = "unnamedplus", scrolloff = 5, ignorecase = true, smartcase = true, incsearch = true, autoindent = true, smartindent = true, expandtab = true, tabstop = 4, softtabstop = 4, shiftwidth = 4, confirm = true, updatetime = 100, cursorline = true, spelllang = "en_us", mouse = "a", termguicolors = true, hlsearch = false, swapfile = false, wrap = false})
return frame["set-gs"]({mapleader = " ", maplocalleader = "/"})
