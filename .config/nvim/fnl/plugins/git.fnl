[{1 :lewis6991/gitsigns.nvim
  :lazy false
  :config (fn []
            (local gsigns (require :gitsigns))
            (gsigns.setup {:diff_opts {:vertical true}})
            (vim.keymap.set :n :<leader>hn (fn [] (gsigns.nav_hunk :next)))
            (vim.keymap.set :n :<leader>hN (fn [] (gsigns.nav_hunk :prev)))
            (vim.keymap.set :n :<leader>hp gsigns.preview_hunk_inline)
            (vim.keymap.set :n :<leader>hP gsigns.preview_hunk)
            (vim.keymap.set [:n :v] :<leader>hs gsigns.stage_hunk)
            (vim.keymap.set [:n :v] :<leader>hr gsigns.reset_hunk)
            ; use a count to change between comparison bases for git gutters
            (vim.keymap.set :n :<leader>cb
                            (fn []
                              (if (not= vim.v.count 0)
                                  ; if the count is not zero, use it to change base
                                  (gsigns.change_base (.. "~" vim.v.count))
                                  ; if the count is 0 or unset (which is also 0) reset to head
                                  (gsigns.change_base :HEAD)))))}
 {1
  :tpope/vim-fugitive
  :lazy false}]	
