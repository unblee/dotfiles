" core
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'member', 'omni']
let g:deoplete#file#enable_buffer_path = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" golang
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
