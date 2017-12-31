nnoremap <Leader>e :Vaffle<CR>
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

function! s:customize_vaffle_mappings() abort
  nmap <Bslash> <Plug>(vaffle-open-root)
  nmap K        <Plug>(vaffle-mkdir)
  nmap N        <Plug>(vaffle-new-file)
endfunction

augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
