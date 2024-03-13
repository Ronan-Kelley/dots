return {
    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = false,
        dependencies = {
 	        -- LSP Support
            { 'neovim/nvim-lspconfig', lazy = false },
 		    { 'williamboman/mason.nvim', lazy = false },
 		    { 'williamboman/mason-lspconfig.nvim', lazy = false },

 		    -- Autocompletion
 		    { 'hrsh7th/nvim-cmp', lazy = false },
 		    { 'hrsh7th/cmp-buffer', lazy = false },
 		    { 'hrsh7th/cmp-path', lazy = false },
 		    { 'saadparwaiz1/cmp_luasnip', lazy = false },
 		    { 'hrsh7th/cmp-nvim-lsp', lazy = false },
 		    { 'hrsh7th/cmp-nvim-lua', lazy = false },

 		    -- Snippets
 		    { 'L3MON4D3/LuaSnip', lazy = false },
 		    { 'rafamadriz/friendly-snippets', lazy = false },
        },
        config = function()
            local lsp = require("lsp-zero")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            lsp.preset("recommended")

            mason.setup({})
            mason_lspconfig.setup({
                ensure_installed = {
                    'lua_ls',
                    'rust_analyzer'
                },
                handlers = {
                    lsp.default_setup,
                },
            })

            -- Fix Undefined global 'vim'
            lsp.configure('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        telemetry = {
                            enable = false,
                        }
                    }
                }
            })


            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                sources = {
                    {name = 'nvim_lsp'},
                }
            })

            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            })

            lsp.on_attach(function(client, bufnr)
              local opts = {buffer = bufnr, remap = false}

              vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
              vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
              vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
              vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
              vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
              vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
              vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
              vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
              vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
              vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end)

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = true,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require'nvim-treesitter.configs'.setup {
              -- A list of parser names, or "all"
              ensure_installed = { "c", "lua", "rust" },

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,

              -- Automatically install missing parsers when entering buffer
              -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
              auto_install = true,

              highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
              },
            }
        end,
    }
}
