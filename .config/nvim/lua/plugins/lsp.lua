-- [nfnl] fnl/plugins/lsp.fnl
local function _1_(_, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
  require("fidget").setup({})
  require("mason").setup()
  local function _2_(server_name)
    return require("lspconfig")[server_name].setup({capabilities = capabilities})
  end
  local function _3_()
    local lspconfig = require("lspconfig")
    return lspconfig.fennel_language_server.setup({settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  end
  require("mason-lspconfig").setup({ensure_installed = {"lua_ls"}, handlers = {_2_, fennel_language_server = _3_}})
  vim.diagnostic.config({float = {border = "rounded", header = "", prefix = "", source = "always", style = "minimal", focusable = false}})
  return require("luasnip.loaders.from_lua").load({paths = "./lua/snippets"})
end
return {{"saghen/blink.cmp", dependencies = {{"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp"}}, opts = {keymap = {preset = "none", ["<C-space>"] = {"select_and_accept", "fallback"}, ["<C-y>"] = {"show", "show_documentation", "hide_documentation"}, ["<Up>"] = {"select_prev", "fallback"}, ["<Down>"] = {"select_next", "fallback"}, ["<C-p>"] = {"select_prev", "fallback"}, ["<C-n>"] = {"select_next", "fallback"}, ["<C-b>"] = {"scroll_documentation_up"}, ["<C-f>"] = {"scroll_documentation_down"}, ["<Tab>"] = {"snippet_forward", "fallback"}, ["<S-Tab>"] = {"snippet_backward", "fallback"}, ["<C-k>"] = {"show_signature", "hide_signature", "fallback"}}, appearance = {nerd_font_variant = "mono"}, completion = {documentation = {auto_show = false}}, sources = {default = {"lsp", "path", "snippets", "buffer"}}, snippets = {preset = "luasnip"}, fuzzy = {implementation = "prefer_rust_with_warning"}}, version = "1.*"}, {"neovim/nvim-lspconfig", dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", {"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp"}, "j-hui/fidget.nvim"}, opts = {servers = {lua_ls = {}}}, config = _1_}, {"folke/trouble.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, opts = {}, cmd = "Trouble", keys = {{"<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"}, {"<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>"}}}}
