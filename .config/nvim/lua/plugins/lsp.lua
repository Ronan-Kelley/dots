-- [nfnl] fnl/plugins/lsp.fnl
local function _1_(_, opts)
  opts.sources = (opts.sources or {})
  return table.insert(opts.sources, {group_index = 0, name = "lazydev"})
end
local function _2_()
  local cmp = require("cmp")
  require("fidget").setup({})
  require("mason").setup()
  local cmp_select = {behavior = cmp.SelectBehavior.Select}
  local function _3_(args)
    require("luasnip").lsp_expand(args.body)
    return require("luasnip").config.setup({enable_autosnippets = true})
  end
  cmp.setup({mapping = cmp.mapping.preset.insert({["<C-Space>"] = cmp.mapping.confirm({select = true}), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-n>"] = cmp.mapping.select_next_item(cmp_select), ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select), ["<CR>"] = cmp.mapping.confirm({select = false})}), snippet = {expand = _3_}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}}, {{name = "buffer"}})})
  require("luasnip.loaders.from_lua").load({paths = "./lua/snippets"})
  return require("config.lsp").setup()
end
return {{"hrsh7th/nvim-cmp", opts = _1_}, {"neovim/nvim-lspconfig", dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/nvim-cmp", {"L3MON4D3/LuaSnip", build = "make install_jsregexp"}, "saadparwaiz1/cmp_luasnip", "j-hui/fidget.nvim"}, config = _2_}, {"folke/trouble.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, opts = {}, cmd = "Trouble", keys = {{"<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"}, {"<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>"}}}}
