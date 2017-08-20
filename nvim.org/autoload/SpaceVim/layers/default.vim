""
" @section Default, default
" @parentsection layers

function! SpaceVim#layers#default#plugins() abort
    let plugins = []

    return plugins
endfunction

function! SpaceVim#layers#default#config() abort
    " Unimpaired bindings
    " Quickly add empty lines
    nnoremap <silent> [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
    nnoremap <silent> ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

    "]e or [e move current line ,count can be useed
    nnoremap <silent>[e  :<c-u>execute 'move -1-'. v:count1<cr>
    nnoremap <silent>]e  :<c-u>execute 'move +'. v:count1<cr>

    " [b or ]n go to previous or next buffer
    nnoremap <silent> [b :<c-u>bN<cr>
    nnoremap <silent> ]b :<c-u>bn<cr>

    " [f or ]f go to next or previous file in dir
    nnoremap <silent> ]f :<c-u>call <SID>next_file()<cr>
    nnoremap <silent> [f :<c-u>call <SID>previous_file()<cr>

    " [l or ]l go to next and previous error
    nnoremap <silent> [l :lprevious<cr>
    nnoremap <silent> ]l :lnext<cr>

    " [c or ]c go to next or previous vcs hunk

    " [w or ]w go to next or previous window
    nnoremap <silent> [w :call <SID>previous_window()<cr>
    nnoremap <silent> ]w :call <SID>next_window()<cr>

    " [t or ]t for next and previous tab
    nnoremap <silent> [t :tabprevious<cr>
    nnoremap <silent> ]t :tabnext<cr>

    " [p or ]p for p and P
    nnoremap <silent> [p P
    nnoremap <silent> ]p p

    " Select last paste
    nnoremap <silent><expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

    call SpaceVim#mapping#space#def('nnoremap', ['f', 'f'], "exe 'CtrlP ' . fnamemodify(bufname('%'), ':h')", '現在のバッファディレクトリ内のファイルを検索する', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 's'], 'write', '保存', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'S'], 'wall', '全バッファ保存', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'W'], 'write !sudo tee % >/dev/null', '管理者権限で強制的に保存', 1)
    " help mappings
    call SpaceVim#mapping#space#def('nnoremap', ['h', 'I'], 'call SpaceVim#issue#report()', 'Reporting an issue of SpaceVim', 1)
    if has('python3')
        call SpaceVim#mapping#space#def('nnoremap', ['h', 'i'], 'DeniteCursorWord help', 'カーソル上の単語でヘルプ検索(denite)', 1)
    else
        call SpaceVim#mapping#space#def('nnoremap', ['h', 'i'], 'UniteWithCursorWord help', 'カーソル上の単語でヘルプ検索(unite)', 1)
    endif
    call SpaceVim#mapping#space#def('nnoremap', ['h', 'l'], 'SPLayer -l', 'lists all the layers available in SpaceVim', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['h', 'm'], 'Unite manpage', 'search available man pages', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['h', 'k'], 'LeaderGuide "[KEYs]"', 'show top-level bindings with mapping guide', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['h', '[SPC]'], 'Unite help -input=SpaceVim', 'SpaceVimヘルプ', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['j', '0'], 'm`^', 'マーク行の行頭にジャンプ', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', '$'], 'm`g_', 'マーク行の行末にジャンプ', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'b'], '<C-o>', '前にジャンプ', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'f'], '<C-i>', '次にジャンプ', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'd'], 'VimFiler -no-split', 'カレントディレクトリ開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'D'], 'VimFiler', '別ウィンドウでカレントディレクトリを開く', 1)
    call SpaceVim#mapping#space#def('nmap', ['j', 'j'], '<Plug>(easymotion-prefix)s', 'easymotion 1文字', 0)
    call SpaceVim#mapping#space#def('nmap', ['j', 'J'], '<Plug>(easymotion-s2)', 'easymotion 2文字', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'k'], 'j==', '次のインデントにジャンプ', 0)
    call SpaceVim#mapping#space#def('nmap', ['j', 'l'], '<Plug>(easymotion-bd-jk)', '行ジャンプ(easymotion)', 0)
    call SpaceVim#mapping#space#def('nmap', ['j', 'v'], '<Plug>(easymotion-bd-jk)', '行ジャンプ(easymotion)', 0)
    call SpaceVim#mapping#space#def('nmap', ['j', 'w'], '<Plug>(easymotion-bd-w)', '単語ジャンプ(easymotion)', 0)
    call SpaceVim#mapping#space#def('nmap', ['j', 'q'], '<Plug>(easymotion-bd-jk)', '行ジャンプ(easymotion)', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'n'], "i\<cr>\<esc>", '行挿入', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'o'], "i\<cr>\<esc>k$", '下に行挿入', 0)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 's'], 'call call('
                \ . string(s:_function('s:split_string')) . ', [0])',
                \ 'split sexp', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'S'], 'call call('
                \ . string(s:_function('s:split_string')) . ', [1])',
                \ 'split-and-add-newline', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['w', 'r'], 'call call('
                \ . string(s:_function('s:next_window')) . ', [])',
                \ '画面ローテーション正方向', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['w', 'R'], 'call call('
                \ . string(s:_function('s:previous_window')) . ', [])',
                \ '画面ローテーション逆方向', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['j', 'u'], 'call call('
                \ . string(s:_function('s:jump_to_url')) . ', [])',
                \ 'URL文字にジャンプ', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['<Tab>'], 'try | b# | catch | endtry', '前回のバッファ', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'd'], 'call SpaceVim#mapping#close_current_buffer()', '現在のバッファを閉じる', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'D'],
                \ 'call SpaceVim#mapping#kill_visible_buffer_choosewin()',
                \ '現在のバッファを強制終了', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', '<C-d>'], 'call SpaceVim#mapping#clearBuffers()', '現在バッファ以外全終了', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'e'], 'call call('
                \ . string(s:_function('s:safe_erase_buffer')) . ', [])',
                \ '現在のバッファを空にする', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'h'], 'Startify', 'ホーム画面へ', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'm'], 'call call('
                \ . string(s:_function('s:open_message_buffer')) . ', [])',
                \ 'メッセージバッファを開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'P'], 'normal! ggdG"+P', 'バッファ内全てをコピー', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'R'], 'call call('
                \ . string(s:_function('s:safe_revert_buffer')) . ', [])',
                \ 'バッファ全体を元に戻す', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'Y'], 'normal! ggVG"+y``', 'バッファ内全てをヤンク', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'w'], 'setl readonly!', '読取専用モード', 1)
    let g:_spacevim_mappings_space.b.N = {'name' : '新しい空バッファを開く'}
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'N', 'h'], 'topleft vertical new', '左上に開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'N', 'j'], 'rightbelow new', '右下に開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'N', 'k'], 'new', '上に開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'N', 'l'], 'rightbelow vertical new', '右に開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['b', 'N', 'n'], 'enew', 'デフォルト場所に開く', 1)

    " file mappings
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'b'], 'Unite vim_bookmarks', 'ブックマーク', 1)
    let g:_spacevim_mappings_space.f.C = {'name' : 'ファイル/コンバート'}
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'C', 'd'], 'update | e ++ff=dos | w', 'LFからCRLF', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'C', 'u'], 'update | e ++ff=dos | setlocal ff=unix | w', 'CRLFからLF', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'D'], 'call call('
                \ . string(s:_function('s:delete_current_buffer_file')) . ', [])',
                \ '現在開いているファイルを削除する', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'F'], 'normal! gf', 'カーソル上のファイルを開く', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'r'], 'Unite file_mru', '最近開いたファイルを開く', 1)
    if g:spacevim_filemanager ==# 'vimfiler'
        call SpaceVim#mapping#space#def('nnoremap', ['f', 't'], 'VimFiler', 'ファイルツリートグル', 1)
        call SpaceVim#mapping#space#def('nnoremap', ['f', 'T'], 'VimFiler -no-toggle', 'ファイルツリーを見る', 1)
    elseif g:spacevim_filemanager ==# 'nerdtree'
        call SpaceVim#mapping#space#def('nnoremap', ['f', 't'], 'NERDTreeToggle', 'ファイルツリートグル', 1)
        call SpaceVim#mapping#space#def('nnoremap', ['f', 't'], 'NERDTree', 'ファイルツリー', 1)
    endif
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'y'], 'call zvim#util#CopyToClipboard()', 'ファイル名コピー', 1)
    let g:_spacevim_mappings_space.f.v = {'name' : '+Vim(SpaceVim)'}
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'v', 'v'], 'let @+=g:spacevim_version | echo g:spacevim_version', 'バージョン情報', 1)
    call SpaceVim#mapping#space#def('nnoremap', ['f', 'v', 'd'], 'SPConfig', 'カスタム設定を開く', 1)
