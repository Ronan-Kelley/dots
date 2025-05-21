return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        -- no reason to set up associated keys if the plugin isn't lazy loaded
        -- keys = {
        --     {"<leader>hn"}, -- hunk next
        --     {"<leader>hN"}, -- hunk previous
        --     {"<leader>hs"}, -- hunk stage
        --     {"<leader>hS"}, -- hunk undo stage
        --     {"<leader>hp"}, -- hunk preview (inline)
        --     {"<leader>hP"}, -- hunk preview
        --     {"<leader>hr"}, -- hunk reset
        -- },
        config = function()
            require('gitsigns').setup()
            local gsigns = require('gitsigns')
            gsigns.setup()

            vim.keymap.set("n", "<leader>hn", function() gsigns.nav_hunk('next') end)
            vim.keymap.set("n", "<leader>hN", function() gsigns.nav_hunk('prev') end)
            vim.keymap.set("n", "<leader>hs", gsigns.stage_hunk)
            vim.keymap.set("n", "<leader>hS", gsigns.undo_stage_hunk)
            vim.keymap.set("n", "<leader>hp", gsigns.preview_hunk_inline)
            vim.keymap.set("n", "<leader>hP", gsigns.preview_hunk)
            vim.keymap.set("n", "<leader>hr", gsigns.reset_hunk)
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = false
    },
    {
        "rbong/vim-flog", -- included entirely for the graph
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },
}
