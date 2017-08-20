function! SpaceVim#mapping#z#init() abort "{{{
    nnoremap <silent><nowait> [z] :<c-u>LeaderGuide "z"<CR>
    nmap z [z]
    let g:_spacevim_mappings_z = {}
    let g:_spacevim_mappings_z['<CR>'] = ['call feedkeys("z\<CR>", "n")', '行頭']
    nnoremap z<CR> z<CR>
    let g:_spacevim_mappings_z['+'] = ['call feedkeys("z+", "n")', '画面上端 N']
    nnoremap z+ z+
    let g:_spacevim_mappings_z['-'] = ['call feedkeys("z-", "n")', '画面末端 N']
    nnoremap z- z-
    let g:_spacevim_mappings_z['^'] = ['call feedkeys("z^", "n")', '画面末端 N']
    nnoremap z^ z^
    let g:_spacevim_mappings_z['.'] = ['call feedkeys("z.", "n")', '行中央']
    nnoremap z. z.
    let g:_spacevim_mappings_z['='] = ['call feedkeys("z=", "n")', 'スペリング候補']
    nnoremap z= z=
    let g:_spacevim_mappings_z['A'] = ['call feedkeys("zA", "n")', '再帰的な折り畳み切替']
    nnoremap zA zA
    let g:_spacevim_mappings_z['C'] = ['call feedkeys("zC", "n")', '再帰的に折り畳む']
    nnoremap zC zC
    let g:_spacevim_mappings_z['D'] = ['call feedkeys("zD", "n")', '折り畳み部を再帰的に削除する']
    nnoremap zD zD
    let g:_spacevim_mappings_z['E'] = ['call feedkeys("zE", "n")', '全折り畳みを省略']
    nnoremap zE zE
    let g:_spacevim_mappings_z['F'] = ['call feedkeys("zF", "n")', 'N行の折り畳みを作成する']
    nnoremap zF zF
    let g:_spacevim_mappings_z['G'] = ['call feedkeys("zG", "n")', '良いスペリングとしてマーク(内部辞書も更新)']
    nnoremap zG zG
    let g:_spacevim_mappings_z['H'] = ['call feedkeys("zH", "n")', '右方向に半画面スクロール']
    nnoremap zH zH
    let g:_spacevim_mappings_z['L'] = ['call feedkeys("zL", "n")', '左方向に半画面スクロール']
    nnoremap zL zL
    let g:_spacevim_mappings_z['M'] = ['call feedkeys("zM", "n")', '折り畳みレベルを0']
    nnoremap zM zM
    let g:_spacevim_mappings_z['N'] = ['call feedkeys("zN", "n")', '折り畳みを有効']
    nnoremap zN zN
    let g:_spacevim_mappings_z['O'] = ['call feedkeys("zO", "n")', '折り畳みを再帰的に開く']
    nnoremap zO zO
    let g:_spacevim_mappings_z['R'] = ['call feedkeys("zR", "n")', '折り畳みレベルを最深']
    nnoremap zR zR
    let g:_spacevim_mappings_z['W'] = ['call feedkeys("zW", "n")', '間違ったスペルとしてマーク']
    nnoremap zW zW
    let g:_spacevim_mappings_z['X'] = ['call feedkeys("zX", "n")', '折り畳みレベルを再適用']
    nnoremap zX zX
    let g:_spacevim_mappings_z['a'] = ['call feedkeys("za", "n")', '折り畳み切替']
    nnoremap za za
    let g:_spacevim_mappings_z['b'] = ['call feedkeys("zb", "n")', '行末']
    nnoremap zb zb
    let g:_spacevim_mappings_z['c'] = ['call feedkeys("zc", "n")', '折り畳みを閉じる']
    nnoremap zc zc
    let g:_spacevim_mappings_z['d'] = ['call feedkeys("zd", "n")', '折り畳み削除']
    nnoremap zd zd
    let g:_spacevim_mappings_z['e'] = ['call feedkeys("ze", "n")', 'right scroll horizontally to cursor position']
    nnoremap ze ze
    let g:_spacevim_mappings_z['f'] = ['call feedkeys("zf", "n")', 'create a fold for motion']
    nnoremap zf zf
    let g:_spacevim_mappings_z['g'] = ['call feedkeys("zg", "n")', 'mark good spelled']
    nnoremap zg zg
    let g:_spacevim_mappings_z['h'] = ['call feedkeys("zh", "n")', 'scroll screen N characters to right']
    nnoremap zh zh
    let g:_spacevim_mappings_z['<Left>'] = ['call feedkeys("zh", "n")', 'scroll screen N characters to right']
    nnoremap z<Left> zh
    let g:_spacevim_mappings_z['i'] = ['call feedkeys("zi", "n")', 'toggle foldenable']
    nnoremap zi zi
    let g:_spacevim_mappings_z['j'] = ['call feedkeys("zj", "n")', 'mode to start of next fold']
    nnoremap zj zj
    let g:_spacevim_mappings_z['k'] = ['call feedkeys("zk", "n")', 'mode to end of previous fold']
    nnoremap zk zk
    let g:_spacevim_mappings_z['l'] = ['call feedkeys("zl", "n")', 'scroll screen N characters to left']
    nnoremap zl zl
    let g:_spacevim_mappings_z['<Right>'] = ['call feedkeys("zl", "n")', 'scroll screen N characters to left']
    nnoremap z<Right> zl
    let g:_spacevim_mappings_z['m'] = ['call feedkeys("zm", "n")', 'subtract one from `foldlevel`']
    nnoremap zm zm
    let g:_spacevim_mappings_z['n'] = ['call feedkeys("zn", "n")', 'reset `foldenable`']
    nnoremap zn zn
    let g:_spacevim_mappings_z['o'] = ['call feedkeys("zo", "n")', 'open fold']
    nnoremap zo zo
    let g:_spacevim_mappings_z['r'] = ['call feedkeys("zr", "n")', 'add one to `foldlevel`']
    nnoremap zr zr
    let g:_spacevim_mappings_z.s = ['call feedkeys("zs", "n")', 'left scroll horizontally to cursor position']
    nnoremap zs zs
    let g:_spacevim_mappings_z['t'] = ['call feedkeys("zt", "n")', 'cursor line at top of window']
    nnoremap zt zt
    let g:_spacevim_mappings_z['v'] = ['call feedkeys("zv", "n")', 'open enough folds to view cursor line']
    nnoremap zv zv
    let g:_spacevim_mappings_z['x'] = ['call feedkeys("zx", "n")', 're-apply foldlevel and do "zV"']
    nnoremap zx zx
    " smart scroll
    let g:_spacevim_mappings_z['z'] = ['call feedkeys("zz", "n")', 'smart scroll']
    nnoremap zz zz

endfunction "}}}