endfunction

let s:file = SpaceVim#api#import('file')
let s:MESSAGE = SpaceVim#api#import('vim#message')

function! s:next_file() abort
    let dir = expand('%:p:h')
    let f = expand('%:t')
    let file = s:file.ls(dir, 1)
    if index(file, f) == -1
        call add(file,f)
    endif
    call sort(file)
    if len(file) != 1
        if index(file, f) == len(file) - 1
            exe 'e ' . dir . s:file.separator . file[0]
        else
            exe 'e ' . dir . s:file.separator . file[index(file, f) + 1]
        endif
    endif
endfunction

function! s:previous_file() abort
    let dir = expand('%:p:h')
    let f = expand('%:t')
    let file = s:file.ls(dir, 1)
    if index(file, f) == -1
        call add(file,f)
    endif
    call sort(file)
    if len(file) != 1
        if index(file, f) == 0
            exe 'e ' . dir . s:file.separator . file[-1]
        else
            exe 'e ' . dir . s:file.separator . file[index(file, f) - 1]
        endif
    endif
endfunction

function! s:next_window() abort
    try
        exe (winnr() + 1 ) . 'wincmd w'
    catch
        exe 1 . 'wincmd w'
    endtry
endfunction

function! s:previous_window() abort
    try
        if winnr() == 1
            exe winnr('$') . 'wincmd w'
        else
            exe (winnr() - 1 ) . 'wincmd w'
        endif
    catch
        exe winnr('$') . 'wincmd w'
    endtry
