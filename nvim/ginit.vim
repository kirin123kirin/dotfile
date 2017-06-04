" フォント設定:
"
if IsWindows()
  " Windows用
  GuiFont! FixedSys:h12
  set linespace=1
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif IsMac()
  let g:Guifont='Osaka－等幅:h14'
elseif has('xfontset')
  let g:Guifont='a14,r14,k14'
endif

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=Purple guifg=NONE
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
set mouse=a
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
"set guioptions+=a

"---------------------------------------------------------------------------
" メニューに関する設定:
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif
