(local frame (require :frame))

;; fnlfmt: skip
(frame.set-opts
  { 
   :number true ; show line numbers
   :relativenumber true ; enable relative line numbers
   :clipboard "unnamedplus" ; allows neovim to access the system clipboard
   :scrolloff 5 ; lead scroll by 8 lines

   :ignorecase true ; always case-insensitive
   :smartcase true ; enable smart-case search
   :incsearch true ; searches for strings incrementally
   :hlsearch false ; highlight all matches on previous search pattern

   :autoindent true ; auto-indent new lines
   :smartindent true ; enable smart-indent
   :expandtab true ; use spaces instead of tabs
   :tabstop 4 ; number of columns per tab
   :softtabstop 4 ; number of spaces per Tab
   :shiftwidth 4 ; number of auto-indent spaces

   :confirm true ; confirm to save changes before exit
   :swapfile false ; create swap file
   :wrap false ; do not wrap long lines
   :updatetime 100 ; faster completion
   :cursorline true ; highlight cursor line
   :spelllang "en_us" ; use en_us to spellcheck
   :mouse "a" ; allow the mouse to be used in neovim
   :termguicolors true ; enable highlight groups 
   })

;; fnlfmt: skip
(frame.set-gs
  {
   :mapleader " "      ; space as leader key 
   :maplocalleader "/" ; fowardslash as local leader key 
   })
