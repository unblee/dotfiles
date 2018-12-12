let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_enter = 1
let g:ale_set_quickfix = 1
let g:ale_linters = {
      \ 'go': ['gometalinter'],
      \ }
let g:ale_go_gometalinter_options = '--vendor, --fast, --disable=gotype, --disable=gosec'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" formatter
let g:ale_fixers = {
      \   'rust': [
      \       'rustfmt',
      \   ],
      \}
let g:ale_fix_on_save = 1
