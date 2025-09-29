(local util (require :util))

(let [options
       {
        ; line numbers
        :nu true

        ; relative line numbers
        :relativenumber true

        ; tabs
        :tabstop 4
        :softtabstop 4
        :shiftwidth 4
        :expandtab true
        :smartindent true

        :wrap false
        :swapfile false
        :backup false
        :undodir (.. (os.getenv "HOME") "/.vim/undodir")
        :undofile true

        ; search defaults
        :hlsearch false
        :incsearch true

        :termguicolors true
        
        ; scroll offset; always leave n lines visible above/below cursor
        :scrolloff 8

        :signcolumn :yes
        :mouse ""
        :shell :zsh
       }]
  (util.mapped-set vim.o options))

(let [options-global
       {
        ; netrw settings
        :netrw_browse_split 0
        :netrw_banner 0
        :netrw_winsize 25
       }]
  (util.mapped-set vim.g options-global))

; configure the diagnostic window
(vim.diagnostic.config {:float {:border :rounded
                                :focusable false
                                :header ""
                                :prefix ""
                                :source :always
                                :style :minimal}})

; return nothing
{}
