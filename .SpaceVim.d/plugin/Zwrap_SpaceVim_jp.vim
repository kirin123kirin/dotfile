" default.vim {{{
call SpaceVim#mapping#def('nnoremap <silent>','<M-x>',':call chat#qq#OpenMsgWin()<cr>',
        \ 'qq チャットルームを開く','call chat#chatting#OpenMsgWin()')
  call SpaceVim#mapping#def('nnoremap <silent>','<M-w>',':call chat#weixin#OpenMsgWin()<cr>',
        \ 'weixn チャットルームを開く','call chat#chatting#OpenMsgWin()')
  call SpaceVim#mapping#def('nnoremap <silent>','<M-c>',':call chat#chatting#OpenMsgWin()<cr>',
        \ 'チャットルームを開く','call chat#chatting#OpenMsgWin()')
  call SpaceVim#mapping#def('nnoremap <silent>','g=',':call zvim#format()<cr>',
        \ '現在バッファの自動フォーマット','call zvim#format')
  call SpaceVim#mapping#def('nnoremap <silent>', '<C-c>', ':<c-u>call zvim#util#CopyToClipboard()<cr>',
        \ 'バッファの絶対パスをコピー','call zvim#util#CopyToClipboard()')
  call SpaceVim#mapping#def('nnoremap <silent>', '<Tab>', ':wincmd w<CR>',
        \ '次のウィンドウ、タブに移動','wincmd w')
  call SpaceVim#mapping#def('nnoremap <silent>', '<S-Tab>', ':wincmd p<CR>',
        \ '前のウィンドウ、タブに移動','wincmd p')
  call SpaceVim#mapping#def('nnoremap <silent>', 'q', ':<C-u>call zvim#util#SmartClose()<cr>',
        \ 'ウィンドウを閉じるby SmartClose',
        \ 'call zvim#util#SmartClose()')
" end from defaul.vim }}}

" g.vim {{{
    let g:_spacevim_mappings_g = {}
    let g:_spacevim_mappings_g['<C-G>'] = ['call feedkeys("g\<c-g>", "n")', 'カーソル位置情報']
    
    let g:_spacevim_mappings_g['&'] = ['call feedkeys("g&", "n")', 'repeat last ":s" on all lines']
    

    let g:_spacevim_mappings_g["'"] = ['call feedkeys("g' . "'" . '", "n")', 'マーク行にジャンプ']
    
    let g:_spacevim_mappings_g["`"] = ['call feedkeys("g' . "`" . '", "n")', 'マーク行にジャンプ']
    

    let g:_spacevim_mappings_g['+'] = ['call feedkeys("g+", "n")', '編集やり直し']
    
    let g:_spacevim_mappings_g['-'] = ['call feedkeys("g-", "n")', '編集取り消し']
    
    let g:_spacevim_mappings_g[','] = ['call feedkeys("g,", "n")', '最後の編集場所に移動']
    
    let g:_spacevim_mappings_g[';'] = ['call feedkeys("g;", "n")', '最初の編集場所に移動']
    
    let g:_spacevim_mappings_g['@'] = ['call feedkeys("g@", "n")', 'call operatorfunc']
    

    let g:_spacevim_mappings_g['#'] = ['call feedkeys("\<Plug>(incsearch-nohl-g#)")', '現在カーソル単語を上方向検索']
    let g:_spacevim_mappings_g['*'] = ['call feedkeys("\<Plug>(incsearch-nohl-g*)")', '現在カーソル単語を下方向検索']
    let g:_spacevim_mappings_g['/'] = ['call feedkeys("\<Plug>(incsearch-stay)")', '表示中画面内でインクリ検索']
    let g:_spacevim_mappings_g['$'] = ['call feedkeys("g$", "n")', '行末に移動']
    
    let g:_spacevim_mappings_g['<End>'] = ['call feedkeys("g$", "n")', '行末に移動']
    
    let g:_spacevim_mappings_g['0'] = ['call feedkeys("g0", "n")', '行頭に移動']
    
    let g:_spacevim_mappings_g['<Home>'] = ['call feedkeys("g0", "n")', '行頭に移動']
    
    let g:_spacevim_mappings_g['e'] = ['call feedkeys("ge", "n")', '単語末尾へ移動']
    
    let g:_spacevim_mappings_g['<'] = ['call feedkeys("g<", "n")', '前回のコマンドアウトプットを再表示']
    
    let g:_spacevim_mappings_g['f'] = ['call feedkeys("gf", "n")', '現在カーソル上のファイルを開く']
    
    let g:_spacevim_mappings_g['F'] = ['call feedkeys("gF", "n")', '現在カーソル上のファイルの該当行を開く']
    
    let g:_spacevim_mappings_g['j'] = ['call feedkeys("gj", "n")', '下にカーソル移動']
    
    let g:_spacevim_mappings_g['k'] = ['call feedkeys("gk", "n")', '上にカーソル移動']
    
    let g:_spacevim_mappings_g['u'] = ['call feedkeys("gu", "n")', '小文字に変換する']
    
    let g:_spacevim_mappings_g['E'] = ['call feedkeys("gE", "n")', '単語末尾に移動']
    
    let g:_spacevim_mappings_g['U'] = ['call feedkeys("gU", "n")', '大文字に変換する']
    
    let g:_spacevim_mappings_g['H'] = ['call feedkeys("gH", "n")', '行選択モード']
    
    let g:_spacevim_mappings_g['h'] = ['call feedkeys("gh", "n")', '選択モード']
    
    let g:_spacevim_mappings_g['I'] = ['call feedkeys("gI", "n")', '行頭に入力する']
    
    let g:_spacevim_mappings_g['i'] = ['call feedkeys("gi", "n")', "マークの後に入力する after '^ mark"]
    
    let g:_spacevim_mappings_g['J'] = ['call feedkeys("gJ", "n")', '改行をとって次の行と結合する']
    
    let g:_spacevim_mappings_g['N'] = ['call feedkeys("gN", "n")', 'visually select previous match']
    
    let g:_spacevim_mappings_g['n'] = ['call feedkeys("gn", "n")', 'visually select next match']
    
    let g:_spacevim_mappings_g['Q'] = ['call feedkeys("gQ", "n")', '拡張モード']
    
    let g:_spacevim_mappings_g['R'] = ['call feedkeys("gR", "n")', 'リプレイスモード']
    
    let g:_spacevim_mappings_g['T'] = ['call feedkeys("gT", "n")', '前のタグページ']
    
    let g:_spacevim_mappings_g['t'] = ['call feedkeys("gt", "n")', '次のタグページ']
    
    let g:_spacevim_mappings_g[']'] = ['call feedkeys("g]", "n")', 'カーソル上のワードからタグ選択']
    
    let g:_spacevim_mappings_g['^'] = ['call feedkeys("g^", "n")', '行最初の単語先頭に移動']
    
    let g:_spacevim_mappings_g['_'] = ['call feedkeys("g_", "n")', '行最後の単語末尾に移動']
    
    let g:_spacevim_mappings_g['~'] = ['call feedkeys("g~", "n")', 'swap case for Nmove text']
    
    let g:_spacevim_mappings_g['a'] = ['call feedkeys("ga", "n")', 'カーソル上文字のアスキーコードを表示する']
    
    let g:_spacevim_mappings_g['g'] = ['call feedkeys("gg", "n")', 'N行目に移動(省略時は先頭行に移動)']
    
    let g:_spacevim_mappings_g['m'] = ['call feedkeys("gm", "n")', '行中央にカーソル移動']
    
    let g:_spacevim_mappings_g['o'] = ['call feedkeys("go", "n")', 'N バイト目に移動']
    
    let g:_spacevim_mappings_g.s = ['call feedkeys("gs", "n")', 'スリープ N 秒']
    
    let g:_spacevim_mappings_g['v'] = ['call feedkeys("gv", "n")', '直前のビジュアルモード選択']

    let g:_spacevim_mappings_g['d'] = ['call SpaceVim#mapping#gd()', '定義に移動']
    call SpaceVim#mapping#def('nnoremap <silent>', 'gd', ':call SpaceVim#mapping#gd()<CR>', '宣言に移動', '')
