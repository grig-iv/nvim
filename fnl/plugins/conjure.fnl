(local vim _G.vim)
(local api _G.vim.api)

(local group (api.nvim_create_augroup :conjure {:clear false}))

(fn disable-repl-lsp []
  (api.nvim_create_autocmd :BufNewFile
                           {: group
                            :pattern [:conjure-log-*]
                            :callback #(vim.diagnostic.disable 0)
                            :desc "Conjure Log disable LSP diagnostics"}))

(fn is-mark-exist [mark]
  (let [mark-tuple (api.nvim_buf_get_mark 0 mark)]
    (not= 0 (. mark-tuple 1) (. mark-tuple 2))))

(fn evaluate-mark-on-save []
  (local eval (require :conjure.eval))
  (api.nvim_create_autocmd :BufWritePost
                           {: group
                            :pattern [:*.clj :*.fnl]
                            :callback #(if (is-mark-exist :e)
                                           (eval.marked-form :e))
                            :desc "Evaluate form undre 'e' mark on save"}))

{1 :Olical/conjure
 :ft [:clojure :fennel]
 :config #(do
            ((. (require :conjure.main) :main))
            (disable-repl-lsp)
            (evaluate-mark-on-save))}
