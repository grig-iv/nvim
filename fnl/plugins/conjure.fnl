(local vim _G.vim)
(local api _G.vim.api)

(local group (api.nvim_create_augroup :conjure {:clear false}))

(fn setup-repl-buf []
  (fn setup []
    (print :yo)
    (vim.diagnostic.disable 0)
    (vim.api.nvim_win_set_option 0 :wrap true))

  (api.nvim_create_autocmd :BufReadPost
                           {: group
                            :pattern [:conjure-log-*]
                            :callback setup
                            :desc "Conjure Log disable LSP diagnostics"}))

{1 :Olical/conjure
 :ft [:clojure :fennel :rust]
 :config #(do
            ((. (require :conjure.main) :main))
            (setup-repl-buf))}
