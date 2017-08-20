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
      \   'prompt' : '? '
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
