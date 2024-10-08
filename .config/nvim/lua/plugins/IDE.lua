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

            lsp_attach = function(client, bufnr)
                local opts = {buffer = bufnr}

                  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end

            lsp.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

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
    },
    {
        "https://github.com/lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            require('gitsigns').setup()
        end,
    },
}
