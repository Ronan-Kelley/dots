-- [nfnl] fnl/plugins/oil.fnl
local function _1_()
  local oil = require("oil")
  oil.setup()
  local function _2_()
    if (vim.v.count == 0) then
      return oil.open_float()
    else
      return oil.toggle_float()
    end
  end
  vim.keymap.set("n", "-", _2_)
  local function _4_()
    return oil.toggle_float()
  end
  return vim.keymap.set("n", "<leader>-", _4_)
end
return {{"stevearc/oil.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_, lazy = false}}
