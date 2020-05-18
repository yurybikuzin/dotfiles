set clipboard=unnamed
filetype plugin indent on
syntax on
colorscheme monokai
set nu
set smartindent
set tabstop=4 shiftwidth=4 expandtab

set encoding=utf-8
set fileencoding=utf-8

" " Enable true color: https://github.com/tmux/tmux/issues/1246
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

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
 
 
" =============================================================
" vim-racer recommended: https://github.com/racer-rust/vim-racer
set hidden
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap gt <Plug>(rust-def-tab)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" =============================================================
" vim-plug
call plug#begin('~/.vim/plugged')

" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()
