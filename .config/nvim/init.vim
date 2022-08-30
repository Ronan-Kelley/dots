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

" enable syntax highlighting
syntax on

" enable theme
colorscheme industry
