return {
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>cd", "<cmd>Trouble diagnostics toggle<cr>" },
            { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = "false"
    }
}
