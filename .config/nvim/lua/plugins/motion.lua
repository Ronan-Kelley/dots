-- [nfnl] fnl/plugins/motion.fnl
local function _1_()
  return require("numb").setup()
end
local function _2_()
  return require("spider").setup({customPatterns = {}, subwordMovement = true, consistentOperatorPending = false, skipInsignificantPunctuation = false})
end
return {{"nacro90/numb.nvim", config = _1_, lazy = false}, {"chrisgrieser/nvim-spider", lazy = true, keys = {{"w", "<cmd>lua require('spider').motion('w')<CR>", mode = {"n", "o", "x"}}, {"e", "<cmd>lua require('spider').motion('e')<CR>", mode = {"n", "o", "x"}}, {"b", "<cmd>lua require('spider').motion('b')<CR>", mode = {"n", "o", "x"}}}, config = _2_}}
