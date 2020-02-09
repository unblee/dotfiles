set inccommand=split
set pumblend=20

" python
if IsWindows()
  let g:python3_host_prog = 'C:\Users\kasai\scoop\shims\python.exe'
else
  let g:python3_host_prog = '/usr/local/bin/python3'
endif
