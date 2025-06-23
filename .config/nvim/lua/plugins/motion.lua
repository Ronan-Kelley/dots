-- [nfnl] fnl/plugins/motion.fnl
local function _1_()
  return require("numb").setup()
end
return {{"nacro90/numb.nvim", config = _1_, lazy = false}}
