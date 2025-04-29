-- automatically reload waybar on config edit
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = { vim.fn.expand("~/dots/.config/waybar/") .. "*" },
    callback = function()
        vim.system({'killall', '-SIGUSR2', 'waybar'}, { text = true })
    end,
})
