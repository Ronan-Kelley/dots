return {
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>cd", "<cmd>Trouble diagnostics toggle<cr>" },
            { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
        },
    },
}
