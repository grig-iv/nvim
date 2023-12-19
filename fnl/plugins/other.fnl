{1 :rgroli/other.nvim
 :event :VeryLazy
 :config #(let [other (require :other-nvim)] (other.setup $2))
 :opts {:mappings [{:pattern "/fnl/(.*)/(.*).fnl$" :target "/lua/%1/%2.lua"}]}}
