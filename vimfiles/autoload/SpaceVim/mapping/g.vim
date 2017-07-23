function! SpaceVim#mapping#g#init() abort
    nnoremap <silent><nowait> [g] :<c-u>LeaderGuide "g"<CR>
    nmap g [g]
    let g:_spacevim_mappings_g = {}
    let g:_spacevim_mappings_g['<C-G>'] = ['call feedkeys("g\<c-g>", "n")', 'カーソル位置情報']
    nnoremap g<c-g> g<c-g>
    let g:_spacevim_mappings_g['&'] = ['call feedkeys("g&", "n")', 'repeat last ":s" on all lines']
    nnoremap g& g&

    let g:_spacevim_mappings_g["'"] = ['call feedkeys("g' . "'" . '", "n")', 'マーク行にジャンプ']
    nnoremap g' g'
    let g:_spacevim_mappings_g["`"] = ['call feedkeys("g' . "`" . '", "n")', 'マーク行にジャンプ']
    nnoremap g` g`

    let g:_spacevim_mappings_g['+'] = ['call feedkeys("g+", "n")', '編集やり直し']
    nnoremap g+ g+
    let g:_spacevim_mappings_g['-'] = ['call feedkeys("g-", "n")', '編集取り消し']
    nnoremap g- g-
    let g:_spacevim_mappings_g[','] = ['call feedkeys("g,", "n")', '最後の編集場所に移動']
    nnoremap g, g,
    let g:_spacevim_mappings_g[';'] = ['call feedkeys("g;", "n")', '最初の編集場所に移動']
    nnoremap g; g;

    let g:_spacevim_mappings_g['#'] = ['call feedkeys("\<Plug>(incsearch-nohl-g#)")', '現在カーソル単語を上方向検索']
    let g:_spacevim_mappings_g['*'] = ['call feedkeys("\<Plug>(incsearch-nohl-g*)")', '現在カーソル単語を下方向検索']
    let g:_spacevim_mappings_g['/'] = ['call feedkeys("\<Plug>(incsearch-stay)")', '表示中画面内でインクリ検索']
    let g:_spacevim_mappings_g['$'] = ['call feedkeys("g$", "n")', '行末に移動']
    nnoremap g$ g$
    let g:_spacevim_mappings_g['<End>'] = ['call feedkeys("g$", "n")', '行末に移動']
    nnoremap g<End> g<End>
    let g:_spacevim_mappings_g['0'] = ['call feedkeys("g0", "n")', '行頭に移動']
    nnoremap g0 g0
    let g:_spacevim_mappings_g['<Home>'] = ['call feedkeys("g0", "n")', '行頭に移動']
    nnoremap g<Home> g<Home>
    let g:_spacevim_mappings_g['e'] = ['call feedkeys("ge", "n")', '単語末尾へ移動']
    nnoremap ge ge
    let g:_spacevim_mappings_g['<'] = ['call feedkeys("g<", "n")', '前回のコマンドアウトプットを再表示']
    nnoremap g< g<
    let g:_spacevim_mappings_g['f'] = ['call feedkeys("gf", "n")', '現在カーソル上のファイルを開く']
    nnoremap gf gf
    let g:_spacevim_mappings_g['F'] = ['call feedkeys("gF", "n")', '現在カーソル上のファイルの該当行を開く']
    nnoremap gF gF
    let g:_spacevim_mappings_g['j'] = ['call feedkeys("gj", "n")', '下にカーソル移動']
    nnoremap gj gj
    let g:_spacevim_mappings_g['k'] = ['call feedkeys("gk", "n")', '上にカーソル移動']
    nnoremap gk gk
    let g:_spacevim_mappings_g['u'] = ['call feedkeys("gu", "n")', '小文字に変換する']
    nnoremap gu gu
    let g:_spacevim_mappings_g['E'] = ['call feedkeys("gE", "n")', '単語末尾に移動']
    nnoremap gE gE
    let g:_spacevim_mappings_g['U'] = ['call feedkeys("gU", "n")', '大文字に変換する']
    nnoremap gU gU
    let g:_spacevim_mappings_g['H'] = ['call feedkeys("gH", "n")', '行選択モード']
    nnoremap gH gH
    let g:_spacevim_mappings_g['h'] = ['call feedkeys("gh", "n")', '選択モード']
    nnoremap gh gh
    let g:_spacevim_mappings_g['I'] = ['call feedkeys("gI", "n")', '行頭に入力する']
    nnoremap gI gI
    let g:_spacevim_mappings_g['i'] = ['call feedkeys("gi", "n")', "マークの後に入力する after '^ mark"]
    nnoremap gi gi
    let g:_spacevim_mappings_g['J'] = ['call feedkeys("gJ", "n")', '改行をとって次の行と結合する']
    nnoremap gJ gJ
    let g:_spacevim_mappings_g['N'] = ['call feedkeys("gN", "n")', 'visually select previous match']
    nnoremap gN gN
    let g:_spacevim_mappings_g['n'] = ['call feedkeys("gn", "n")', 'visually select next match']
    nnoremap gn gn
    let g:_spacevim_mappings_g['Q'] = ['call feedkeys("gQ", "n")', '拡張モード']
    nnoremap gQ gQ
    let g:_spacevim_mappings_g['R'] = ['call feedkeys("gR", "n")', 'リプレイスモード']
    nnoremap gR gR
    let g:_spacevim_mappings_g['T'] = ['call feedkeys("gT", "n")', '前のタグページ']
    nnoremap gT gT
    let g:_spacevim_mappings_g['t'] = ['call feedkeys("gt", "n")', '次のタグページ']
    nnoremap gt gt
    let g:_spacevim_mappings_g[']'] = ['call feedkeys("g]", "n")', 'カーソル上のワードからタグ選択']
    nnoremap g] g]
    let g:_spacevim_mappings_g['^'] = ['call feedkeys("g^", "n")', '行最初の単語先頭に移動']
    nnoremap g^ g^
    let g:_spacevim_mappings_g['_'] = ['call feedkeys("g_", "n")', '行最後の単語末尾に移動']
    nnoremap g_ g_
    let g:_spacevim_mappings_g['~'] = ['call feedkeys("g~", "n")', 'swap case for Nmove text']
    nnoremap g~ g~
    let g:_spacevim_mappings_g['a'] = ['call feedkeys("ga", "n")', 'カーソル上文字のアスキーコードを表示する']
    nnoremap ga ga
    let g:_spacevim_mappings_g['g'] = ['call feedkeys("gg", "n")', 'N行目に移動(省略時は先頭行に移動)']
    nnoremap gg gg
    let g:_spacevim_mappings_g['m'] = ['call feedkeys("gm", "n")', '行中央にカーソル移動']
    nnoremap gm gm
    let g:_spacevim_mappings_g['o'] = ['call feedkeys("go", "n")', 'N バイト目に移動']
    nnoremap go go
    let g:_spacevim_mappings_g.s = ['call feedkeys("gs", "n")', 'スリープ N 秒']
    nnoremap gs gs
    let g:_spacevim_mappings_g['v'] = ['call feedkeys("gv", "n")', '直前のビジュアルモード選択']
    nnoremap gv gv




    let g:_spacevim_mappings_g['d'] = ['call SpaceVim#mapping#gd()', '定義に移動']
    call SpaceVim#mapping#def('nnoremap <silent>', 'gd', ':call SpaceVim#mapping#gd()<CR>', '宣言に移動', '')


endfunction
