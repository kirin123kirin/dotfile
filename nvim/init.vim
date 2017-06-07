set nocompatible
set packpath=

" reset
augroup MyAutoCmd
    autocmd!
augroup END

" カーソル位置の復元
augroup restoreCursorPosition
  autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END

" env
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : expand($XDG_CACHE_HOME)
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config/nvim') : expand($XDG_CONFIG_HOME.'/nvim')
let g:rc_dir = expand(g:config_home . '/rc')
let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
    return s:is_windows
endfunction

function! IsMac() abort
  return !s:is_windows && !has('win32unix')
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \     || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

let g:loaded_gzip = 1

if IsWindows()
    let g:zip_unzipcmd='unzip.exe'
    let g:zip_zipcmd='zip.exe'
    if has('win64')
        let g:default_browser = 'C:/Program Files (x86)/Mozilla Firefox/firefox.exe'
    elseif has('win32')
        let g:default_browser = 'C:/Program Files/Mozilla Firefox/firefox.exe'
    endif
elseif IsMac()
    let g:default_browser = '/Applications/Firefox.app'
else
    let g:default_browser = 'firefox'
    let g:zip_unzipcmd='unzip'
    let g:zip_zipcmd='zip'
endif

" Dein
let s:dein_cache_dir = expand(g:cache_home . '/dein')
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

let g:python3_host_prog = 'python'

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

filetype plugin indent on

" global setting
" エディタの分割方向を設定する
set shellslash
set splitbelow
set splitright

" 色数の指定 (tmux上でもちゃんとしたカラースキームになるように)
" set t_Co=256

" シンタックスハイライトの設定
syntax on
colorscheme badwolf

"highlight Normal ctermbg=none

" 各種操作をした時に無駄にビープ音がならないように
set t_ut=

set cmdheight=2

" エスケープ後にすぐ入力できるように
set timeout timeoutlen=1000 ttimeoutlen=50

set nowritebackup
set nobackup
set noswapfile

" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden

" 外部でファイルに変更がされた場合は読みなおす
set autoread

" ファイル文末の改行を勝手に変更しない
if exists('+fixeol')
    set nofixendofline
endif

" カーソルLINEを表示しない
"set nocursorline

" 行数の絶対表示
set number
set norelativenumber

" デフォルトで保存するときの文字エンコード
if has('vim_starting') && &encoding !=# 'utf-8'
    if IsWindows() && !has('gui_running')
        set encoding=cp932
    else
        set encoding=utf-8
    endif
endif

" Build encodings.
set fileencodings=iso-2022-jp,euc-jp,sjis,cp932,utf-8

set fileformat=unix
set fileformats=unix,dos,mac
command! -bang -bar -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -bar -complete=file -nargs=? Iso2022jp edit<bang> ++enc=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Cp932 edit<bang> ++enc=cp932 <args>
command! -bang -bar -complete=file -nargs=? Euc edit<bang> ++enc=euc-jp <args>
command! -bang -bar -complete=file -nargs=? Utf16 edit<bang> ++enc=ucs-2le <args>
command! -bang -bar -complete=file -nargs=? Latin edit<bang> ++enc=latin1 <args>
command! WUtf8 setlocal fenc=utf-8
command! WCp932 setlocal fenc=cp932
command! WLatin1 setlocal fenc=latin1
command! -bang -complete=file -nargs=? WUnix write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WDos write<bang> ++fileformat=dos <args> | edit <args>

if has('multi_byte_ime')
    set iminsert=0 imsearch=0
endif

" スクロールの高速化
set lazyredraw
set ttyfast

" タブのスペースの数
set tabstop=4
set shiftwidth=4
" タブでスペースを使う
set expandtab
" 自動でインデントの調整smarttabよりこっちがいいらしい
"set smarttab
set cindent
" インデントをshiftwidthの倍数に固定
set shiftround
" コロンでインデントの再調整をしない
set cinkeys-=:

" カッコを入力した時に対応した括弧をハイライトする
set showmatch matchtime=1

