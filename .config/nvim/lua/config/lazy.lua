-- packer boostrap for fresh installs --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- require("lazy").setup({
--     -- file search
--     {
--         'nvim-telescope/telescope.nvim',
--         tag = '0.1.5',
--         dependencies = { 'nvim-lua/plenary.nvim' }
--     },
-- 
--     -- theme
--     'folke/tokyonight.nvim',
--     -- treesitter
--     {
--         'nvim-treesitter/nvim-treesitter',
--         build = ':TSUpdate'
--     },
--     -- quick file switcher
--     'theprimeagen/harpoon',
--     -- undo tree with UI and git-like branches
--     'mbbill/undotree',
--     -- first class git support
--     'tpope/vim-fugitive',
--     -- LaTeX support
--     'lervag/vimtex',
--     -- main IDE features via lsp-zero
--     {
-- 	    'VonHeikemen/lsp-zero.nvim',
-- 	    dependencies = {
-- 	        -- LSP Support
-- 		    'neovim/nvim-lspconfig',
-- 		    'williamboman/mason.nvim',
-- 		    'williamboman/mason-lspconfig.nvim',
-- 
-- 		    -- Autocompletion
-- 		    'hrsh7th/nvim-cmp',
-- 		    'hrsh7th/cmp-buffer',
-- 		    'hrsh7th/cmp-path',
-- 		    'saadparwaiz1/cmp_luasnip',
-- 		    'hrsh7th/cmp-nvim-lsp',
-- 		    'hrsh7th/cmp-nvim-lua',
-- 
-- 		    -- Snippets
-- 		    'L3MON4D3/LuaSnip',
-- 		    'rafamadriz/friendly-snippets',
-- 	    }
--     },
-- 
--     --tabline
--     'nanozuki/tabby.nvim',
--     -- yuck file support
--     'elkowar/yuck.vim'
-- })
