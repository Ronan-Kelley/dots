-- automatically reload waybar on config edit
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = { vim.fn.expand("~/dots/.config/waybar/") .. "*" },
    callback = function()
        vim.system({'killall', '-SIGUSR2', 'waybar'}, { text = true })
    end,
})

-- automatically disable lsp if there is no compile_commands.json
-- and we're in a c file. If there is a compile_commands.json, bind
-- normal mode CTRL+SPACE to swap header/source
vim.api.nvim_create_autocmd({"LspAttach"}, {
    pattern = { "*.c", "*.h" },
    callback = function()
        if (vim.fn.filereadable("compile_commands.json") == 0)
        then
            vim.cmd([[LspStop]])
        else
            vim.keymap.set("n", "<C-space>", ":LspClangdSwitchSourceHeader<CR>")
        end
    end
})
