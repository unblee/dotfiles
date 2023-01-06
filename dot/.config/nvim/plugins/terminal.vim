function! CdGitRootDir()
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  if root != '.'
    " change directory to git root if there is git root
    execute 'lcd ' . root
  else
    " change directory to current buffer directory if there isn't git root
    execute 'lcd %:h'
  endif
endfunction
nnoremap <silent> <space>t  :split \| resize 20 \| call CdGitRootDir() \| terminal<cr>
