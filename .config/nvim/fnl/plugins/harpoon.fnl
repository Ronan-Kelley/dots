[{1 :theprimeagen/harpoon
  :lazy true
  :keys [{1 :<leader>ha
          2 (fn [] ((. (require :harpoon.mark) :add_file)))
          :mode [:n]}
         {1 :<leader>hm
          2 (fn [] ((. (require :harpoon.ui) :toggle_quick_menu)))
          :mode [:n]}
         {1 :<leader>hj
          ; use a count to jump between harpooned files
          2 (fn [] ((. (require :harpoon.ui) :nav_file) vim.v.count))
          :mode [:n]
         }]
}]
