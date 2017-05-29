"default
"for vimrc windows kaoriya vim80

set shellslash
if &compatible
  set nocompatible
endif

" reset
augroup MyAutoCmd
	autocmd!
augroup END

" env
let g:app_home = expand($APPROOT)
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:vim_dir = expand($VIM)
let g:conf_dir = g:vim_dir . '/vimfiles'
let g:rc_dir   = g:conf_dir . '/rc'
let g:no_vimrc_example = 1

" python3 http://tonkuma.hatenablog.com/entry/2016/12/24/060000#%E5%89%8D%E6%BA%96%E5%82%99
set runtimepath+=$VIM
set pythonthreedll=$PYTHONPATH/python35.dll
let g:python3_host_prog = 'python'

" common {{{
let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
  return s:is_windows
endfunction

function! IsMac() abort
  return !s:is_windows && !has('win32unix')
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \     || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

function! s:source_rc(path, ...) abort "{{{
	execute 'source ' . g:rc_dir . '/' . a:path
endfunction"}}}

if IsWindows()
	let g:default_browser  = 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
	if !filereadable(g:default_browser)
		let g:default_browser  = 'C:\Program Files\Mozilla Firefox\firefox.exe'
	endif
elseif IsMac()
	let g:default_browser  = '/Applications/Firefox.app'
else
	let g:default_browser  = 'firefox'
endif

" Release keymappings for plug-in.
nnoremap ;  <Nop>
nnoremap m  <Nop>
nnoremap ,  <Nop>

call s:source_rc('filetype.vim')
" }}}

" Dein {{{
let s:dein_dir = g:cache_home . '/dein'
let g:dein#install_max_processes = 8
let g:dein#install_message_type = 'none'
let g:dein#enable_name_conversion = 1
let g:dein#enable_notification = 1
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    "execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml      = g:conf_dir . '/dein.toml'
  let s:lazy_toml = g:conf_dir . '/deinlazy.toml'
  let s:neo_toml = g:conf_dir .  '/deineo.toml'
  
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  if has('nvim')
      call dein#load_toml(s:neo_toml , {'lazy': 1})
  endif
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

" }}}

filetype plugin indent on
syntax on

call s:source_rc('view.vim')
call s:source_rc('setting.vim')
	call s:source_rc('init.rc.vim')
	call s:source_rc('encoding.rc.vim')
	call s:source_rc('options.rc.vim')
call s:source_rc('keymap.vim')
	if has('nvim')
		call s:source_rc('neovim.rc.vim')
	endif
	if IsWindows()
		call s:source_rc('windows.rc.vim')
	else
		call s:source_rc('unix.rc.vim')
	endif

	if has('nvim') && has('gui_running')
		call s:source_rc('gui.rc.vim')
	endif

call s:source_rc('command.vim')
