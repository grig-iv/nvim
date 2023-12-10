(fn tmux [method]
  ((-> (require :tmux) (. method))))

{1 :aserowy/tmux.nvim
 :opts {:navigation {:enable_default_keybindings false}}
 :keys [;; Navigation
        [:<A-Left> #(tmux :move_left)]
        [:<A-Up> #(tmux :move_top)]
        [:<A-Down> #(tmux :move_bottom)]
        [:<A-Right> #(tmux :move_right)]
        ;; Resize
        [:<A-C-Left> #(tmux :resize_left)]
        [:<A-C-Up> #(tmux :resize_top)]
        [:<A-C-Down> #(tmux :resize_bottom)]
        [:<A-C-Right> #(tmux :resize_right)]]}
