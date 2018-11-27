" OreVimrc
" Global Setting
set nocompatible

let mapleader = "\<Space>"
let maplocalleader = ","

" reset
augroup MyAutoCmd
    autocmd!
augroup END

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -u -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -u -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

augroup AllwaysTabOpen
  autocmd!
  let b:flg = 1
  autocmd BufReadPre */doc/*.txt let b:flg =0
  autocmd BufReadPost * if b:flg | tab ba | endif
augroup END

" OS Type
function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
function! WINDOWS()
    return (has('win16') || has('win32') || has('win64'))
endfunction
function! OSX()
    return has('macunix')
endfunction

colorscheme wombat256mod
highlight Search term=reverse cterm=bold ctermfg=0 ctermbg=14 guifg=Black guibg=Cyan gui=bold
highlight IncSearch term=reverse cterm=bold ctermfg=0 ctermbg=14 guifg=Black guibg=Cyan gui=bold
highlight MatchParen term=reverse ctermfg=0 ctermbg=14 guifg=Black guibg=Cyan
highlight ColorColumn term=reverse ctermfg=0 ctermbg=224 guifg=Black guibg=LightRed
highlight SpellRare term=reverse ctermfg=0 ctermbg=225 guifg=Black guibg=Magenta
highlight SpellBad term=reverse ctermfg=0 ctermbg=224 guifg=Black guibg=Red
highlight DiffChange term=reverse ctermfg=0 ctermbg=225 guifg=Black guibg=LightMagenta
highlight Directory term=bold cterm=bold ctermfg=2 guifg=green3 gui=bold

"highlight Normal ctermbg=none
" filetype on
filetype plugin indent on
" syntax on
set timeout timeoutlen=200 ttimeoutlen=50
set noautochdir
set foldopen=all
set nofoldenable
set history=10000
set number
set norelativenumber
set splitbelow
set splitright
set t_Co=256
set t_ut=
set cmdheight=2
set laststatus=2
set showtabline=2
set nowritebackup
set nobackup
set noswapfile
set hidden
set lazyredraw
set ttyfast
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set shiftround
set cinkeys-=:
set showmatch matchtime=1
set sidescrolloff=12
set scrolloff=8
set sidescroll=1
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set nowrap
set wildmenu
set backspace=indent,eol,start whichwrap+=<,>,[,]
set virtualedit+=block
set vb t_vb=
set noerrorbells
set autoread
if has('gui_running')
    set mouse=a
    set mouseshape=i:beam
    set termguicolors
    set completeopt=menu,menuone,noselect
    
    " Menu setting
    set guioptions=gtme
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif
set completeopt-=preview
set pumheight=15
"set list listchars=tab:>-,trail:-,space:.
if exists('+emo')
    set emoji
endif

if exists('+fixeol')
    set nofixendofline
endif

inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
if has('multi_byte')
    set iminsert=0 imsearch=0
endif

" <Esc><Esc>: ハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

set maxmem=1000000
set maxmempattern=1000000
set maxmemtot=1000000
if has('gvim')
    set ambiwidth=auto
endif
set nocursorline

" エンコードの設定
if has('vim_starting') && &encoding !=# 'utf-8'
    if WINDOWS() && !has('gui_running')
        let &termencoding = &encoding
        set encoding=cp932
    else
        let &termencoding = &encoding
        set encoding=utf-8
    endif
endif

function! s:ReCheck_FENC() abort
    let is_multi_byte = search("[^\x01-\x7e]", 'n', 100, 100)
    if &fileencoding =~# 'iso-2022-jp' && !is_multi_byte
        let &fileencoding = &encoding
    endif
endfunction

autocmd MyAutoCmd BufReadPost * call s:ReCheck_FENC()

" Build encodings.
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac

" Command group opening with a specific character code again."{{{
" In particular effective when I am garbled in a terminal.
" Open in UTF-8 again.
command! -bang -bar -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
" Open in iso-2022-jp again.
command! -bang -bar -complete=file -nargs=? Iso2022jp edit<bang> ++enc=iso-2022-jp <args>
" Open in Shift_JIS again.
command! -bang -bar -complete=file -nargs=? Cp932 edit<bang> ++enc=cp932 <args>
" Open in EUC-jp again.
command! -bang -bar -complete=file -nargs=? Euc edit<bang> ++enc=euc-jp <args>
" Open in UTF-16 again.
command! -bang -bar -complete=file -nargs=? Utf16 edit<bang> ++enc=ucs-2le <args>
" Open in latin1 again.
command! -bang -bar -complete=file -nargs=? Latin edit<bang> ++enc=latin1 <args>

" Tried to make a file note version.
command! WUtf8 setlocal fenc=utf-8
command! WCp932 setlocal fenc=cp932
command! WLatin1 setlocal fenc=latin1

" Appoint a line feed.
command! -bang -complete=file -nargs=? WUnix write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WDos write<bang> ++fileformat=dos <args> | edit <args>

" クリップボード連携
if has('unnamedplus') && !WINDOWS()
    if has('autoselectplus')
        set clipboard=unnamedplus,autoselectplus
    else
        set clipboard=unnamedplus,autoselect
    endif
else
    set clipboard=unnamed,autoselect
endif

" 自動でプレビューウィンドウを閉じる
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" qfというファイルタイプの時にバッファに名前をつける
autocmd! FileType qf :file locationlist
" grepした後に自動で検索結果画面を出す
autocmd! QuickfixCmdPost *grep* cwindow
" 検索時に検索したワードが画面中央に来るように
noremap n nzzzv
noremap N Nzzzv

cabbr w!! w !sudo tee > /dev/null %
noremap <Leader>so :source expand('<sfile>:p')<CR>

" 自然な正規表現検索にするため
nnoremap / /\v

" {{{ Useful Search and Replace
" word Highlight
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" word Replacement
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
" for Visual mode
xnoremap <silent> <Space> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap # <Space>:%s/<C-r>///g<Left><Left>

function! s:set_vsearch()
    silent normal gv"zy
    let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction
" }}}

" Auto Paste mode {{{ 
  if exists("g:loaded_bracketed_paste")
      finish
  endif
  let g:loaded_bracketed_paste = 1

  let &t_ti .= "\<Esc>[?2004h"
  let &t_te = "\e[?2004l" . &t_te

  function! XTermPasteBegin(ret)
      set pastetoggle=<f29>
      set paste
      return a:ret
  endfunction

  execute "set <f28>=\<Esc>[200~"
  execute "set <f29>=\<Esc>[201~"
  map <expr> <f28> XTermPasteBegin("i")
  imap <expr> <f28> XTermPasteBegin("")
  vmap <expr> <f28> XTermPasteBegin("c")
  cmap <f28> <nop>
  cmap <f29> <nop>
" }}}

" Ctags Management {{{ 
  " thanks. https://qiita.com/aratana_tamutomo/items/59fb4c377863a385e032
  set tags=.tags;$HOME

  function! s:execute_ctags() abort
    let tag_name = '.tags'
    let tags_path = findfile(tag_name, '.;')
    if tags_path ==# ''
      return
    endif

    let tags_dirpath = fnamemodify(tags_path, ':p:h')
    execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
  endfunction

  augroup ctags
    autocmd!
    autocmd BufWritePost * call s:execute_ctags()
  augroup END

  nnoremap <F11> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" }}}


" Plugins Management {{{

call plug#begin('~/.vim/plugged')
  Plug 'mechatroner/rainbow_csv'
  
  Plug 'itchyny/lightline.vim'
    let g:lightline = { 'colorscheme': 'wombat', }
  
  Plug 'rhysd/vim-gfm-syntax'
  
  Plug 'thinca/vim-quickrun'

  " Press v over and over again to expand selection
  Plug 'terryma/vim-expand-region'
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

  Plug 'tyru/caw.vim'
    imap <silent> <C-_> <ESC><Plug>(caw:zeropos:toggle)I
    nmap <silent> <C-_> <Plug>(caw:zeropos:toggle)
    vmap <silent> <C-_> <Plug>(caw:zeropos:toggle)

  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
    " {{{ Neosnipet User Snippet directory Setting
    imap <C-i>     <Plug>(neosnippet_expand_or_jump)
    smap <C-i>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-i>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    "imap <expr><TAB>
    " \ pumvisible() ? "\<C-n>" :
    " \ neosnippet#expandable_or_jumpable() ?
    " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif

    "set snippet file dir
    let g:neosnippet#snippets_directory='~/.vim/neosnippets/'
    " }}}

  " golang
  if executable("go")
    Plug 'fatih/vim-go'
    Plug 'nsf/gocode', {'rtp': 'vim/'}
      let g:go_fmt_command = "goimports"
      let g:go_auto_sameids = 1
  endif

  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
    let g:vim_markdown_folding_style_pythonic = 1
    " TableFormatはよく使うのでエイリアス
    :command TF TableFormat
    " list追加時のindentは行わない
    let g:vim_markdown_new_list_item_indent = 0

  if executable('fzf')
    Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'Fzf'
    if executable('rg')
      command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
    endif
    noremap <silent><F1> :FzfHelptags<CR>
    cnoremap <silent><F1> :FzfHelptags<CR>
    inoremap <silent><F1> <ESC>:FzfHelptags<CR>
    
    noremap <Leader>o :FZF<CR>
  endif
call plug#end()

" }}}

" Key Mapping Setting {{{
if LINUX()
    map <silent> <ESC>OA <UP>
    map <silent> <ESC>OB <DOWN>
    map <silent> <ESC>OC <RIGHT>
    map <silent> <ESC>OD <LEFT>
    map <silent> <ESC>[5~ <PageUp>
    map <silent> <ESC>[6~ <PageDown>
    imap <silent> <ESC>OA <UP>
    imap <silent> <ESC>OB <DOWN>
    imap <silent> <ESC>OC <RIGHT>
    imap <silent> <ESC>OD <LEFT>
    imap <silent> <ESC>[5~ <PageUp>
    imap <silent> <ESC>[6~ <PageDown>
    " set term=xterm
endif

"カーソル表示状態変更制御シーケンス
"ESC [ ? 25 h	カーソルを表示状態にする
"ESC [ ? 25 l	カーソルを非表示状態にする
"ESC [ 0 SP q	カーソル形状を箱型で点滅状態にする
"ESC [ 1 SP q	カーソル形状を箱型で点滅状態にする
"ESC [ 2 SP q	カーソル形状を箱型で点灯(非点滅)状態にする
"ESC [ 3 SP q	カーソル形状を下線で点滅状態にする
"ESC [ 4 SP q	カーソル形状を下線で点灯(非点滅)状態にする
"ESC [ 5 SP q	カーソル形状を縦線で点滅状態にする
"ESC [ 6 SP q	カーソル形状を縦線で点灯(非点滅)状態にする	ESC [ 33 h	カーソルを点灯(非点滅)状態にする
"ESC [ 33 l	カーソルを点滅状態にする
"ESC [ 34 h	カーソル形状を下線にする
"ESC [ 34 l	カーソル形状を箱型にする
"ESC [ ? 12 l	カーソルを点灯(非点滅)状態にする
"ESC [ ? 12 h	カーソルを点滅状態にする

"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"---------------------------------------------------------------------------

" windowsライクなバインドに
" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" 削除キーでyankしない
nnoremap x "_x
"nnoremap d "_d
"nnoremap D "_D

" backspace in Visual mode deletes selection
noremap <nowait> <BS> hx
noremap <nowait> ^? hx
noremap! <nowait> ^? ^H
noremap <C-z> <NOP>
noremap <C-x> <NOP>
noremap <C-c> <NOP>
noremap <C-v> V
inoremap <C-v> <NOP>

if has('clipboard')
    " CTRL-X are Cut
    noremap <C-x> "*x

    " CTRL-C and CTRL-Insert are Copy
    noremap <C-c> "*y

    " CTRL-V and SHIFT-Insert are Paste
    noremap <C-v>		"*gP
    inoremap <C-v>		<ESC>"*gP
    noremap <S-Insert>		<LEFT>"*gP
    inoremap <S-Insert>		<ESC><LEFT>"*gP
    cnoremap <C-v>		<C-R>*
    cnoremap <S-Insert>		<C-R>*

    " Mouse RightClick
    nnoremap <RightMouse> "*p
    inoremap <RightMouse> <C-r><C-o>*
else
    " CTRL-X are Cut
    noremap <C-x> ""x

    " CTRL-C and CTRL-Insert are Copy
    noremap <C-c> ""y

    " CTRL-V and SHIFT-Insert are Paste
    noremap <C-v>		""gP
    inoremap <C-v>		<ESC>""gP
    noremap <S-Insert>		<LEFT>""gP
    inoremap <S-Insert>		<ESC><LEFT>""gP
    cnoremap <C-v>		<C-R>"
    cnoremap <S-Insert>		<C-R>"

    " Mouse RightClick
    nnoremap <RightMouse> ""p
    inoremap <RightMouse> <C-r><C-o>"
endif

inoremap <C-q> <Esc>:q<CR>
noremap <C-q> :q<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-s>		:update<CR>
inoremap <C-s>		<ESC>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
    set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-LR is Next Tab
noremap <silent><Leader>h :tabp<CR>
noremap <silent><Leader>l :tabn<CR>

if has("gui")
" CTRL-F is the search dialog
    noremap <C-f> :promptrepl<CR>
    inoremap <C-f> <C-\><C-O>:promptrepl<CR>
    cnoremap <C-f> <C-\><C-C>:promptrepl<CR>

    " Alt-Space is System menu
    noremap <M-Space> :simalt ~<CR>
    inoremap <M-Space> <C-O>:simalt ~<CR>
    cnoremap <M-Space> <C-C>:simalt ~<CR>
endif


" Insert datetime Now
inoremap <silent><C-;> <C-R>=strftime('%Y/%m/%d')<CR>
inoremap <silent><C-:> <C-R>=strftime('%H:%M')<CR>
inoremap <silent><C-;>: <C-R>=strftime('%Y/%m/%d %H:%M')<CR>

" シフトで多めに移動
noremap J 20j
noremap K 20k
noremap L 10l
noremap H 10h

inoremap <C-J> <Down>
inoremap <C-K> <Up>

" 無効化
"nnoremap ZZ <Nop>
"nnoremap ZQ <Nop>
"nnoremap Q <Nop>
" }}}

" {{{ http://tamata78.hatenablog.com/entry/2015/10/15/214921
" ウィンドウ操作を楽にする設定
nnoremap <silent><S-A-Left> <C-w>J " 画面自体を左に移動
nnoremap <silent><S-A-Down> <C-w>K " 画面自体を下に移動
nnoremap <silent><S-A-Up> <C-w>L " 画面自体を上に移動
nnoremap <silent><S-A-Right> <C-w>H " 画面自体を右に移動
nnoremap <silent><A-Left>  <C-w><<CR>
nnoremap <silent><A-Right> <C-w>><CR>
nnoremap <silent><A-Up>    <C-w>-<CR>
nnoremap <silent><A-Down>  <C-w>+<CR>

"}}}

"タブ操作
nnoremap t <Nop>
nnoremap <silent> tt :<C-u>tabnew<CR>
nnoremap <silent> <C-n> :<C-u>tabnew<CR>
nnoremap <silent> tn :<C-u>tabprev<CR>
nnoremap <silent> tx :<C-u>tabclose<CR>
nnoremap <silent> td :<C-u>tabclose<CR>
nnoremap <silent> to :<C-u>tabonly<CR>
"nnoremap <silent> <C-PageDown> :<C-u>bnext<CR>
"nnoremap <silent> <C-PageUp> :<C-u>bprevious<CR>

" jj: エスケープ
inoremap jj <Esc>

" <Y>: 行末までヤンク
nnoremap Y y$

" 編集を楽にする
inoremap <silent><C-d> <ESC>yypi
noremap <silent><C-d> yyp

noremap <silent> <S-TAB> <<lh
noremap <silent> <TAB> >>lh
inoremap <silent> <S-TAB> <C-O><<
inoremap <silent> <TAB> <C-O>>>

" Insert Blank Line
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>
nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z

" Move Lines
nnoremap <C-k> "zdd<Up>"zP
nnoremap <C-j> "zdd"zp
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]

" Space Settings
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nmap <Leader>b :make<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>y :!annotate expand('%:p') " what?

vnoremap <silent> y y`]
vnoremap <silent> p p`]

nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" }}}

