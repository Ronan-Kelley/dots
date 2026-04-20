local lsps = {
    'lua_ls',
    'clangd',
    'rust_analyzer',
    'ty',
    'ruff'
}

for _, name in ipairs(lsps) do
    vim.lsp.enable(name)
end
