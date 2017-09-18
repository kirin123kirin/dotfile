let g:vimfiler_direction = get(g:, 'vimfiler_direction', 'below')
let g:vimfiler_enable_auto_cd = 1

if has('win32') || has('win64')
  let g:vimfiler_detect_drives = ['C:/', 'Y:/']
  " let g:vimfiler_quick_look_command = "Seer.exe"
endif

augroup vfinit
  au!
  autocmd FileType vimfiler call s:vimfilerinit()
  autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'vimfiler') |
        \ q | endif
augroup END
function! s:vimfilerinit()
  setl nonumber
  setl norelativenumber
  setl nosplitright

  silent! nunmap <buffer> <Space>
  silent! nunmap <buffer> C
"  silent! nunmap <buffer> <C-l>
  silent! nunmap <buffer> <C-j>
  silent! nunmap <buffer> E
  silent! nunmap <buffer> gr
  silent! nunmap <buffer> gf
  silent! nunmap <buffer> -
  silent! nunmap <buffer> s

  nnoremap <silent><buffer> gr  :<C-u>Denite grep -buffer-name=grep<CR>
  nnoremap <silent><buffer> gf  :<C-u>Denite file_rec<CR>
  nnoremap <silent><buffer> gd  :<C-u>call <SID>change_vim_current_dir()<CR>
  nnoremap <silent><buffer><expr> sv  vimfiler#do_action('vsplit')
  nnoremap <silent><buffer><expr> ss  vimfiler#do_action('split')
  nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
  nmap <buffer> gx      <Plug>(vimfiler_execute_vimfiler_associated)
  nmap <buffer> ,       <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer> v       <Plug>(vimfiler_quick_look)
  nmap <buffer> p       <Plug>(vimfiler_preview_file)
  nmap <buffer> E       <Plug>(vimfiler_clear_mark_all_lines)
  nmap <buffer> i       <Plug>(vimfiler_switch_to_history_directory)
  nmap <buffer> <Tab>   <Plug>(vimfiler_switch_to_other_window)
  nmap <buffer> <C-r>   <Plug>(vimfiler_redraw_screen)
  nmap <buffer> <Left>  <Plug>(vimfiler_smart_h)
  nmap <buffer> <Right> <Plug>(vimfiler_smart_l)
endfunction

noremap <F3> <nop>
noremap <silent> <F2> :call zvim#util#OpenVimfiler()<CR>
map <silent><S-F2> :VimFilerDouble -toggle -create -no-explorer -winwidth=`winwidth(0)/2` -reverse -horizontal -direction="bottom"<CR>


