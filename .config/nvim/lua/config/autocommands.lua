-- automatically reload waybar on config edit
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { vim.fn.expand("~/dots/.config/waybar/") .. "*" },
    callback = function ()
        vim.system( { "killall", "-SIGUSR2", "waybar" }, { text = true })
        return false
    end})

    -- automatically stop lsp in C environments when compile commands is missing
vim.api.nvim_create_autocmd({ 'LspAttach' }, {
    pattern = { '*.c', '*.h' },
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and vim.fn.filereadable('compile_commands.json') == 0 then
            client:stop()
        end
    end
})
