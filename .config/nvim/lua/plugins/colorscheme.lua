return
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                -- style = "stormy",
                transparent = false,
                terminal_color = true,
                hide_inactive_statusline = true,
            });
            vim.cmd([[colorscheme tokyonight]])
        end
    }
