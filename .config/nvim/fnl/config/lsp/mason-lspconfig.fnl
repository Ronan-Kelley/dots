(local {: define} (require :nfnl.module))
(local M (define :utils))

(fn M.setup []
  (local cmp-lsp (require :cmp_nvim_lsp))
  (local capabilities
    (vim.tbl_deep_extend :force {}
      (vim.lsp.protocol.make_client_capabilities)
      (cmp-lsp.default_capabilities)))

  ((. (require :mason-lspconfig) :setup)
    {:ensure_installed [:lua_ls]
     :handlers {1 (fn [server-name]
                   ((. (require :lspconfig)
                       server-name
                       :setup) {: capabilities}))
     :fennel_language_server (fn []
                             (local lspconfig (require :lspconfig))
                             (lspconfig.fennel_language_server.setup {:settings {:fennel {:diagnostics {:globals [:vim]}
                                                                                          :workspace {:library (vim.api.nvim_list_runtime_paths)}}}}))}}))

M