" スクロールのオフセットを設定
set sidescrolloff=12
set scrolloff=8
set sidescroll=1

" 検索時設定
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrap
set gdefault

set mouse=a

set backspace=start,eol,indent
set virtualedit+=block
set laststatus=2
set vb t_vb=
set hidden
set autoread

" True Color用設定
"set termguicolors

" 補完時プレビューウィンドウを表示しない
"set completeopt-=preview
"set completeopt=preview,menu
"set pumheight=10

" 起動時処理
"autocmd! VimEnter * call Init()

" qfというファイルタイプの時にバッファに名前をつける
autocmd! FileType qf :file locationlist

" grepした後に自動で検索結果画面を出す
autocmd! QuickfixCmdPost *grep* cwindow

" 検索時に検索したワードが画面中央に来るように
noremap n nzzzv
noremap N Nzzzv


" vim上でGitを使うキーバインド設定
noremap <Space>gp :Gpush<CR>
noremap <Space>gc :Gcommit<CR>
noremap <Space>ga :write<CR>:Git add -A<CR>
noremap <Space>gv :Agit<CR>
noremap <Space>gs :Gstatus<CR>
noremap <Space>gf :Gitv!<CR>

" クリップボード連携
if has('unnamedplus') && !(has('win32') || has('win64'))
    set clipboard=unnamedplus,autoselectplus
else
    set clipboard=unnamed
endif

" if has('nvim') && has('clipboard')
"     map! <S-Insert> <C-R>+
" endif
"
" if IsWindows() && !has('clipboard')
"     nnoremap <silent> <Space>y :.w !win32yank.exe -i<CR><CR>
"     vnoremap <silent> <Space>y :w !win32yank.exe -i<CR><CR>
"     nnoremap <silent> <S-Insert> :r !win32yank.exe -o<CR>
"     vnoremap <silent> <S-Insert> :r !win32yank.exe -o<CR>
"     cnoremap <silent> <S-Insert> :r !win32yank.exe -o<CR>
"     nnoremap <silent> <Space>a :%w !win32yank.exe -i<CR><CR>
"
"     tnoremap <silent><expr> <Space>p Po()
"
"     function Po()
"       return system('win32yank.exe -o')
"     endfunction
"
"     tnoremap <silent><expr> <RightMouse> Po()
" endif

" 変更があった場合にファイル名の横に+を表示する
function! LightlineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

" 読み込み専用の場合の表示設定
function! LightlineReadonly()
    if &filetype == "help"
        return "help"
    elseif &readonly
        return "ro"
    else
        return ""
    endif
endfunction

" gitに管理されているファイルの場合ブランチ名を表示
function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" ファイル名の表示
function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" neovim用設定
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>

  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if has('gui_running')
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif


" View Setting
colorscheme badwolf
highlight CursorLine guibg=#E19972
set number
set cmdheight=2
set laststatus=2
set showtabline=2
set showmatch
set matchtime=1
set list
set listchars=tab:>-,trail:-
if exists('+emo')
	set emoji
endif
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]


 "-------------------------------------------------------------------------------
 " コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
 " map/noremap           @            -              -                  @
 " nmap/nnoremap         @            -              -                  -
 " imap/inoremap         -            @              -                  -
 " cmap/cnoremap         -            -              @                  -
 " vmap/vnoremap         -            -              -                  @
 " map!/noremap!         -            @              @                  -
 "---------------------------------------------------------------------------
let mapleader = "<Space>"

inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
 
 " カーソル移動.インサートモード
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap <C-;> <C-R>=strftime('%Y/%m/%d')<CR>
inoremap <C-:> <C-R>=strftime('%H:%M')<CR>
inoremap <C-;:> <C-R>=strftime('%Y/%m/%d %H:%M')<CR>

" シフトで多めに移動
noremap J 20j
noremap K 20k
noremap L 10l
noremap H 10h

" 無効化
map <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
"nnoremap ZZ <Nop>
"nnoremap ZQ <Nop>
"nnoremap Q <Nop>

