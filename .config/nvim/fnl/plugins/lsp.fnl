[{1 :saghen/blink.cmp
  :dependencies [
    {1 :L3MON4D3/LuaSnip
      :version :v2.*
      :build "make install_jsregexp"}]
  :opts {
    :keymap {
        :preset :none
        ; similar to the default keymaps but <C-space> and <C-y> are switched
        :<C-space> [ :select_and_accept :fallback ]
        :<C-y>     [ :show :show_documentation :hide_documentation]
        :<Up>      [ :select_prev :fallback ]
        :<Down>    [ :select_next :fallback ]
        :<C-p>     [ :select_prev :fallback ]
        :<C-n>     [ :select_next :fallback ]
        :<C-b>     [ :scroll_documentation_up ]
        :<C-f>     [ :scroll_documentation_down ]
        :<Tab>     [ :snippet_forward :fallback ]
        :<S-Tab>   [ :snippet_backward :fallback ]
        :<C-k>     [ :show_signature :hide_signature :fallback ]
    }
    :appearance { :nerd_font_variant :mono }
    :completion { :documentation { :auto_show false } }
    :sources { :default [ :lsp :path :snippets :buffer ] }
    :snippets { :preset :luasnip }
    :fuzzy { :implementation :prefer_rust_with_warning }
  }
  :version :1.* }
 {1 :neovim/nvim-lspconfig
  :dependencies [:williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 {1 :L3MON4D3/LuaSnip
                    :version :v2.*
                    :build "make install_jsregexp"}
                 :j-hui/fidget.nvim]
  :opts {
    :servers {
        :lua_ls {}
    }
  }
  :config (fn [_ opts]
            (vim.keymap.set :n :<leader>vd vim.diagnostic.open_float)
            ; enable fidget
            ((. (require :fidget) :setup) {})
            ; setup mason
            ((. (require :mason) :setup))
            ((. (require :mason-lspconfig) :setup) {:ensure_installed [:lua_ls]
                                                    :handlers {1 (fn [server-name]
                                                                   ((. (require :lspconfig)
                                                                       server-name
                                                                       :setup) {: capabilities}))
                                                               :fennel_language_server (fn []
                                                                                         (local lspconfig
                                                                                                (require :lspconfig))
                                                                                         (lspconfig.fennel_language_server.setup {:settings {:fennel {:diagnostics {:globals [:vim]}
                                                                                                                                                      :workspace {:library (vim.api.nvim_list_runtime_paths)}}}}))}})
            ; configure the diagnostic window
            (vim.diagnostic.config {:float {:border :rounded
                                            :focusable false
                                            :header ""
                                            :prefix ""
                                            :source :always
                                            :style :minimal}})
            ; load snippets
            ((. (require :luasnip.loaders.from_lua) :load) {:paths :./lua/snippets}))
 }
 {1 :folke/trouble.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :opts {}
  :cmd :Trouble
  :keys [[:<leader>cd "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"]
         [:<leader>cs "<cmd>Trouble symbols toggle focus=false<cr>"]]
  }]	
