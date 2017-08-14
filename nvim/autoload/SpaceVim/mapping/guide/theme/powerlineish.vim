" the theme colors should be 
" [
"    \ [ a_guifg, a_guibg, a_ctermfg, a_ctermbg],
"    \ [ b_guifg, b_guibg, b_ctermfg, b_ctermbg],
"    \ [ c_guifg, c_guibg, c_ctermfg, c_ctermbg],
"    \ [ z_guibg, z_ctermbg],
"    \ [ i_guifg, i_guibg, i_ctermfg, i_ctermbg],
"    \ [ v_guifg, v_guibg, v_ctermfg, v_ctermbg],
"    \ [ r_guifg, r_guibg, r_ctermfg, r_ctermbg],
" \ ]

function! SpaceVim#mapping#guide#theme#powerlineish#palette() abort
    return [
                \ [ '#005f00' , '#afd700' , 22  , 148 ],
                \ [ '#9e9e9e' , '#303030' , 247 , 236 ],
                \ [ '#ffffff' , '#121212' , 231 , 233 ],
                \ ['#465457', 67],
                \ [ '#005f00' , '#afd700' , 22  , 148 ],
                \ [ '#005f00' , '#afd700' , 22  , 148 ],
                \ [ '#005f00' , '#afd700' , 22  , 148 ],
                \ ]
endfunction
