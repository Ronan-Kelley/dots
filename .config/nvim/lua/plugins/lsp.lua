-- [nfnl] fnl/plugins/lsp.fnl
local function _1_(_, opts)
  require("fidget").setup({})
  do
    local lsps = {{"lua_ls"}, {"clangd", {cmd = {"clangd", "-header-insertion=never"}}}, {"fennel_language_server", {cmd = {"fennel-ls"}, settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {libraries = vim.api.nvim_list_runtime_paths()}}}}}}
    for _0, lsp in pairs(lsps) do
      local name = lsp[1]
      local config = lsp[2]
      vim.lsp.enable(name)
      if config then
        vim.lsp.config(name, config)
      else
      end
    end
  end
  return require("luasnip.loaders.from_lua").load({paths = "./lua/snippets"})
end
return {{"saghen/blink.cmp", dependencies = {{"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp"}}, opts = {keymap = {preset = "none", ["<C-space>"] = {"select_and_accept", "fallback"}, ["<C-y>"] = {"show", "show_documentation", "hide_documentation"}, ["<Up>"] = {"select_prev", "fallback"}, ["<Down>"] = {"select_next", "fallback"}, ["<C-p>"] = {"select_prev", "fallback"}, ["<C-n>"] = {"select_next", "fallback"}, ["<C-b>"] = {"scroll_documentation_up"}, ["<C-f>"] = {"scroll_documentation_down"}, ["<Tab>"] = {"snippet_forward", "fallback"}, ["<S-Tab>"] = {"snippet_backward", "fallback"}, ["<C-k>"] = {"show_signature", "hide_signature", "fallback"}}, appearance = {nerd_font_variant = "mono"}, completion = {documentation = {auto_show = false}}, sources = {default = {"lsp", "path", "snippets", "buffer"}}, snippets = {preset = "luasnip"}, fuzzy = {implementation = "prefer_rust_with_warning"}}, version = "1.*"}, {"neovim/nvim-lspconfig", dependencies = {{"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp"}, "j-hui/fidget.nvim"}, config = _1_}, {"folke/trouble.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, opts = {}, cmd = "Trouble", keys = {{"<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"}, {"<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>"}}}}
