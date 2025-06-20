-- [nfnl] fnl/plugins/git.fnl
local function _1_()
  local gsigns = require("gitsigns")
  gsigns.setup({diff_opts = {vertical = true}})
  local function _2_()
    return gsigns.nav_hunk("next")
  end
  vim.keymap.set("n", "<leader>hn", _2_)
  local function _3_()
    return gsigns.nav_hunk("prev")
  end
  vim.keymap.set("n", "<leader>hN", _3_)
  vim.keymap.set("n", "<leader>hp", gsigns.preview_hunk_inline)
  vim.keymap.set("n", "<leader>hP", gsigns.preview_hunk)
  vim.keymap.set({"n", "v"}, "<leader>hs", gsigns.stage_hunk)
  vim.keymap.set({"n", "v"}, "<leader>hr", gsigns.reset_hunk)
  local function _4_()
    if (vim.v.count ~= 0) then
      return gsigns.change_base(("~" .. vim.v.count))
    else
      return gsigns.change_base("HEAD")
    end
  end
  return vim.keymap.set("n", "<leader>cb", _4_)
end
return {{"lewis6991/gitsigns.nvim", config = _1_, lazy = false}, {"tpope/vim-fugitive", lazy = false}}
