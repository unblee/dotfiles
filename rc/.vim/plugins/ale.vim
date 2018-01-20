let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
      \ 'go': ['gometalinter'],
      \ }
let g:ale_go_gometalinter_options = '--vendor --fast --enable=deadcode --enable=staticcheck --enable=gosimple --enable=unused'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
