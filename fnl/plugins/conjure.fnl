(local vim _G.vim)
(local api _G.vim.api)

(local group (api.nvim_create_augroup :conjure {:clear false}))

(fn disable-repl-lsp []
  (api.nvim_create_autocmd :BufNewFile
                           {: group
                            :pattern [:conjure-log-*]
                            :callback #(vim.diagnostic.disable 0)
                            :desc "Conjure Log disable LSP diagnostics"}))

{1 :Olical/conjure
 :ft [:clojure :fennel]
 :config #(do
            ((. (require :conjure.main) :main))
            (disable-repl-lsp))}
