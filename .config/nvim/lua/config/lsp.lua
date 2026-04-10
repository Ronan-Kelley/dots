local lsps = {
    -- lua
    {"lua_ls", {
        filetypes = { 'lua' },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    }},
    -- C
    {"clangd", {
        -- without this, clangd wants to run on my lua files. I don't know why.
        filetypes = { 'c', 'cpp' },
        -- disable automatic header insertion because it doesn't play nice with
        -- the way we do unit tests at work
        cmd = {"clangd", "-header-insertion=never"}
    }},
    -- rust
    {"rust_analyzer", {
        filetypes = 'rust'
    }},
}

for _, lsp in ipairs(lsps) do
    local name = lsp[1]
    local config = lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end
