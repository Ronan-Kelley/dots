local oil = require('oil')
local gsigns = require('gitsigns')
local tscope_bltn = require('telescope.builtin')

local maps = {
    -- oil
    { 'n', '-', function() oil.toggle_float() end },
    -- gitsigns
    { 'n', '<leader>hn', function() gsigns.nav_hunk('next') end },
    { 'n', '<leader>hN', function() gsigns.nav_hunk('prev') end },
    { 'n', '<leader>hp', gsigns.preview_hunk_inline },
    { 'n', '<leader>hP', gsigns.preview_hunk },
    { { 'n', 'v' }, '<leader>hs', gsigns.stage_hunk },
    { { 'n', 'v' }, '<leader>hr', gsigns.reset_hunk },
    { { 'n', 'v' }, '<leader>hb', gsigns.blame },
    -- use a count to change between comparison bases for git gutters
    { 'n', '<leader>cb', function()
        if vim.v.count ~= 0 then
            gsigns.change_base("~" .. vim.v.count)
        else
            gsigns.change_base("HEAD")
        end
    end},
    -- telescope
    { 'n', '<leader>tb',  tscope_bltn.buffers },
    { 'n', '<leader>tf',  tscope_bltn.find_files },
    { 'n', '<leader>tF',  function() tscope_bltn.find_files{ hidden = true, no_ignore = true, no_ignore_parent = true } end },
    { 'n', '<leader>ts',  tscope_bltn.live_grep },
    { 'n', '<leader>tS',  function() tscope_bltn.live_grep{ additional_args = { '--no-ignore', '--hidden' }} end },
    { 'n', '<leader>tt',  tscope_bltn.tags },
    { 'n', '<leader>tr',  tscope_bltn.resume },
    { 'n', '<leader>tgc', tscope_bltn.git_commits },
    { 'n', '<leader>tgb', tscope_bltn.git_branches },
    { 'n', '<leader>tgs', tscope_bltn.git_status },
}

-- assign maps
for _, v in ipairs(maps) do
    vim.keymap.set(v[1], v[2], v[3])
end
