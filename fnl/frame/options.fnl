{:set-opts (fn [opts]
             "sets vim.opts.*"
             (each [opt val (pairs opts)]
               (tset vim.opt opt val)))

 :set-gs (fn [gs]
           "sets vim.g.*"
           (each [opt val (pairs gs)]
             (tset vim.g opt val)))}
