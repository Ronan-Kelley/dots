return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<CR>", mode = { "n" } },
            { "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<CR>", mode = { "n" } },
            { "<leader>tF", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", mode = { "n" } },
            { "<leader>ts", "<cmd>lua require('telescope.builtin').live_grep()<CR>", mode = { "n" } },
            { "<leader>tgc", "<cmd> lua require('telescope.builtin').git_commits()<CR>", mode = { "n" } },
            { "<leader>tgb", "<cmd> lua require('telescope.builtin').git_branches()<CR>", mode = { "n" } },
            { "<leader>tgs", "<cmd> lua require('telescope.builtin').git_status()<CR>", mode = { "n" } }
        }
    },
    {
        'crispgm/telescope-heading.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        keys = {
            { "<leader>th", "<cmd>lua require('telescope').extensions.heading.heading()<CR>", mode = { "n" } },
        },
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('heading')
        end
    }
}
