-- [nfnl] fnl/plugins/statusline.fnl
local function _1_()
  return require("lualine").setup()
end
return {{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_}}
