-- [nfnl] fnl/plugins/tabline.fnl
local function _1_()
  local theme = {current_tab = "TabLineSel", fill = "TabLineFill", head = "TabLine", tab = "TabLine"}
  local function line(line0)
    local function _2_(tab)
      local hl = ((tab.is_current() and theme.current_tab) or theme.tab)
      return {line0.sep(" ", hl, theme.fill), tab.number(), tab.name(), line0.sep(" ", hl, theme.fill), hl = hl, margin = " "}
    end
    return {line0.tabs().foreach(_2_)}
  end
  return require("tabby.tabline").set(line)
end
return {{"nanozuki/tabby.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = _1_}}
