require('config')
require('plugins')
-- temporary workaround for https://github.com/neovim/neovim/issues/38302
require('config.lsp')

vim.cmd.colorscheme('tokyonight')

-- try to source a local_only file/directory if it exists;
-- this is better than using pcall because if the file exists
-- and requiring it causes errors, pcall will silently fail in the
-- same way it would if the file didn't exist.
for _, searcher in ipairs(package.loaders) do
    -- try to get a load function for 'local_only'
    local loader = searcher('local_only')
    if type(loader) == 'function' then
        -- we got a function; use it as preload so we don't
        -- redo the search when we require it
        package.preload['local_only'] = loader
        require('local_only')

        break
    end
end
