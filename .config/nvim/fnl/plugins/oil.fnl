[{1 :stevearc/oil.nvim
    :dependencies [:nvim-tree/nvim-web-devicons]
    :lazy false
    :config (fn []
              (local oil (. (require :oil)))
              ((. oil :setup))
              (vim.keymap.set :n :- (fn []
                                      ; doesn't work; count seems to get clobbered by -
                                      (if (= vim.v.count 0)
                                        ((. oil :open_float))
                                        ((. oil :toggle_float)))))
              (vim.keymap.set :n :<leader>- (fn [] ((. oil :toggle_float)))))}]
