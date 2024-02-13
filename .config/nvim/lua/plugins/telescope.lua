return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>tb" },
            { "<leader>tf" }
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>tb', builtin.buffers)
            vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
        end
    }
}
