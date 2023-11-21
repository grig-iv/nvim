(local rx (require :libs.rx))

(local group (_G.vim.api.nvim_create_augroup :rx {:clear false}))

(fn create-observable [event ?opts]
  (local opts (or ?opts {}))
  (local subject (rx.Subject.create))
  (_G.vim.api.nvim_create_autocmd event
                                  {: group
                                   :pattern (or opts.pattern "*")
                                   :callback (fn [...] (subject:onNext ...))
                                   :desc "Reactive event"})
  subject)

(local M {})

(fn M.When [event ?opts] (create-observable event ?opts))

(fn add-observable [event]
  (tset M (.. :When event) (lambda [?opts] (create-observable event ?opts))))

(add-observable :FocusLost)
(add-observable :TextYankPost)

M
