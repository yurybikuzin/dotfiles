" https://stackoverflow.com/questions/17561706/vim-yank-does-not-seem-to-work/39313208#39313208
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
  set clipboard=unnamedplus "Linux
endif

set mouse=a

filetype plugin indent on
syntax on
colorscheme monokai
set nu
set smartindent
set tabstop=4 shiftwidth=4 expandtab

set encoding=utf-8
set fileencoding=utf-8
let mapleader=","

" " Enable true color: https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" if has('termguicolors')
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
" SaveSession
let g:session_autosave='no'

" =============================================================
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" =============================================================
" https://github.com/racer-rust/vim-racer
" Example Mappings
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END
