{1 :folke/tokyonight.nvim
 :lazy false
 :priority 1000
 :config (fn []
           ((. (require :tokyonight) :setup) {:hide_inactive_statusline true
                                              :style "night"
                                              :terminal_color true
                                              :transparent false})
           (vim.cmd "colorscheme tokyonight"))}
