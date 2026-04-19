-- doing the folllowing:
-- vim.cmd('unabbreviate q')
-- should just unabbreviate q, but it also unabbreviates qa. I have no idea why.
-- in order to have just qall unabbreviated, this ugly mess is required:
vim.cmd [[
    function! s:solely_in_cmd(command)
        return (getcmdtype() == ':' && getcmdline() ==# a:command)
    endfunction
    cnoreabbrev <expr> qa <SID>solely_in_cmd('qa') ? 'ConfirmQuitAll' : 'qa'
]]
