-- [nfnl] fnl/plugins/latex.fnl
local util = require("util")
local function _1_()
  local viewer = "zathura"
  local opts = {vimtex_view_use_tmp_files = 0, vimtex_viewer_general = viewer, vimtex_context_pdf_viewer = viewer, vimtex_view_method = viewer, vimtex_view_general_viewer = viewer}
  return util["mapped-set"](vim.g, opts)
end
return {{"lervag/vimtex", lazy = true, ft = "tex", config = _1_}}
