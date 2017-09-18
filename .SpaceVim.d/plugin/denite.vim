call denite#custom#option('default', 'winheight', 60*winheight(0)/100)

if WINDOWS()
    call denite#custom#var('directory_rec', 'command',
        \ ['es', '/ad'])
endif
call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'direction', 'botright')
call denite#custom#var(
      \ 'buffer',
      \ 'date_format', '%y/%m/%d %H:%M')
if executable('rg')
    call denite#custom#var('file_rec', 'command',
        \ ['rg', '--path-separator', '/', '--hidden', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg', '--threads', '2'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
    call denite#custom#var('file_rec', 'command',
        \ ['pt', '--follow', '--nocolor', '--hidden', '--nogroup', '-g', ''])
endif

call denite#custom#source('file_old', 'matchers',['matcher_fuzzy', 'matcher_project_files'])
if has('nvim')
    call denite#custom#source('file_rec,grep', 'matchers', ['matcher_cpsm'])
endif
call denite#custom#source('file_old', 'converters', ['converter_relative_word'])
call denite#custom#source('file_rec', 'sorters', ['sorter_rank'])
call denite#custom#source('directory_rec', 'sorters', ['sorter_rank'])
call denite#custom#source('file_mru', 'sorters', ['sorter_rank'])
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'", '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r', '<denite:do_action:quickfix>', 'noremap')
call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
call denite#custom#map('normal', '<ESC>', '<denite:quit>')
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')


call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', '.svn/', '.ropeproject/', '__pycache__/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

