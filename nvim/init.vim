set encoding=UTF-8
" https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons' " https://vi.stackexchange.com/questions/22880/vim-devicons-not-working-at-all/22885#22885

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" https://sharksforarms.dev/posts/neovim-rust/
" Collection of common configurations for the Nvim LSP client
" Plug "williamboman/nvim-lsp-installer" " https://github.com/williamboman/nvim-lsp-installer
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

"" Vim-Session
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

Plug 'tomtom/tcomment_vim'

Plug 'alx741/vim-rustfmt'
Plug 'mhinz/vim-crates'

Plug 'tpope/vim-abolish'

" https://github.com/ziglang/zig.vim
" Plug 'ziglang/zig.vim'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" https://github.com/chr4/nginx.vim
Plug 'chr4/nginx.vim'

" https://github.com/cespare/vim-toml
Plug 'cespare/vim-toml', { 'branch': 'main' }

" https://github.com/hail2u/vim-css3-syntax
Plug 'hail2u/vim-css3-syntax'
" https://github.com/cakebaker/scss-syntax.vim
Plug 'cakebaker/scss-syntax.vim'


call plug#end()
" :PlugInstall to install plugins
" or nvim +PlugInstall from command line
"

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme dracula

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
" let g:NERDTreeIgnore = []
" let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with Shift Escape
tnoremap <Esc><Esc> <C-\><C-n>
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+b
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-b> :call OpenTerminal()<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
 
" :help clipboard
set clipboard+=unnamedplus

" https://sharksforarms.dev/posts/neovim-rust/
syntax enable
filetype plugin indent on

" https://sharksforarms.dev/posts/neovim-rust/
" >>>
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
lua require'lspconfig'.rust_analyzer.setup({})

" https://github.com/neovim/nvim-lspconfig#rust_analyzer
" lua <<EOF
"
" -- nvim_lsp object
" local nvim_lsp = require'lspconfig'
"
" -- function to attach completion when setting up lsp
" local on_attach = function(client)
"     require'completion'.on_attach(client)
" end
"
" -- Enable rust_analyzer
" nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
"
" -- Enable diagnostics
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"   vim.lsp.diagnostic.on_publish_diagnostics, {
"     virtual_text = true,
"     signs = true,
"     update_in_insert = true,
"   }
" )
" EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" # ------ did try to fix deprecated warning of above line:
" autocmd CursorHold * lua vim.diagnostic.open_float()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Enable type inlay hints
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
"\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" <<<
 
"https://gist.github.com/prkstaff/a8d9ab54318e462f0321444bba472504
" >>>
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

" session management
"let g:session_directory = "~/.config/nvim/session"
"let g:session_autoload = "no"
"let g:session_autosave = "no"
"let g:session_command_aliases = 1
"nnoremap <leader>so :OpenSession<Space>
"nnoremap <leader>ss :SaveSession<Space>
"nnoremap <leader>sd :DeleteSession<CR>
"nnoremap <leader>sc :CloseSession<CR>

"" Visual Settings
syntax on
set ruler
set number

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
" vmap < <gv
" vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" <<<

" https://stackoverflow.com/questions/65350712/what-is-set-mouse-a-for-in-nvim/65352148#65352148
set mouse=a

" https://serverfault.com/questions/390757/how-to-set-vim-filetype-when-editing-nginx-config-files/
au BufRead,BufNewFile include.conf set syntax=nginx ft=nginx

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

" https://neovim.discourse.group/t/avoid-navigating-in-show-line-diagnostics-window/605
" autocmd CursorHold <buffer> lua vim.diagnostic.show_line_diagnostics({ focusable = false })
" vim.cmd("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })")
" nmap <leader>ln  <cmd>lua vim.diagnostic.goto_next({enable_popup= false})<CR>
" nmap <leader>ln  <cmd>lua vim.diagnostic.close()<CR>
