let g:fern#renderer = "devicons"

nnoremap <silent><space>f  :Fern . -drawer -toggle -reveal=%<cr>

augroup MyFern
  autocmd!
  autocmd FileType fern set nonumber
augroup END
