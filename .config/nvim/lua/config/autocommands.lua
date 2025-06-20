-- [nfnl] fnl/config/autocommands.fnl
local function _1_()
  vim.system({"killall", "-SIGUSR2", "waybar"}, {text = true})
  return false
end
vim.api.nvim_create_autocmd({"BufWritePost"}, {pattern = {(vim.fn.expand("~/dots/.config/waybar/") .. "*")}, callback = _1_})
local function _2_()
  if (vim.fn.filereadable("compile_commands.json") == 0) then
    vim.cmd("LspStop")
  else
  end
  return false
end
vim.api.nvim_create_autocmd({"LspAttach"}, {pattern = {"*.c", "*.h"}, callback = _2_})
return {}