" {{{ http://tamata78.hatenablog.com/entry/2015/10/15/214921
" ウィンドウ分割を楽にする設定
nnoremap s <Nop>
nnoremap ss :<C-u>split<CR> " 水平分割
nnoremap sv :<C-u>vsplit<CR> " 垂直分割
nnoremap sq :<C-u>q<CR> " ウィンドウを閉じる
nnoremap sQ :<C-u>bd<CR> " バッファを閉じる
nnoremap sj <C-w>j " 左に移動
noremap <A-Left> <C-w>h 
nnoremap sk <C-w>k " 下に移動
noremap <A-Down> <C-w>j
nnoremap sl <C-w>l " 上に移動
noremap <A-Up> <C-w>k
nnoremap sh <C-w>h " 右に移動
noremap <A-Right> <C-w>l
nnoremap sJ <C-w>J " 画面自体を左に移動
nnoremap sK <C-w>K " 画面自体を下に移動
nnoremap sL <C-w>L " 画面自体を上に移動
nnoremap sH <C-w>H " 画面自体を右に移動
nnoremap s> <C-w>> " 幅を増やす
nnoremap s< <C-w>< " 幅を減らす
nnoremap s+ <C-w>+ " 高さを増やす
nnoremap s- <C-w>- " 高さを減らす


"}}}

"タブ操作
nnoremap t <Nop>
nnoremap <silent> tt :<C-u>tabnew<CR>
nnoremap <silent> tn :<C-u>tabprev<CR>
nnoremap <silent> tx :<C-u>tabclose<CR>
nnoremap <silent> td :<C-u>tabclose<CR>
nnoremap <silent> to :<C-u>tabonly<CR>
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <S-tab> gt
nnoremap <tab><tab> gT

" <Esc><Esc>: ハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

" jj: エスケープ
imap jj <Esc>

" <Y>: 行末までヤンク
nnoremap Y y$

" + と - で数字を変化させる?
nnoremap + <C-a>
nnoremap - <C-x>

" <S-Insert>でクリップボード貼りつけ
noremap <silent> <S-Insert> <LEFT>"*p
inoremap<silent> <S-Insert> <C-r>*
cnoremap <S-Insert> <C-r>*

" QuickRun
noremap <silent> <F5> :QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix<CR>
noremap!<silent> <F5> <Esc>:QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix<CR>

" Denite
nmap <silent> <C-f> :<C-u>Denite file_rec<CR>
nmap <silent> <F3>  :<C-u>Denite line<CR>
nmap <silent> <C-F3> :<C-u>Denite grep<CR>
nmap <silent> <S-F3>:<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-h> :<C-u>Denite file_mru<CR>
nmap <silent> <C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <F1>  :<C-u>Denite help<CR>
nmap <silent> <F8>  :<C-u>Denite -resume<CR>
nmap <silent> <F9>  :<C-N>Denite -resume -immediately -select=+1<CR>
nmap <silent> <F10> :<C-P>Denite -resume -immediately -select=-1<CR>

" Unite
noremap <silent> <F11> <ESC>:UniteBookmarkAdd<CR>
noremap <silent> <F12> <ESC>:Unite bookmark -buffer-name=bookmark -vertical -winwidth=50 -start-insert<CR>
noremap! <silent> <F11> <ESC>:UniteBookmarkAdd<CR>
noremap! <silent> <F12> <ESC>:Unite bookmark -buffer-name=bookmark -vertical -winwidth=50 -start-insert<CR>
cnoremap <F11> UniteBookmarkAdd<CR>
cnoremap <F12> Unite bookmark -buffer-name=bookmark -vertical -winwidth=50 -start-insert<CR>
noremap <C-F12> <ESC>:Unite -buffer-name=outline -vertical -winwidth=50 outline<CR>
noremap! <C-F12> <ESC>:Unite -buffer-name=outline -vertical -winwidth=50 outline<CR>

" search
"nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-resize line<CR>

vnoremap <silent> > >gv
vnoremap <silent> < <gv

vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv
