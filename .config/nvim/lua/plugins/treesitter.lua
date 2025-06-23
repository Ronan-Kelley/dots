-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  return require("nvim-treesitter.configs").setup({auto_install = true, ensure_installed = {"c", "lua", "rust"}, highlight = {enable = true, additional_vim_regex_highlighting = false}, indent = {enable = false}, sync_install = false})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_, lazy = false}}