" from g.vim}}}


" leader.vim {{{
"=============================================================================
" leader.vim --- mapping leader definition file for SpaceVim
" Copyright (c) 2016-2017 Shidong Wang & Contributors
" Author: Shidong Wang < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: MIT license
"=============================================================================

function! SpaceVim#mapping#leader#defindglobalMappings() abort
  if g:spacevim_enable_insert_leader
    inoremap <silent> <Leader><Tab> <C-r>=MyLeaderTabfunc()<CR>
  endif

  "for buftabs
  noremap <silent><Leader>bp :bprev<CR>
  noremap <silent><Leader>bn :bnext<CR>

  "background
  noremap <silent><leader>bg :call ToggleBG()<CR>
  "numbers
  noremap <silent><leader>nu :call ToggleNumber()<CR>

  " yark and paste
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P

  cnoremap <Leader><C-F> <C-F>
  "When pressing <leader>cd switch to the directory of the open buffer
  map <Leader>cd :cd %:p:h<CR>:pwd<CR>

  " Fast saving
  call SpaceVim#mapping#def('nnoremap', '<Leader>w', ':w<CR>',
        \ '現在のファイルを保存',
        \ 'w',
        \ 'Save current file')
  call SpaceVim#mapping#def('vnoremap', '<Leader>w', '<Esc>:w<CR>',
        \ '現在のファイルを保存',
        \ 'w',
        \ 'Save current file')

  let g:_spacevim_mappings.t = {'name' : 'Toggle editor visuals'}
  nmap <Leader>ts :setlocal spell!<cr>
  nmap <Leader>tn :setlocal nonumber! norelativenumber!<CR>
  nmap <Leader>tl :setlocal nolist!<CR>
  nmap <Leader>th :nohlsearch<CR>
  nmap <Leader>tw :setlocal wrap! breakindent!<CR>

  " Location list movement
  let g:_spacevim_mappings.l = {'name' : 'Locationリスト移動'}
  call SpaceVim#mapping#def('nnoremap', '<Leader>lj', ':lnext<CR>',
        \ '次のLocationリスト位置',
        \ 'lnext',
        \ '次のLocationリスト')
  call SpaceVim#mapping#def('nnoremap', '<Leader>lk', ':lprev<CR>',
        \ '前のLocationリスト位置',
        \ 'lprev',
        \ '前のLocationリスト')
  call SpaceVim#mapping#def('nnoremap', '<Leader>lq', ':lclose<CR>',
        \ 'Locationリスト画面を閉じる',
        \ 'lclose',
        \ 'Locationリスト画面を閉じる')

  " quickfix list movement
  let g:_spacevim_mappings.q = {'name' : 'Quickfixリスト移動'}
  call SpaceVim#mapping#def('nnoremap', '<Leader>qj', ':cnext<CR>',
        \ '次のQuickfixリスト位置',
        \ 'cnext',
        \ '次のQuickfixリスト')
  call SpaceVim#mapping#def('nnoremap', '<Leader>qk', ':cprev<CR>',
        \ '前のQuickfixリスト位置',
        \ 'cprev',
        \ '前のQuickfixリスト')
  call SpaceVim#mapping#def('nnoremap', '<Leader>qq', ':cclose<CR>',
        \ ' Quickfixリスト画面を閉じる',
        \ 'cclose',
        \ 'Quickfixリスト画面を閉じる')
  call SpaceVim#mapping#def('nnoremap <silent>', '<Leader>qr', 'q',
        \ 'Toggle recording',
        \ '',
        \ 'Toggle recording mode')

  " Duplicate lines
  nnoremap <Leader>d m`YP``
  vnoremap <Leader>d YPgv

  call SpaceVim#mapping#def('nnoremap <silent>', '<Leader><C-c>',
        \ ':<c-u>call zvim#util#CopyToClipboard(1)<cr>',
        \ 'Yank the github link of current file to X11 clipboard',
        \ 'call zvim#util#CopyToClipboard(1)')
  call SpaceVim#mapping#def('nnoremap <silent>', '<Leader><C-l>',
        \ ':<c-u>call zvim#util#CopyToClipboard(2)<cr>',
        \ 'Yank the github link of current line to X11 clipboard',
        \ 'call zvim#util#CopyToClipboard(2)')
  call SpaceVim#mapping#def('vnoremap <silent>', '<Leader><C-l>',
        \ ':<c-u>call zvim#util#CopyToClipboard(3)<cr>',
        \ 'Yank the github link of current selection to X11 clipboard',
        \ 'call zvim#util#CopyToClipboard(3)')
  call SpaceVim#mapping#def('vnoremap', '<Leader>S',
        \ "y:execute @@<CR>:echo 'Sourced selection.'<CR>",
        \ 'Sourced selection.',
        \ "echo 'Use <leader>S to sourced selection.'")
  call SpaceVim#mapping#def('nnoremap', '<Leader>S',
        \ "^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>",
        \ 'Source line',
        \ "echo 'Use <leader>S to sourced line.'")

  call SpaceVim#mapping#def('nnoremap <silent>', '<Leader>sv',
        \ ':call SpaceVim#mapping#split_previous_buffer()<CR>',
        \ '水平分割で前のバッファを開く',
        \ 'call SpaceVim#mapping#split_previous_buffer()',
        \ '水平分割で前のバッファを開く')
  call SpaceVim#mapping#def('nnoremap <silent>', '<Leader>sg',
        \ ':call SpaceVim#mapping#vertical_split_previous_buffer()<CR>',
        \ '垂直分割で前のバッファを開く' ,
        \ 'call SpaceVim#mapping#vertical_split_previous_buffer()')
endfunction

function! SpaceVim#mapping#leader#defindWindowsLeader(key) abort
  if !empty(a:key)
    call zvim#util#defineMap('nnoremap', '[Window]', '<Nop>',
          \ 'Defind window prefix', 'normal [Window]')
    call zvim#util#defineMap('nmap' , a:key, '[Window]',
          \ 'Use ' . a:key . ' as window prefix', 'normal ' . a:key)

    call zvim#util#defineMap('nnoremap <silent>', '[Window]p',
          \ ':<C-u>vsplit<CR>:wincmd w<CR>',
          \ 'ウィンドウを左右に分割し、次のウィンドウにフォーカス移動','vsplit | wincmd w')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]v',
          \ ':<C-u>split<CR>', 'ウィンドウを上下に分割', 'split')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]g',
          \ ':<C-u>vsplit<CR>', 'ウィンドウを左右に分割', 'vsplit')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]t',
          \ ':<C-u>tabnew<CR>', '新しいタブを開く', 'tabnew')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]o',
          \ ':<C-u>only<CR>', 'ウィンドウ最大化', 'only')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]x',
          \ ':<C-u>call zvim#util#BufferEmpty()<CR>',
          \ '現在のバッファを空にする', 'call zvim#util#BufferEmpty()')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]\',
          \ ':<C-u>b#<CR>', '前回のバッファに移動','b#')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]q',
          \ ':<C-u>close<CR>', '現在のウィンドウを閉じる','close')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]Q',
          \ ':<C-u>call SpaceVim#mapping#close_current_buffer()<CR>',
          \ '現在のバッファを強制的に閉じる',
          \ 'call SpaceVim#mapping#close_current_buffer()')
    call zvim#util#defineMap('nnoremap <silent>', '[Window]c',
          \ ':<C-u>call SpaceVim#mapping#clearBuffers()<CR>',
          \ '全バッファクリア', 'call SpaceVim#mapping#clearBuffers()')
  endif
endfunction

function! SpaceVim#mapping#leader#defindDeniteLeader(key) abort
  if !empty(a:key)
    if a:key == 'F'
      nnoremap <leader>F F
    endif
    exe 'nnoremap <silent><nowait> [denite] :<c-u>LeaderGuide "' .
          \ a:key . '"<CR>'
    exe 'nmap ' .a:key . ' [denite]'
    let g:_spacevim_mappings_denite = {}
    nnoremap <silent> [denite]r
          \ :<C-u>Denite -resume<CR>
    let g:_spacevim_mappings_denite.r = ['Denite -resume',
          \ 'Deniteコンソール再開']
    nnoremap <silent> [denite]f  :<C-u>Denite file_rec<cr>
    let g:_spacevim_mappings_denite.f = ['Denite file_rec', 'ファイルパスで検索']
    nnoremap <silent> [denite]g  :<C-u>Denite grep<cr>
    let g:_spacevim_mappings_denite.g = ['Denite grep', 'ファイル内Grep']
    nnoremap <silent> [denite]j  :<C-u>Denite jump<CR>
    let g:_spacevim_mappings_denite.j = ['Denite jump', '参照行履歴']
    nnoremap <silent> [denite]<C-h>  :<C-u>DeniteCursorWord help<CR>
    let g:_spacevim_mappings_denite['<C-h>'] = ['DeniteCursorWord help',
          \ 'カーソル上単語をヘルプ検索']
    nnoremap <silent> [denite]o  :<C-u>Denite -buffer-name=outline
          \  -auto-preview outline<CR>
    let g:_spacevim_mappings_denite.o = ['Denite outline', '関数アウトライン']
    nnoremap <silent> [denite]e  :<C-u>Denite
          \ -buffer-name=register register<CR>
    let g:_spacevim_mappings_denite.e = ['Denite register', 'レジスタを検索']
    nnoremap <silent> [denite]<Space> :Denite menu:CustomKeyMaps<CR>
    let g:_spacevim_mappings_denite['<space>'] = ['Denite menu:CustomKeyMaps',
          \ 'denite カスタムキーマップ']
  endif
endfunction

function! SpaceVim#mapping#leader#defindUniteLeader(key) abort
  if !empty(a:key)
    if a:key == 'f'
      nnoremap <leader>f f
    endif
    " The prefix key.
    exe 'nnoremap <silent><nowait> [unite] :<c-u>LeaderGuide "' .
          \ a:key . '"<CR>'
    exe 'nmap ' .a:key . ' [unite]'
    let g:_spacevim_mappings_unite = {}
    nnoremap <silent> [unite]r
          \ :<C-u>Unite -buffer-name=resume resume<CR>
    let g:_spacevim_mappings_unite.r = ['Unite -buffer-name=resume resume',
          \ 'uniteコンソール再開']
    if has('nvim')
      nnoremap <silent> [unite]f  :<C-u>Unite file_rec/neovim<cr>
      let g:_spacevim_mappings_unite.f = ['Unite file_rec/neovim', 'file_rec']
    else
      nnoremap <silent> [unite]f  :<C-u>Unite file_rec/async<cr>
      let g:_spacevim_mappings_unite.f = ['Unite file_rec/async', 'file_rec/async']
    endif
    nnoremap <silent> [unite]i  :<C-u>Unite file_rec/git<cr>
    let g:_spacevim_mappings_unite.i = ['Unite file_rec/git', 'git files']
    nnoremap <silent> [unite]g  :<C-u>Unite grep<cr>
    let g:_spacevim_mappings_unite.g = ['Unite grep', 'grep']
    nnoremap <silent> [unite]u  :<C-u>Unite source<CR>
    let g:_spacevim_mappings_unite.u = ['Unite source', 'source']
    nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>
    let g:_spacevim_mappings_unite.t = ['Unite tag', 'tag']
    nnoremap <silent> [unite]T  :<C-u>Unite tag/include<CR>
    let g:_spacevim_mappings_unite.T = ['Unite tag/include',
          \ 'tag/include']
    nnoremap <silent> [unite]l  :<C-u>Unite locationlist<CR>
    let g:_spacevim_mappings_unite.l = ['Unite locationlist',
          \ 'locationlist']
    nnoremap <silent> [unite]q  :<C-u>Unite quickfix<CR>
    let g:_spacevim_mappings_unite.q = ['Unite quickfix', 'quickfix']
    nnoremap <silent> [unite]e  :<C-u>Unite
          \ -buffer-name=register register<CR>
    let g:_spacevim_mappings_unite.e = ['Unite register', 'レジスタを検索']
    nnoremap <silent> [unite]j  :<C-u>Unite jump<CR>
    let g:_spacevim_mappings_unite.j = ['Unite jump', '参照行履歴']
    nnoremap <silent> [unite]h  :<C-u>Unite history/yank<CR>
    let g:_spacevim_mappings_unite.h = ['Unite history/yank',
          \ 'ヤンク履歴']
    nnoremap <silent> [unite]<C-h>  :<C-u>UniteWithCursorWord help<CR>
    let g:_spacevim_mappings_unite['<C-h>'] = ['UniteWithCursorWord help',
          \ 'カーソル上の単語でヘルプ検索']
    nnoremap <silent> [unite]s  :<C-u>Unite session<CR>
    let g:_spacevim_mappings_unite.s = ['Unite session', 'セッション']
    nnoremap <silent> [unite]o  :<C-u>Unite -buffer-name=outline
          \ -start-insert -auto-preview -split outline<CR>
    let g:_spacevim_mappings_unite.o = ['Unite outline', 'アウトライン']

    " menu
    nnoremap <silent> [unite]ma
          \ :<C-u>Unite mapping<CR>
    nnoremap <silent> [unite]me
          \ :<C-u>Unite output:message<CR>
    let g:_spacevim_mappings_unite.m = {'name' : 'unite menus',
          \ 'a' : ['Unite mapping', 'unite mappings'],
          \ 'e' : ['Unite output:message', 'unite messages']
          \ }

    nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
          \ -buffer-name=files buffer bookmark file<CR>
    let g:_spacevim_mappings_unite.c =
          \ ['UniteWithCurrentDir -buffer-name=files buffer bookmark file',
          \ 'カレントディレクトリ']
    nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
          \ -buffer-name=files -prompt=%\  buffer bookmark file<CR>
    let g:_spacevim_mappings_unite.b =
          \ ['UniteWithBufferDir -buffer-name=files' .
          \ ' buffer bookmark file',
          \ '現在バッファのディレクトリ']
    nnoremap <silent> [unite]n  :<C-u>Unite session/new<CR>
    let g:_spacevim_mappings_unite.n = ['Unite session/new',
          \ '新しいUniteセッション']
    nnoremap <silent> [unite]/ :Unite grep:.<cr>
    let g:_spacevim_mappings_unite['/'] = ['Unite grep:.',
          \ 'Grepプレビュー付']
    nnoremap <silent> [unite]w
          \ :<C-u>Unite -buffer-name=files -no-split
          \ jump_point file_point buffer_tab
          \ file_rec:! file file/new<CR>
    let g:_spacevim_mappings_unite.w= ['Unite -buffer-name=files -no-split' .
          \ ' jump_point file_point buffer_tab file_rec:! file file/new',
          \ 'unite all file and jump']
    nnoremap <silent>[unite]<Space> :Unite -silent -ignorecase -winheight=17
          \ -start-insert menu:CustomKeyMaps<CR>
    let g:_spacevim_mappings_unite['[SPC]'] = ['Unite -silent -ignorecase' .
          \ ' -winheight=17 -start-insert menu:CustomKeyMaps',
          \ 'カスタムキーマップ一覧']
  endif
endfunction

function! SpaceVim#mapping#leader#getName(key) abort
  if a:key == g:spacevim_unite_leader
    return '[unite]'
  elseif a:key == g:spacevim_denite_leader
    return '[denite]'
  elseif a:key == ' '
    return '[SPC]'
  elseif a:key == 'g'
    return '[g]'
  elseif a:key == 'z'
    return '[z]'
  else
    return '<leader>'
  endif
endfunction

function! SpaceVim#mapping#leader#defindKEYs() abort
  let g:_spacevim_mappings_prefixs = {}
  let g:_spacevim_mappings_prefixs[g:spacevim_unite_leader] = {'name' : '+Unite prefix'}
  call extend(g:_spacevim_mappings_prefixs[g:spacevim_unite_leader], g:_spacevim_mappings_unite)
  let g:_spacevim_mappings_prefixs[g:spacevim_denite_leader] = {'name' : '+Denite prefix'}
  call extend(g:_spacevim_mappings_prefixs[g:spacevim_denite_leader], g:_spacevim_mappings_denite)
endfunction
" from leader.vim }}}

" vim:set et sw=2 cc=80:

