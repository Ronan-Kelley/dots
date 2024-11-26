return {
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            { "<leader>tt", function() require("trouble").toggle() end },
            { "<leader>[t", function() require("trouble").next({skip_groups = true, jump = true}) end },
            { "<leader>[t", function() require("trouble").previous({skip_groups = true, jump = true}) end },
        },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end
    },
}
