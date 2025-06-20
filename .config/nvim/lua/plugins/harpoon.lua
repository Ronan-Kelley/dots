-- [nfnl] fnl/plugins/harpoon.fnl
local function _1_()
  return require("harpoon.mark").add_file()
end
local function _2_()
  return require("harpoon.ui").toggle_quick_menu()
end
local function _3_()
  return require("harpoon.ui").nav_file(vim.v.count)
end
return {{"theprimeagen/harpoon", lazy = true, keys = {{"<leader>ha", _1_, mode = {"n"}}, {"<leader>hm", _2_, mode = {"n"}}, {"<leader>hj", _3_, mode = {"n"}}}}}
