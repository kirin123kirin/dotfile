call denite#custom#option('default', 'winheight', 60*winheight(0)/100)

if IsWindows()
    call denite#custom#var('directory_rec', 'command',
        \ ['dir', '/s', '/d', '/b'])
endif
if executable('rg')
    call denite#custom#var('file_rec', 'command',
        \ ['rg', '--path-separator', '/', '--hidden', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
    call denite#custom#var('file_rec', 'command',
        \ ['pt', '--follow', '--nocolor', '--hidden', '--nogroup', '-g', ''])
endif

call denite#custom#source('file_old', 'matchers',
        \ ['matcher_fuzzy', 'matcher_project_files'])
if has('nvim')
    call denite#custom#source('file_rec,grep', 'matchers',
        \ ['matcher_cpsm'])
endif
call denite#custom#source('file_old', 'converters',
        \ ['converter_relative_word'])

call denite#custom#map('insert', '<C-j>',
        \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
        \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'",
        \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r',
        \ '<denite:do_action:quickfix>', 'noremap')
call denite#custom#map(
        \ 'insert',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
call denite#custom#map(
        \ 'insert',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
call denite#custom#map(
        \ 'insert',
        \ 'jj',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)



call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', '.svn/', '.ropeproject/', '__pycache__/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

