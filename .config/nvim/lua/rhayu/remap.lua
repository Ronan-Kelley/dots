-- make space the <leader> --
vim.g.mapleader = " "

-- quick open netrw --
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- visual block shifting --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- make currently loaded file executable --
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
