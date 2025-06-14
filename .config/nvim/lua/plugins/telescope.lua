return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<CR>", mode = { "n" } },
            { "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<CR>", mode = { "n" } },
            { "<leader>tF", "<cmd>lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })<CR>", mode = { "n" } },
            { "<leader>ts", "<cmd>lua require('telescope.builtin').live_grep()<CR>", mode = { "n" } },
            { "<leader>tS", "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '--no-ignore', '--hidden' }})<CR>", mode = { "n" } },
            { "<leader>tgc", "<cmd> lua require('telescope.builtin').git_commits()<CR>", mode = { "n" } },
            { "<leader>tgb", "<cmd> lua require('telescope.builtin').git_branches()<CR>", mode = { "n" } },
            { "<leader>tgs", "<cmd> lua require('telescope.builtin').git_status()<CR>", mode = { "n" } }
        },
        config = function ()
            local telescope_prompt = {
                TelescopePromptNormal = {
                    bg = '#2d3149'
                },
                TelescopePromptBorder = {
                    bg = '#2d3149'
                },
                -- same color title and background makes it easier to hide
                -- titles for builtins that override the default
                -- prompt/preview/results title fields
                TelescopePromptTitle = {
                    fg = '#2d3149',
                    bg = '#2d3149'
                },
                TelescopePreviewTitle = {
                    fg = '#171720',
                    bg = '#171720'
                },
                TelescopeResultsTitle = {
                    fg = '#171720',
                    bg = '#171720'
                }
            }
            for hl, col in pairs(telescope_prompt) do
                vim.api.nvim_set_hl(0, hl, col)
            end

            require('telescope').setup{
                defaults = {
                    winblend = 30,
                    -- empty border chars with borders enabled will keep the
                    -- natural looking padding; no borders leaves weird gaps
                    border = true,
                    borderchars = {" ", " ", " ", " ", " ", " ", " ", " "},
                    layout_config = {
                        horizontal = {
                            height = 0.9,
                            preview_cutoff = 120,
                            prompt_position = "top",
                            width = 0.8
                        },
                    },
                },
                pickers = {
                    buffers = {
                        mappings = {
                            n = {
                                ["<C-d>"] = "delete_buffer"
                            }
                        }
                    }
                }
            }
        end
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
