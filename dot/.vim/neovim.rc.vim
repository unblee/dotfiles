set inccommand=split
set pumblend=20

" python
if IsWindows()
  let g:python3_host_prog = 'C:\Users\kasai\scoop\shims\python.exe'
else
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" Make Terminal default mode insert
augroup MyTerminal
  autocmd!
  autocmd TermOpen term://* set nonumber | startinsert
augroup END
