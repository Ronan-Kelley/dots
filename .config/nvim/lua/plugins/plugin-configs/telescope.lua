local secondary = "#2d3149"
local primary = "#171720"
local telescope_prompt = {
    TelescopePromptNormal = {bg = "#2d3149"},
    TelescopePromptBorder = {bg = "#2d3149"},
    TelescopePromptTitle  = {bg = "#2d3149",
                             fg = "#2d3149"},
    TelescopePreviewTitle = {bg = "#171720",
                             fg = "#171720"},
    TelescopeResultsTitle = {bg = "#171720",
                             fg = "#171720"}
}
for hl, col in pairs(telescope_prompt) do
    vim.api.nvim_set_hl(0, hl, col)
end
