-- line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- misc
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- search defaults
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

-- scroll offset; always leave n lines visible above/below cursor
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
-- disable mouse input
vim.o.mouse = ''
vim.o.shell = 'zsh'

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- diagnostic window
vim.diagnostic.config = { 
    float = {
        border = 'rounded',
        focusable = false,
        header = '',
        prefix = '',
        source = 'always',
        style = 'minimal'
    }
}
