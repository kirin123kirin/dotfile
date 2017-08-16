" ------------matcher rule-----------------------------
" matcher_head            Head matching matcher.
" matcher_fuzzy           Fuzzy matching matcher.
" matcher_full_fuzzy   Full fuzzy matching matcher.
"                                       It accepts partial fuzzy matches like YouCompleteMe.
" matcher_length         Length matching matcher.
"                                      It removes candidates shorter than or equal to the user input.
" ------------end of matcher rule------------------

let g:deoplete#disable_auto_complete = get(g:, 'deoplete#disable_auto_complete', 1)
let g:deoplete#auto_complete_start_length = get(g:,'deoplete#auto_complete_start_length', 0)
let g:deoplete#auto_complete_delay = get(g:, 'g:deoplete#auto_complete_delay', 0)
let g:deoplete#enable_camel_case = get(g:, 'deoplete#enable_camel_case', 1)
let g:deoplete#enable_refresh_always = get(g:, 'deoplete#enable_refresh_always', 0)
let g:deoplete#auto_refresh_delay = get(g:,'deoplete#auto_refresh_delay', 0)
let g:deoplete#file#enable_buffer_path = get(g:,'deoplete#file#enable_buffer_path',1)
let g:deoplete#max_list = get(g:, 'deoplete#max_list', 15)

inoremap <expr><C-h> deoplete#close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#close_popup()."\<BS>"

imap <expr> <ESC> pumvisible() ? "\<C-E>" : "\<ESC>"
imap <silent><expr><TAB> pumvisible() ? "<C-n>" : neosnippet#expandable_or_jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : <SID>check_back_space() ? "<TAB>" : "\<C-r>=deoplete#mappings#manual_complete()<CR>"
smap <silent><expr><TAB> neosnippet#expandable_or_jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : <SID>check_back_space() ? "<TAB>" : "\<C-r>=deoplete#mappings#manual_complete()<CR>"
imap <silent><expr><S-TAB>  pumvisible() ? "<C-p>" : "<S-TAB>"
imap <silent><expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-r>=deoplete#close_popup()<CR>" : "<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

