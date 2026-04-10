-- tabby is a bit more involved
local theme = {
    current_tab = "TabLineSel",
    fill = "TabLineFill",
    head = "TabLine",
    tab = "TabLine"
}
local function defline(line)
    local function deftab(tab)
        local hl = ((tab.is_current() and theme.current_tab) or theme.tab)
        return {
            line.sep(" ", hl, theme.fill),
            tab.number(),
            tab.name(),
            line.sep(" ", hl, theme.fill),
            hl = hl,
            margin = " "
        }
    end
    return line.tabs().foreach(deftab)
end
require('tabby.tabline').set(defline)
