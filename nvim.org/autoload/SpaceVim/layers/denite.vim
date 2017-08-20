function! SpaceVim#layers#denite#plugins() abort
  return [
        \ ['Shougo/denite.nvim',{ 'merged' : 0, 'loadconf' : 1}],
        \ ['pocari/vim-denite-emoji', {'merged' : 0}],
        \ ]
endfunction

function! SpaceVim#layers#denite#config() abort
  call SpaceVim#mapping#space#def('nnoremap', ['j', 'i'], 'Denite outline', 'バッファー内の定義にジャンプ', 1)
endfunction

" vim:set et sw=2 cc=80:
