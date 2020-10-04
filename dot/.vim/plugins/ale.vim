" linters
" let g:ale_linters = {
"      \ 'go': ['golangci-lint'],
"      \ }

let g:ale_linters_ignore = {
      \ 'rust': ['rls', 'cargo', 'rustc'],
      \ }

" formatter
let g:ale_fixers = {
     \ 'go': ['goimports'],
     \ 'cpp': ['clang-format'],
     \}

let g:ale_fix_on_save = 1

" " golangci-lint
" let g:ale_go_golangci_lint_options = '--enable-all'
"      \ . ' -D wsl'
"      \ . ' -D maligned'
"      \ . ' -D gochecknoglobals'
"      \ . ' -D lll'

" common
let g:ale_disable_lsp = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_enter = 1
let g:ale_set_quickfix = 1
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
