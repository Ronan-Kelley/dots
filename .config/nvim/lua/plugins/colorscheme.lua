-- [nfnl] fnl/plugins/colorscheme.fnl
local function _1_()
  require("tokyonight").setup({hide_inactive_statusline = true, style = "night", terminal_color = true, transparent = false})
  return vim.cmd("colorscheme tokyonight")
end
return {"folke/tokyonight.nvim", priority = 1000, config = _1_, lazy = false}
