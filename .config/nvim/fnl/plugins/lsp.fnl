[{1 :hrsh7th/nvim-cmp
  :opts (fn [_ opts]
          (set opts.sources (or opts.sources {}))
          (table.insert opts.sources {:group_index 0 :name :lazydev}))}
 {1 :neovim/nvim-lspconfig
  :dependencies [:williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 :hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-buffer
                 :hrsh7th/cmp-path
                 :hrsh7th/cmp-cmdline
                 :hrsh7th/nvim-cmp
                 {1 :L3MON4D3/LuaSnip :build "make install_jsregexp"}
                 :saadparwaiz1/cmp_luasnip
                 :j-hui/fidget.nvim]
  :config (fn []
            (vim.keymap.set :n :<leader>vd vim.diagnostic.open_float)
            (local cmp (require :cmp))
            (local cmp-lsp (require :cmp_nvim_lsp))
            (local capabilities
                   (vim.tbl_deep_extend :force {}
                                        (vim.lsp.protocol.make_client_capabilities)
                                        (cmp-lsp.default_capabilities)))
            ((. (require :fidget) :setup) {})
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
            (local cmp-select {:behavior cmp.SelectBehavior.Select})
            (cmp.setup {:mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.confirm {:select true})
                                                             :<C-b> (cmp.mapping.scroll_docs (- 4))
                                                             :<C-f> (cmp.mapping.scroll_docs 4)
                                                             :<C-n> (cmp.mapping.select_next_item cmp-select)
                                                             :<C-p> (cmp.mapping.select_prev_item cmp-select)
                                                             :<CR> (cmp.mapping.confirm {:select false})})
                        :snippet {:expand (fn [args]
                                            ((. (require :luasnip) :lsp_expand) args.body)
                                            ((. (require :luasnip) :config
                                                :setup) {:enable_autosnippets true}))}
                        :sources (cmp.config.sources [{:name :nvim_lsp}
                                                      {:name :luasnip}]
                                                     [{:name :buffer}])})
            (vim.diagnostic.config {:float {:border :rounded
                                            :focusable false
                                            :header ""
                                            :prefix ""
                                            :source :always
                                            :style :minimal}})
            ((. (require :luasnip.loaders.from_lua) :load) {:paths :./lua/snippets}))
 }
 {1 :folke/trouble.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :opts {}
  :cmd :Trouble
  :keys [[:<leader>cd "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"]
         [:<leader>cs "<cmd>Trouble symbols toggle focus=false<cr>"]]
  }]	
