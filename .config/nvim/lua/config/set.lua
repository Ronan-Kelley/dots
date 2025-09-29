-- [nfnl] fnl/config/set.fnl
local util = require("util")
do
  local options = {nu = true, relativenumber = true, tabstop = 4, softtabstop = 4, shiftwidth = 4, expandtab = true, smartindent = true, undodir = (os.getenv("HOME") .. "/.vim/undodir"), undofile = true, incsearch = true, termguicolors = true, scrolloff = 8, signcolumn = "yes", mouse = "", shell = "zsh", backup = false, hlsearch = false, swapfile = false, wrap = false}
  util["mapped-set"](vim.o, options)
end
do
  local options_global = {netrw_browse_split = 0, netrw_banner = 0, netrw_winsize = 25}
  util["mapped-set"](vim.g, options_global)
end
vim.diagnostic.config({float = {border = "rounded", header = "", prefix = "", source = "always", style = "minimal", focusable = false}})
return {}
