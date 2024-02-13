return
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = function()
            return {
                style = "storm",
                transparent = false,
                terminal_colors = true,
                hide_inactive_statusline = true
            }
        end,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    }
