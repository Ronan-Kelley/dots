-- [nfnl] fnl/util.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local define = _local_1_["define"]
local M = define("utils")
M["mapped-set"] = function(base, sets)
  local _local_2_ = require("nfnl.module")
  local autoload0 = _local_2_["autoload"]
  local core = autoload0("nfnl.core")
  for option, value in pairs(sets) do
    core.assoc(base, option, value)
  end
  return nil
end
return M
