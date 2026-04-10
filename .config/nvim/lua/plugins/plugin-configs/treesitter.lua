local treesitter_ftypes = { 'lua', 'rust', 'c', 'scheme', 'ruby' }

require('nvim-treesitter').install(treesitter_ftypes)

-- enable treesitter on all supported filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = treesitter_ftypes,
    callback = function() vim.treesitter.start() end
})
