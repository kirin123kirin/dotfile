" Set options and add mapping such that Vim behaves a lot like MS-Windows
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Feb 09

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
    " CTRL-X are Cut
    vnoremap <C-X> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y

    " CTRL-V and SHIFT-Insert are Paste
    imap <C-V>		"+gP
    map <S-Insert>		<LEFT>"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+
endif

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

if 1
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif

" imap <S-Insert> <C-V>
" vmap <S-Insert> <C-V>

imap <C-q> <Esc>:q<CR>
map <C-q> :q<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-s>		:update<CR>
vnoremap <C-s>		<C-C>:update<CR>
inoremap <C-s>		<C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-PageDown is Next window
map <silent><C-PageUp> :tabp<CR>
imap <silent><C-PageUp> <ESC>:tabp<CR>
cmap <silent><C-PageUp> <ESC>:tabp<CR>
map <silent><C-PageDown> :tabn<CR>
imap <silent><C-PageDown> <ESC>:tabn<CR>
cmap <silent><C-PageDown> <ESC>:tabn<CR>

if has("gui")
  " CTRL-F is the search dialog
  noremap <C-f> :promptrepl<CR>
  inoremap <C-f> <C-\><C-O>:promptrepl<CR>
  cnoremap <C-f> <C-\><C-C>:promptrepl<CR>
endif



" vim: set sw=2 :
