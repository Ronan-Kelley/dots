; automatically reload waybar on config edit
(vim.api.nvim_create_autocmd
  [ "BufWritePost" ]
  {
    :pattern [ (.. (vim.fn.expand "~/dots/.config/waybar/") "*") ]
    :callback (fn []
                (vim.system [ "killall" "-SIGUSR2" "waybar" ] { :text true })
                false) ; return false so we don't delete the autocommand
  })

; automatically disable lsp if there is no compile_commands.json
; and we're in a c file.
(vim.api.nvim_create_autocmd
  [ "LspAttach" ]
  {
    :pattern [ "*.c" "*.h" ]
    :callback (fn []
                (if (= (vim.fn.filereadable "compile_commands.json") 0)
                    (vim.cmd "LspStop"))
                false)
  })

; return nothing
{}
