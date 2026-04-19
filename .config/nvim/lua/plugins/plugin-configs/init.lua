-- automatically load all of the lua files in this directory

-- get the path of this file; probably a better way to do this
local info = debug.getinfo(1, 'S')
local module_directory = info.source:match('^@(.*)/')
local module_filename = info.source:match('/([^/]*)$')
-- ellipses are set to module name on require
local module_name = ... or 'plugins.plugin-configs'

local files_to_load = {}
-- scan the module directory for loadable files
for file, type in vim.fs.dir(module_directory) do
    -- only include regular files that have a .lua extension
    -- and are not this file
    if type == 'file' and file ~= module_filename and file:match('.lua$') then
        -- uncomment to see what files are being loaded
        -- print(vim.inspect(file))

        table.insert(files_to_load, file)
    end
end

-- could load as we find, but I'd rather load all at once
for _, file in ipairs(files_to_load) do
    require(module_name .. '.' .. file:gsub('.lua$', ''))
end
