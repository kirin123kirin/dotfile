augroup startify_map
  au!
  if !exists('g:startify_custom_header')
    autocmd FileType startify call <SID>update_logo()
  endif
  autocmd FileType startify setl scrolloff=0 nowrap
augroup END
