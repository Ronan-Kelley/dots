-- list of plugins
vim.pack.add({
    -- colorscheme
    'https://github.com/folke/tokyonight.nvim',
    -- git gutters
    'https://github.com/lewis6991/gitsigns.nvim',
    -- builtin git client
    'https://github.com/tpope/vim-fugitive',
    -- file manager
    'https://github.com/stevearc/oil.nvim',
    -- statusline
    'https://github.com/nvim-lualine/lualine.nvim',
    -- tabline
    'https://github.com/nanozuki/tabby.nvim',
    -- treesitter & textobjects
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    -- telescope
    'https://github.com/nvim-lua/plenary.nvim',
    { src = 'https://github.com/nvim-telescope/telescope.nvim', version = "v0.2.2" },
    -- -- completion engine and snippets
    { src = 'https://github.com/L3MON4D3/LuaSnip', version = 'v2.5.0' }, -- no effort to install jsregexp,
                                                                         -- because I don't care about it.
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') }, -- pinned to 1.x so I don't have to
                                                                                         -- worry about blink.lib right now.
    -- LSP notifications
    'https://github.com/j-hui/fidget.nvim',
    -- a bunch of lsp definitions
    { src = 'https://github.com/neovim/nvim-lspconfig', version = vim.version.range('2.x') },
    -- confirmation before doing quitall
    { src = 'https://github.com/yutkat/confirm-quit.nvim', version = 'a1dbd9b553e8d6770cd6a879a3ee8ffad292c70c' }
})

-- either a table of plugin name and plugin config,
-- or just the plugin name. Not all plugins need to have setup()
-- called on them, and I've found no rhyme or reason to it.
local plugins = {
    { 'tokyonight', {
        hide_inactive_statusline = true,
        style = 'night',
        terminal_color = true,
        transparent = false }},
    { 'gitsigns', {
        diff_opts = { vertical = true } }},
    'oil',
    'lualine',
    'tabby',
    { 'blink.cmp', {
        keymap = {
            preset = "none",
            ["<C-space>"] = {"select_and_accept", "fallback"},
            ["<C-y>"] = {"show", "show_documentation", "hide_documentation"},
            ["<Up>"] = {"select_prev", "fallback"},
            ["<Down>"] = {"select_next", "fallback"},
            ["<C-p>"] = {"select_prev", "fallback"},
            ["<C-n>"] = {"select_next", "fallback"},
            ["<C-b>"] = {"scroll_documentation_up"},
            ["<C-f>"] = {"scroll_documentation_down"},
            ["<C-k>"] = {"show_signature", "hide_signature", "fallback"}
        },
        -- make sure you have a nerd font installed; I'm partial to the
        -- no-ligature variant of jetbrain's font with nerd symbols added
        appearance = {nerd_font_variant = "mono"},
        completion = {documentation = {auto_show = false}},
        sources = {default = {"lsp", "path", "snippets", "buffer"}},
        snippets = {preset = "luasnip"},
        fuzzy = {implementation = "prefer_rust_with_warning"}
    }},
    'fidget',
    { 'confirm-quit', {
        overwrite_q_command = false,
        quit_message = 'quit all?'
    }},
}

-- setup all the plugins
for _, plugin in ipairs(plugins) do
    if type(plugin) == "table" then
        require(plugin[1]).setup(plugin[2])
    else
        require(plugin).setup()
    end
end

-- load more extensive plugin configuration
require('plugins.plugin-configs')
-- tell luasnip to load snippets
require ('luasnip.loaders.from_lua').load({ paths = './lua/snippets' })

-- install autocommand to handle plugin updates
vim.api.nvim_create_autocmd('PackChanged', { callback = function (ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    -- automatically update treesitter
    if name == 'nvim-treesitter' and kind == 'update' then
        if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
        vim.cmd('TSUpdate')
    end
end })
