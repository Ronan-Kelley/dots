require('config')
require('plugins')

vim.cmd.colorscheme('tokyonight')

-- try to source a local_only file/directory if it exists
pcall(require, 'local_only')
