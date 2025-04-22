return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim', 'crispgm/telescope-heading.nvim' },
        keys = {
            { "<leader>tb" },
            { "<leader>tf" },
            { "<leader>tg" },
            { "<leader>th" }
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.load_extension('heading')

            vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>th', ':Telescope heading<CR>')
        end
    }
}
