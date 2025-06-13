return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            local gsigns = require('gitsigns')
            gsigns.setup{
                diff_opts = {
                    vertical = true
                }
            }

            vim.keymap.set('n', "<leader>hn", function() gsigns.nav_hunk('next') end)
            vim.keymap.set('n', "<leader>hN", function() gsigns.nav_hunk('prev') end)
            vim.keymap.set('n', "<leader>hp", gsigns.preview_hunk_inline)
            vim.keymap.set('n', "<leader>hP", gsigns.preview_hunk)
            vim.keymap.set({'n', 'v'}, "<leader>hs", gsigns.stage_hunk)
            vim.keymap.set({'n', 'v'}, "<leader>hr", gsigns.reset_hunk)
            -- use a count to change between comparison bases for git gutters
            vim.keymap.set('n', "<leader>cb", function ()
                if vim.v.count ~= 0 then
                    gsigns.change_base('~' .. vim.v.count)
                else
                    gsigns.change_base('HEAD')
                end
            end)
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = false
    },
}
