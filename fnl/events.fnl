(local events (require :core.events))

(-> (events.WhenTextYankPost {:pattern "*"})
    (: :subscribe #(_G.vim.highlight.on_yank)))

(-> (events.WhenFocusLost {:pattern "*"})
    (: :subscribe #(_G.vim.api.nvim_command ":wa")))
