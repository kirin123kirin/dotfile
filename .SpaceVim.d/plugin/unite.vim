call unite#custom#default_action('directory' , 'vimfiler')
call unite#custom#default_action('file' , 'tabswitch')
call unite#custom#profile('default', 'context', {
      \   'safe': 0,
      \   'start_insert': 1,
      \   'ignorecase' : 1,
      \   'short_source_names': 1,
      \   'update_time': 200,
      \   'direction': 'botright',
      \   'winheight': 15,
      \   'max_candidates': 100,
      \   'no_auto_resize': 1,
      \   'vertical_preview': 1,
      \   'cursor_line_time': '0.10',
      \   'hide_icon': 0,
      \   'candidate-icon': ' ',
      \   'marked_icon': '*',
      \   'prompt' : '> '
      \ })

let g:unite_source_buffer_time_format = get(g:,
      \ 'unite_source_buffer_time_format', '(%y/%m/%d %H:%M) ')
let g:unite_source_file_mru_time_format = get(g:,
      \ 'unite_source_file_mru_time_format', '(%y/%m/%d %H:%M) ')
let g:unite_source_directory_mru_time_format = get(g:,
      \ 'unite_source_directory_mru_time_format', '(%y/%m/%d %H:%M) ')
let g:unite_source_grep_command = 'rg'
let g:unite_source_grep_default_opts = '--path-separator / --hidden --files --glob !.git'
let g:unite_source_grep_recursive_opt = ''
call unite#custom#profile('file_rec/async,file_rec/git', 'context', {
      \   'start_insert' : 1,
      \   'quit'         : 1,
      \   'split'        : 1,
      \   'keep_focus'   : 1,
      \   'winheight'    : 20,
      \ })
call unite#custom#profile('buffer,buffer_tab', 'context', {
      \   'start_insert' : 0,
      \   'quit'         : 1,
      \   'keep_focus'   : 1,
      \ })

augroup unite_buffer_feature_
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  " Overwrite settings.
  setlocal nowrap

  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-n>     <Plug>(unite_select_next_line)
  nmap <buffer> <C-n>     <Plug>(unite_select_next_line)
  imap <buffer> <TAB>     <Plug>(unite_select_next_line)
  nmap <buffer> <TAB>     <Plug>(unite_select_next_line)
  imap <buffer> <C-p>     <Plug>(unite_select_previous_line)
  nmap <buffer> <C-p>     <Plug>(unite_select_previous_line)
  imap <buffer> <S-Tab>   <Plug>(unite_select_previous_line)
  nmap <buffer> <S-Tab>   <Plug>(unite_select_previous_line)


  imap <buffer> jj      <Plug>(unite_insert_leave)
  nmap <buffer> <ESC><ESC>      <Plug>(unite_all_exit)
  imap <buffer> <ESC><ESC>      <Plug>(unite_all_exit)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
        \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
  imap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ?
        \ ['sorter_reverse'] : [])

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction


