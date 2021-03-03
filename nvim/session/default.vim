" ~/.config/nvim/session/default.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 03 марта 2021 at 11:31:53.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'dracula' | colorscheme dracula | endif
call setqflist([])
let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +10 cloudpayments/src/rust/Cargo.toml
badd +10012 term://~/cloudpayments/src/rust//2815:bash
badd +19 cloudpayments/src/rust/cloudpayments/Cargo.toml
badd +21 cloudpayments/src/rust/some/Cargo.toml
badd +105 cloudpayments/src/rust/some/src/main.rs
badd +1 cloudpayments/src/rust/cloudpayments/src/main.rs
badd +163 cloudpayments/src/rust/common_macros/src/lib.rs
badd +62 .config/nvim/init.vim
badd +44 cloudpayments/src/rust/billing/src/lib.rs
badd +53 dotfiles/setup.txt
badd +1 cloudpayments/src/sql/billing/stable/billing-stable.sql
badd +9 cloudpayments/src/sql/billing/alpha/billing-alpha.sql
badd +1302 cloudpayments/src/rust/common_macros/src/op.rs
badd +5 cloudpayments/src/rust/common_macros/Cargo.toml
badd +1 cloudpayments/src/rust/common_macros/src/will_did.rs
badd +4 cloudpayments/src/rust/common_macros/src/config.rs
badd +2 cloudpayments/src/rust/common_macros/src/fetch_json.rs
badd +429 cian_mirror/src/rust/cian_dip/src/main.rs
badd +97 cian_mirror/src/rust/common_macros/src/lib.rs
badd +6 cian_mirror/src/rust/cian_dip/Cargo.toml
badd +1330 cian_mirror/src/rust/common_macros/src/op.rs
badd +5 cian_mirror/src/rust/common_macros/Cargo.toml
badd +94 cian_mirror/src/rust/common_macros/src/fetch_json.rs
badd +289 cian_mirror/src/rust/cian_dip/src/dip_queue_msg.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/check_ack.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/check_consume.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/db.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/delay.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/dip_publish.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/follow_ack.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/follow_consume.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/op.rs
badd +1 cian_mirror/src/rust/cian_dip/src/obsolete/store.rs
badd +2 cian_mirror/src/rust/cian_dip/.gitignore
badd +3 cian_mirror/src/rust/.gitignore
badd +22 cian_mirror/.gitignore
badd +1 cian_mirror/src/rust/cian_dip/mirror-response.json
badd +16 cian_mirror/src/rust/cian_dip_follow_common/src/lib.rs
badd +34 cian_mirror/src/rust/rmq/src/lib.rs
badd +5 cian_mirror/src/rust/rmq/Cargo.toml
badd +2 cian_mirror/src/rust/clippy.sh
badd +12 cloudpayments/prod/cloudpayments/.env
badd +3 cloudpayments/src/rust/cloudpayments/src/obsolete/billing.rs
badd +1 cloudpayments/src/rust/cloudpayments/src/obsolete/delay.rs
badd +1 cloudpayments/src/rust/cloudpayments/src/obsolete/receive.rs
badd +61 cloudpayments/src/rust/billing/Cargo.toml
badd +4 cloudpayments/src/rust/billing/.env
badd +12 cloudpayments/src/rust/cloudpayments/.env
badd +2 cian_mirror/src/rust/Cargo.toml
badd +1 dotfiles/nvim/share/nvim/runtime/doc/ft_rust.txt
badd +8 cloudpayments/src/rust/cloudpayments/src/api.rs
badd +47 NERD_tree_2
badd +1 cloudpayments/src/rust/.rustfmt.toml
badd +2 cloudpayments/src/rust/cloudpayments/src/engine.rs
badd +1 cloudpayments/src/rust/cloudpayments/src/error.rs
badd +1 cloudpayments/src/rust/cloudpayments/src/handle.rs
badd +21 cloudpayments/src/rust/json/Cargo.toml
badd +147 wpoint/src/www/protected/modules/wbilling/views/payment/_form.php
badd +117 wpoint/src/www/protected/modules/wbilling/controllers/PaymentController.php
badd +278 wpoint/src/www/protected/modules/wbilling/models/forms/PaymentForm.php
badd +483 wpoint/src/www/protected/modules/billingcore/models/ar/Payment.php
badd +395 wpoint/src/www/protected/modules/wbilling/components/WbillingUrlManagerBehavior.php
badd +39 billing-gate/src/protected/modules/billingtask/controllers/PaymentProcessingController.php
badd +1 billing-gate/src/protected/modules/billingtask/BillingtaskModule.php
badd +1 billing-gate/src/protected/modules/billingtask/views/paymentProcessing/error.php
badd +1 billing-gate/src/protected/modules/billingtask/views/paymentProcessing/succes.php
badd +1 billing-gate/index.php
badd +34 billing-gate/src/index.php
badd +6 billing-gate/src/protected/modules/billingtask/controllers/PaymentController.php
badd +111 billing-gate/src/protected/modules/billingtask/controllers/ClientController.php
badd +6 billing-gate/src/protected/modules/billingtask/controllers/BaseController.php
badd +13 agate/server/datasources.alpha.json
badd +9 agate/server/config.stable.json
badd +1 agate/server/config.js
badd +3 agate/server/config.json
badd +1 agate/server/config.alpha.json
badd +8 agate/server/datasources.stable.json
badd +1 agate/server/datasources.json
badd +33 it-management/ansible/hosts
badd +18 cloudpayments/src/sql/agate/alpha/agate-alpha.sql
badd +0 cloudpayments/src/web/ui/index.html
argglobal
%argdel
set stal=2
tabnew
tabnew
tabnew
tabnew
tabrewind
edit cloudpayments/src/rust/billing/Cargo.toml
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 25 + 102) / 204)
exe 'vert 2resize ' . ((&columns * 88 + 102) / 204)
exe 'vert 3resize ' . ((&columns * 89 + 102) / 204)
argglobal
enew
" file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt cloudpayments/src/rust/billing/.env
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 33 - ((10 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 03|
wincmd w
argglobal
if bufexists("cloudpayments/src/rust/billing/src/lib.rs") | buffer cloudpayments/src/rust/billing/src/lib.rs | else | edit cloudpayments/src/rust/billing/src/lib.rs | endif
if &buftype ==# 'terminal'
  silent file cloudpayments/src/rust/billing/src/lib.rs
endif
balt cloudpayments/src/rust/billing/Cargo.toml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 44 - ((17 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 44
normal! 020|
wincmd w
exe 'vert 1resize ' . ((&columns * 25 + 102) / 204)
exe 'vert 2resize ' . ((&columns * 88 + 102) / 204)
exe 'vert 3resize ' . ((&columns * 89 + 102) / 204)
tabnext
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("term://~/cloudpayments/src/rust//2815:bash") | buffer term://~/cloudpayments/src/rust//2815:bash | else | edit term://~/cloudpayments/src/rust//2815:bash | endif
if &buftype ==# 'terminal'
  silent file term://~/cloudpayments/src/rust//2815:bash
endif
balt cloudpayments/src/rust/Cargo.toml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1569 - ((50 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1569
normal! 077|
tabnext
edit cloudpayments/src/web/ui/index.html
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 40 + 102) / 204)
exe 'vert 2resize ' . ((&columns * 163 + 102) / 204)
argglobal
enew
" file NERD_tree_2
balt billing-gate/index.php
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt cloudpayments/src/sql/agate/alpha/agate-alpha.sql
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 164 - ((50 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 164
normal! 07|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 102) / 204)
exe 'vert 2resize ' . ((&columns * 163 + 102) / 204)
tabnext
edit .config/nvim/init.vim
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 41 - ((40 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 41
normal! 0
tabnext
edit dotfiles/setup.txt
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt .config/nvim/init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 64 - ((50 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 64
normal! 0
tabnext 3
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/cloudpayments/src/rust
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 51|vert 1resize 25|2resize 51|vert 2resize 88|3resize 51|vert 3resize 89|
1wincmd w
tabnext 3
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/cloudpayments/src/rust
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 51|vert 1resize 40|2resize 51|vert 2resize 163|
2wincmd w
tabnext 3
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
