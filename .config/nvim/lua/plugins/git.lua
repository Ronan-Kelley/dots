return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            local gsigns = require('gitsigns')
            gsigns.setup{
                diff_opts = {
                    vertical = true -- doesn't seem to work
                }
            }

            vim.keymap.set('n', "<leader>hn", function() gsigns.nav_hunk('next') end)
            vim.keymap.set('n', "<leader>hN", function() gsigns.nav_hunk('prev') end)
            vim.keymap.set('n', "<leader>hp", gsigns.preview_hunk_inline)
            vim.keymap.set('n', "<leader>hP", gsigns.preview_hunk)
            vim.keymap.set({'n', 'v'}, "<leader>hs", gsigns.stage_hunk)
            vim.keymap.set({'n', 'v'}, "<leader>hr", gsigns.reset_hunk)
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = false
    },
}
