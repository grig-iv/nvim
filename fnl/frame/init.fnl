(fn merge-tables [t1 t2]
  (each [k v (pairs t2)]
    (tset t1 k v))
  t1)

(let [options (require :frame.options)]
  (-> {}
      (merge-tables options)))
