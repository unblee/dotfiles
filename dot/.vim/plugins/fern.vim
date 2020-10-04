let g:fern#renderer = "devicons"
let g:fern#default_hidden = 1

nnoremap <silent><space>f  :Fern . -drawer -toggle -reveal=%<cr>

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup MyFern
  autocmd!
  autocmd FileType fern set nonumber | call s:init_fern()
augroup END
