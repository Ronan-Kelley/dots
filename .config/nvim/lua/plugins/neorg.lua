-- [nfnl] fnl/plugins/neorg.fnl
local util = require("util")
local function _1_()
  require("neorg").setup({load = {["core.concealer"] = {}, ["core.defaults"] = {}, ["core.dirman"] = {config = {workspaces = {notes = "~/notes"}, default_workspace = "notes", index = "index.norg"}}}})
  return util["mapped-set"](vim.wo, {foldlevel = 99, conceallevel = 2})
end
return {"nvim-neorg/neorg", config = _1_, lazy = false}
