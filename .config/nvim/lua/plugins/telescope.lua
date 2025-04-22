return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim', 'crispgm/telescope-heading.nvim' },
        keys = {
            { "<leader>tb" },
            { "<leader>tf" },
            { "<leader>ts" },
            { "<leader>th" },
            { "<leader>tgc" },
            { "<leader>tgb" },
            { "<leader>tgs" }
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.load_extension('heading')

            vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ts', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>tgc', builtin.git_commits, {})
            vim.keymap.set('n', '<leader>tgb', builtin.git_branches, {})
            vim.keymap.set('n', '<leader>tgs', builtin.git_status, {})
            vim.keymap.set('n', '<leader>th', ':Telescope heading<CR>')
        end
    }
}
