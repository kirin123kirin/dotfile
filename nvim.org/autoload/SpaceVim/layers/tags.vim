function! SpaceVim#layers#tags#plugins()
    return [
                \ ['ludovicchabant/vim-gutentags', {'merged' : 0}],
                \ ['SpaceVim/gtags.vim', {'merged' : 0}],
                \ ]
endfunction

function! SpaceVim#layers#tags#config()
    let g:_spacevim_mappings_space.m.g = {'name' : '+gtags'}
    call SpaceVim#mapping#space#def('nnoremap', ['m', 'g', 'c'], 'GtagsGenerate!', 'gtagsデータベース新規作成', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['m', 'g', 'u'], 'GtagsGenerate', 'tagデータベース更新', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['m', 'g', 'f'], 'Unite gtags/path', 'GTAGS内の全ファイル一覧', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['m', 'g', 'd'], 'Unite gtags/def', '定義検索 by gtags', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['m', 'g', 'r'], 'Unite gtags/ref', '参照先の検索 by gtags', 1)
endfunction
