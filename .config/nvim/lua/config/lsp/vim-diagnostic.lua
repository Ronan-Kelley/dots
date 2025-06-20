-- [nfnl] fnl/config/lsp/vim-diagnostic.fnl
local _local_1_ = require("nfnl.module")
local define = _local_1_["define"]
local M = define("utils")
M.setup = function()
  vim.diagnostic.config({float = {border = "rounded", header = "", prefix = "", source = "always", style = "minimal", focusable = false}})
  return vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
end
return M
