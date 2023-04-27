-- packer boostrap for fresh installs --
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- file search plugins
    use {
	    'nvim-telescope/telescope.nvim', tag = '0.1.0',
	    -- or                            , branch = '0.1.x',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- theme
    use 'folke/tokyonight.nvim'
    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- quick file switcher
    use 'theprimeagen/harpoon'
    -- undo tree with UI and git-like branches
    use 'mbbill/undotree'
    -- first class git support
    use 'tpope/vim-fugitive'
    -- LaTeX support
    use 'lervag/vimtex'

    -- main IDE features via lsp-zero
    use {
	    'VonHeikemen/lsp-zero.nvim',
	    requires = {
	        -- LSP Support
		    {'neovim/nvim-lspconfig'},
		    {'williamboman/mason.nvim'},
		    {'williamboman/mason-lspconfig.nvim'},

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},
		    {'hrsh7th/cmp-buffer'},
		    {'hrsh7th/cmp-path'},
		    {'saadparwaiz1/cmp_luasnip'},
		    {'hrsh7th/cmp-nvim-lsp'},
		    {'hrsh7th/cmp-nvim-lua'},

		    -- Snippets
		    {'L3MON4D3/LuaSnip'},
		    {'rafamadriz/friendly-snippets'},
	    }
    }

    -- yuck file support
    use 'elkowar/yuck.vim'

end)
