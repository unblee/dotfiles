let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W-'
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['E %d', 'W %d', '']
let g:ale_echo_msg_format = '[%linter%] %s'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
