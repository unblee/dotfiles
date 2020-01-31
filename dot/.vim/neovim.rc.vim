set inccommand=split

" python
if IsWindows()
  let g:python3_host_prog = 'C:\Users\kasai\scoop\shims\python.exe'
else
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" terminal color settings
set termguicolors
let g:terminal_color_0  = "#000000" " black
let g:terminal_color_1  = "#cc0000" " red
let g:terminal_color_2  = "#4e9a06" " green
let g:terminal_color_3  = "#c4a000" " yellow
let g:terminal_color_4  = "#3465a4" " blue
let g:terminal_color_5  = "#75507b" " magenta
let g:terminal_color_6  = "#06989a" " cyan
let g:terminal_color_7  = "#d3d7cf" " white
let g:terminal_color_8  = "#555753" " bright black
let g:terminal_color_9  = "#ef2929" " bright red
let g:terminal_color_10 = "#8ae234" " bright green
let g:terminal_color_11 = "#fce94f" " bright yellow
let g:terminal_color_12 = "#739fcf" " bright blue
let g:terminal_color_13 = "#ad7fa8" " bright magenta
let g:terminal_color_14 = "#34e2e2" " bright cyan
let g:terminal_color_15 = "#eeeeec" " bright white
