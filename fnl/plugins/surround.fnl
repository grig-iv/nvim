{1 :kylechui/nvim-surround
 :version "*"
 :event :VeryLazy
 :config (fn [_ opts]
           (let [surround (require :nvim-surround)]
             (surround.setup opts)))}
