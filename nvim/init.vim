" set shellslash
if &compatible
  set nocompatible
endif

" reset
augroup MyAutoCmd
	autocmd!
augroup END

" env
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : expand($XDG_CACHE_HOME)
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config/nvim') : expand($XDG_CONFIG_HOME.'/nvim')
let g:rc_dir = expand(g:config_home . '/rc')

let g:python3_host_prog = 'python'
" Common functions {{{
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



" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
if has('vim_starting') && &encoding !=# 'utf-8'
  if IsWindows() && !has('gui_running')
    set encoding=cp932
  else
    set encoding=utf-8
  endif
endif

" Build encodings.
let &fileencodings = join([ 'ucs-bom', 'iso-2022-jp-3', 'utf-8', 'euc-jp', 'cp932'])

" Setting of terminal encoding.
if !has('gui_running') && IsWindows()
  " For system.
  set termencoding=cp932
endif

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

" Use Japanese interface.
language message ja_JP

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Release keymappings for plug-in.
nnoremap ;  <Nop>
nnoremap m  <Nop>
nnoremap ,  <Nop>

call s:source_rc('filetype.vim')


" }}}

" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'
let g:dein#install_max_processes = 4
let g:dein#install_message_type = 'none'
let g:dein#enable_name_conversion = 1
let g:dein#enable_notification = 1

if &runtimepath !~# '/dein.vim'
	let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
	endif
	execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_cache_dir)
	call dein#add('Shougo/dein.vim')

	call dein#begin(s:dein_cache_dir)
		call dein#load_toml(g:config_home . '/dein.toml', {'lazy': 0})
		call dein#load_toml(g:config_home . '/deinlazy.toml', {'lazy': 1})
		if has('nvim')
			call dein#load_toml(g:config_home . '/deineo.toml', {})
		endif

		if dein#tap('deoplete.nvim') && has('nvim')
		  call dein#disable('neocomplete.vim')
		endif
		call dein#disable('neobundle.vim')
		call dein#disable('neopairs.vim')

	call dein#end()
	call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
	call dein#install()
endif

" }}}


filetype plugin indent on

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

	"if has('nvim') && has('gui_running')
		call s:source_rc('gui.rc.vim')
	"endif

call s:source_rc('command.vim')
