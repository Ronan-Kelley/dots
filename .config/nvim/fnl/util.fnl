(local {: autoload : define} (require :nfnl.module))
(local M (define :utils))

; set all of the given values in the given base table
; usage
;    (mapped-set "base table" {set table})
; ex
;    (mapped-set :vim.o { :nu true :relativenumber true })
(fn M.mapped-set [base sets]
  (local {: autoload} (require :nfnl.module))
  (local core (autoload :nfnl.core))
  (each [option value (pairs sets)]
    (core.assoc base option value)))

M

; vim: et:ts=2:sw=2
