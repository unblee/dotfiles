command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim-plug/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --glob="!.git/" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--reverse --delimiter : --nth 4..'}), <bang>0)

nmap <silent> <C-p> :Files<CR>
nnoremap <silent> fp :Files<CR>
nnoremap <silent> ff :Buffers<CR>
nnoremap <silent> fl :BLines<CR>
nnoremap <silent> fh :History<CR>
nnoremap <silent> fr :Rg<CR>
