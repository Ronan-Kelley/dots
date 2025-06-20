-- [nfnl] fnl/config/lsp/mason-lspconfig.fnl
local _local_1_ = require("nfnl.module")
local define = _local_1_["define"]
local M = define("utils")
M.setup = function()
  local cmp_lsp = require("cmp_nvim_lsp")
  local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())
  local function _2_(server_name)
    return require("lspconfig")[server_name].setup({capabilities = capabilities})
  end
  local function _3_()
    local lspconfig = require("lspconfig")
    return lspconfig.fennel_language_server.setup({settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  end
  return require("mason-lspconfig").setup({ensure_installed = {"lua_ls"}, handlers = {_2_, fennel_language_server = _3_}})
end
return M
