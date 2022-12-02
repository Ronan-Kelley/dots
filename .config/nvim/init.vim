set nocompatible
"""""""""""""""""""""""""
"      vim plugged      "
"""""""""""""""""""""""""
" ensure it is downloaded!! (shell script)
" [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share/}"/nvim/site/autoload/plug.vim ] && curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

filetype plugin indent on

" call vim plugged init
call plug#begin()
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'lewis6991/impatient.nvim'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'lervag/vimtex'
call plug#end()

""""""""""""""""""""""""""""""""""
"      plugin configuration      "
""""""""""""""""""""""""""""""""""
" FixCursorHold.nvim
let g:cursorhold_updatetime = 100 " in milliseconds
" coc.nvim
source ~/.config/nvim/init-coc.vim
" vimtex
source ~/.config/nvim/init-vimtex.vim

""""""""""""""""""""""
"      keybinds      "
""""""""""""""""""""""
" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 'magic' search
nnoremap / /\v

" ctrl+s disables highlight from search
nnoremap <C-s> :nohl<CR>

" shortcuts for @@/@:
nnoremap ` @@
nnoremap ~ @:

"""""""""""""""""""""""""""
"      misc settings      "
"""""""""""""""""""""""""""
" line numbers
set number relativenumber

" tab style
set tabstop=4
set shiftwidth=4
set expandtab

" splitting behavior
set splitbelow
set splitright

" case sensitivity for searches
set ignorecase
set smartcase

"""""""""""""""""""""
"      aliases      "
"""""""""""""""""""""
command! -nargs=0 Clean :call Clean()
command! -nargs=0 Resource :source ~/.config/nvim/init.vim

"""""""""""""""""""""""
"      functions      "
"""""""""""""""""""""""
" removes trailing whitespace
function Clean()
    %s/\v\t+$//ge | %s/\v^\n\n+$//ge | %s/\v\s+$//ge | nohl
endfunction

""""""""""""""""""""""""
"      appearance      "
""""""""""""""""""""""""
" enable truecolor
set termguicolors

" theme settings
let g:tokyonight_style = "storm"
let g:tokyonight_hide_inactive_statusline = 1

" enable syntax highlighting
syntax on

" enable theme
colorscheme tokyonight
