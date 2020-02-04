set clipboard=unnamed
filetype plugin indent on
syntax on
colorscheme monokai
set nu
set smartindent
set tabstop=4 shiftwidth=4 expandtab

" =============================================================
" Syntastic recommended: https://vimawesome.com/plugin/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" =============================================================
" command to change indention: 2 => 4
" %s;^\(\s\+\);\=repeat('    ', len(submatch(0))/2);g
