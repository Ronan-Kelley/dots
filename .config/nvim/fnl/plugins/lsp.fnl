; completion engine
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
  :dependencies [{1 :L3MON4D3/LuaSnip
                    :version :v2.*
                    :build "make install_jsregexp"}
                 :j-hui/fidget.nvim]
  :config (fn [_ opts]
            ; enable fidget
            ((. (require :fidget) :setup) {})
            ; supposedly you can override these in their own discrete files by the pattern
            ; (runtime path)/lsp/server-name.lua; I can't seem to get that to work, however.
            (let [lsps [
                        ; lua doesn't need any configuration, but including it
                        ; ensures that it is enabled
                        [:lua_ls]
                        ; clangd + launch args to disable automatically adding headers
                        ; since I don't like that particular function of the LS.
                        [:clangd {:cmd [ :clangd :-header-insertion=never ]}]
                        ; fennel doesn't install as "fennel-language-server" on arch
                        ; so the nvim-lspconfig configs won't launch it without overriding
                        ; the command
                        [:fennel_language_server {:cmd [ :fennel-ls ]
                                                 ; make vim a global; seems to be getting ignored
                                                  :settings {:fennel {:diagnostics {:globals [:vim]}
                                                                      ; load libraries from neovim into the runtime path of our fennel interpreter;
                                                                      ; doesn't seem to be working. Might need to add "true" after every path found
                                                                      ; to fix this.
                                                                      :workspace {:libraries (vim.api.nvim_list_runtime_paths)}}}}]]]
                (each [_ lsp (pairs lsps)]
                  (let [name (. lsp 1)
                        config (. lsp 2)]
                    (vim.lsp.enable name)
                    (if config
                        (vim.lsp.config name config)))))
            ; load snippets
            ((. (require :luasnip.loaders.from_lua) :load) {:paths :./lua/snippets}))

 }
 ; IDE-like view of all code symbols/diagnostics/etc
 {1 :folke/trouble.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :opts {}
  :cmd :Trouble
  :keys [[:<leader>cd "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"]
         [:<leader>cs "<cmd>Trouble symbols toggle focus=false<cr>"]]
  }
 ; rainbow parenthesis/brackets/braces
 {1 :HiPhish/rainbow-delimiters.nvim}]
