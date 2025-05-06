return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        keys = {
            {"<leader>hn"},
            {"<leader>hp"},
            {"<leader>hs"},
            {"<leader>hS"},
        },
        config = function()
            require('gitsigns').setup()
            local gsigns = require('gitsigns')
            gsigns.setup()

            vim.keymap.set("n", "<leader>hn", function() gsigns.nav_hunk('next') end)
            vim.keymap.set("n", "<leader>hN", function() gsigns.nav_hunk('prev') end)
            vim.keymap.set("n", "<leader>hs", gsigns.stage_hunk)
            vim.keymap.set("n", "<leader>hS", gsigns.undo_stage_hunk)
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = false
    },
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },
}
