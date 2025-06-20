[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            ((. (require :nvim-treesitter.configs) :setup) {
                :auto_install true
                :ensure_installed [:c
                                   :lua
                                   :rust]
                :highlight {:additional_vim_regex_highlighting false
                            :enable true}
                :indent {:enable true}
                :sync_install false}))
  :lazy false}]
