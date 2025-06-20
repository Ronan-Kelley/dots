(local {: define} (require :nfnl.module))
(local M (define :utils))

(fn M.setup []
  (vim.diagnostic.config {:float {:border :rounded
                                  :focusable false
                                  :header ""
                                  :prefix ""
                                  :source :always
                                  :style :minimal}})

  (vim.keymap.set :n :<leader>vd vim.diagnostic.open_float))

M