endfunction

function! s:split_string(newline) abort
    let syn_name = synIDattr(synID(line("."), col("."), 1), "name")
    if syn_name == &filetype . 'String'
        let c = col('.')
        let sep = ''
        while c > 0
            if s:is_string(line('.'), c)
                let c = c - 1
            else
                let sep = getline('.')[c]
                break
            endif
        endwhile
        if a:newline
            let save_register_m = @m
            let @m = sep . "\n" . sep
            normal! "mp
            let @m = save_register_m
        else
            let save_register_m = @m
            let @m = sep . sep
            normal! "mp
            let @m = save_register_m
        endif
    endif
endfunction

function! s:is_string(l,c) abort
    return synIDattr(synID(a:l, a:c, 1), "name") == &filetype . 'String'
endfunction

" function() wrapper
if v:version > 703 || v:version == 703 && has('patch1170')
    function! s:_function(fstr) abort
        return function(a:fstr)
    endfunction
else
    function! s:_SID() abort
        return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
    endfunction
    let s:_s = '<SNR>' . s:_SID() . '_'
    function! s:_function(fstr) abort
        return function(substitute(a:fstr, 's:', s:_s, 'g'))
    endfunction
endif

function! s:jump_to_url() abort
    let g:EasyMotion_re_anywhere = 'http[s]*://'
    call feedkeys("\<Plug>(easymotion-jumptoanywhere)")
endfunction

function! s:safe_erase_buffer() abort
    if s:MESSAGE.confirm('Erase content of buffer ' . expand('%:t'))
        normal! ggdG
    endif
    redraw!
endfunction

function! s:open_message_buffer() abort
    vertical topleft edit __Message_Buffer__
    setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline nospell nonumber norelativenumber
    setf message
    normal! ggdG
    silent put =execute(':message')
    normal! G
    setlocal nomodifiable
    nnoremap <silent> <buffer> q :silent bd<CR>
endfunction

function! s:safe_revert_buffer() abort
    if s:MESSAGE.confirm('Revert buffer form ' . expand('%:p'))
        edit!
    endif
    redraw!
endfunction

function! s:delete_current_buffer_file() abort
    if s:MESSAGE.confirm('本当に削除してよいですか?')
        let f = fnameescape(expand('%:p'))
        call SpaceVim#mapping#close_current_buffer()
        if delete(f) == 0
            echo "File '" . f . "' 削除成功"
        endif
    endif
    redraw!
    
endfunction

