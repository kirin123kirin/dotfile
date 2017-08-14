function! SpaceVim#layers#core#plugins() abort
    return [
                \ ['Shougo/vimproc.vim', {'build' : ['make']}],
                \ ['benizi/vim-automkdir'],
                \ ['airblade/vim-rooter', {'on_cmd' : 'Rooter'}],
                \ ]
endfunction

function! SpaceVim#layers#core#config() abort
    let g:rooter_silent_chdir = 1
    call SpaceVim#layers#load('core#banner')
    call SpaceVim#layers#load('core#statusline')
    call SpaceVim#layers#load('core#tabline')
    call SpaceVim#mapping#space#def('nnoremap', ['p', 't'], 'Rooter', 'プロジェクトルートを検索', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['p', 'f'], 'CtrlP', '現在のプロジェクト内ファイル検索', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['p', '/'], 'Grepper', '現在のプロジェクト内でテキスト曖昧検索', 1)
endfunction
