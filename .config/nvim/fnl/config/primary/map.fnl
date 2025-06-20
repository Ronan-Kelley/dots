; quick open netrw
(vim.keymap.set "n" "<leader>pv" vim.cmd.Ex)

; visual block shifting
(vim.keymap.set "v" "H" "<gv")
(vim.keymap.set "v" "J" ":m '>+1<CR>gv=gv")
(vim.keymap.set "v" "K" ":m '<-2<CR>gv=gv")
(vim.keymap.set "v" "L" ">gv")

; pane navigation
(vim.keymap.set "n" "<C-h>" "<C-w>h")
(vim.keymap.set "n" "<C-j>" "<C-w>j")
(vim.keymap.set "n" "<C-k>" "<C-w>k")
(vim.keymap.set "n" "<C-l>" "<C-w>l")

; terminal pane navigation
(vim.keymap.set "t" "<C-h>" "<C-\\><C-N><C-h>")
(vim.keymap.set "t" "<C-j>" "<C-\\><C-N><C-j>")
(vim.keymap.set "t" "<C-k>" "<C-\\><C-N><C-k>")
(vim.keymap.set "t" "<C-l>" "<C-\\><C-N><C-l>")

; make currently loaded file executable
(vim.keymap.set "n" "<leader>x" "<cmd>!chmod +x %<CR>" { :silent true })

; return nothing
{}
