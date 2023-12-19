(local api _G.vim.api)

{1 :numToStr/Comment.nvim
 :opts {}
 :keys [[:<C-c> "<Cmd>normal gcc<Cr>"]
        {1 :<C-c> 2 #(api.nvim_feedkeys :gc :v false) :mode :v}]}
