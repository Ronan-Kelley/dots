-- [nfnl] fnl/config/lsp/init.fnl
local _local_1_ = require("nfnl.module")
local define = _local_1_["define"]
local M = define("utils")
local vim_diagnostic = require("config.lsp.vim-diagnostic")
local mason_lspconfig = require("config.lsp.mason-lspconfig")
M.setup = function()
  vim_diagnostic.setup()
  return mason_lspconfig.setup()
end
return M