function! s:swap_buffer_with_nth_win(nr) abort
    if a:nr <= winnr('$') && a:nr != winnr()
        let cb = bufnr('%')
        let tb = winbufnr(a:nr)
        if cb != tb
            exe a:nr . 'wincmd w'
            exe 'b' . cb
            wincmd p
            exe 'b' . tb
        endif
    endif
endfunction

function! s:move_buffer_to_nth_win(nr) abort
    if a:nr <= winnr('$') && a:nr != winnr()
        let cb = bufnr('%')
        bp
        exe a:nr . 'wincmd w'
        exe 'b' . cb
        wincmd p
    endif
endfunction

function! s:buffer_transient_state() abort
    let state = SpaceVim#api#import('transient_state') 
    call state.set_title('Buffer Selection Transient State')
    call state.defind_keys(
                \ {
                    \ 'layout' : 'vertical split',
                    \ 'left' : [
                        \ {
                        \ 'key' : {
                                \ 'name' : 'C-1..C-9',
                                \ 'pos' : [[1,4], [6,9]],
                                \ 'handles' : [
                                        \ ["\<C-1>" , ''],
                                        \ ["\<C-2>" , ''],
                                        \ ["\<C-3>" , ''],
                                        \ ["\<C-4>" , ''],
                                        \ ["\<C-5>" , ''],
                                        \ ["\<C-6>" , ''],
                                        \ ["\<C-7>" , ''],
                                        \ ["\<C-8>" , ''],
                                        \ ["\<C-9>" , ''],
                                        \ ],
                                \ },
                        \ 'desc' : 'goto nth window',
                        \ 'func' : '',
                        \ 'cmd' : '',
                        \ 'exit' : 0,
                        \ },
                        \ {
                        \ 'key' : {
                                \ 'name' : '1..9',
                                \ 'pos' : [[1,2], [4,5]],
                                \ 'handles' : [
                                        \ ['1' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [1])'],
                                        \ ['2' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [2])'],
                                        \ ['3' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [3])'],
                                        \ ['4' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [4])'],
                                        \ ['5' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [5])'],
                                        \ ['6' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [6])'],
                                        \ ['7' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [7])'],
                                        \ ['8' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [8])'],
                                        \ ['9' , 'call call(' . string(s:_function('s:move_buffer_to_nth_win')) . ', [9])'],
                                        \ ],
                                \ },
                        \ 'desc' : 'move buffer to nth window',
                        \ 'func' : '',
                        \ 'cmd' : '',
                        \ 'exit' : 0,
                        \ },
                        \ {
                        \ 'key' : {
                                \ 'name' : 'M-1..M-9',
                                \ 'pos' : [[1,4], [6,9]],
                                \ 'handles' : [
                                        \ ["\<M-1>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [1])'],
                                        \ ["\<M-2>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [2])'],
                                        \ ["\<M-3>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [3])'],
                                        \ ["\<M-4>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [4])'],
                                        \ ["\<M-5>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [5])'],
                                        \ ["\<M-6>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [6])'],
                                        \ ["\<M-7>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [7])'],
                                        \ ["\<M-8>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [8])'],
                                        \ ["\<M-9>" , 'call call(' . string(s:_function('s:swap_buffer_with_nth_win')) . ', [9])'],
                                        \ ],
                                \ },
                        \ 'desc' : 'swap buffer with nth window',
                        \ 'func' : '',
                        \ 'cmd' : '',
                        \ 'exit' : 0,
                        \ },
                    \ ],
                    \ 'right' : [
                        \ {
                        \ 'key' : 'n',
                        \ 'desc' : 'next buffer',
                        \ 'func' : '',
                        \ 'cmd' : 'bnext',
                        \ 'exit' : 0,
                        \ },
                        \ {
                        \ 'key' : ['N', 'p'],
                        \ 'desc' : 'previous buffer',
                        \ 'func' : '',
                        \ 'cmd' : 'bp',
                        \ 'exit' : 0,
                        \ },
                        \ {
                        \ 'key' : 'd',
                        \ 'desc' : 'kill buffer',
                        \ 'func' : '',
                        \ 'cmd' : 'call SpaceVim#mapping#close_current_buffer()',
                        \ 'exit' : 0,
                        \ },
                        \ {
                        \ 'key' : 'q',
                        \ 'desc' : 'quit',
                        \ 'func' : '',
                        \ 'cmd' : '',
                        \ 'exit' : 1,
                        \ },
                    \ ],
                \ }
                \ )
    call state.open()
endfunction
