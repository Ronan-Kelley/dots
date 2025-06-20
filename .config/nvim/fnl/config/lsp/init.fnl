(local {: define} (require :nfnl.module))
(local M (define :utils))

(local vim-diagnostic (require :config.lsp.vim-diagnostic))
(local mason-lspconfig (require :config.lsp.mason-lspconfig))

(fn M.setup []
  (vim-diagnostic.setup)
  (mason-lspconfig.setup))

M
