let g:neoterm_autoinsert = 1

nnoremap <silent> gs :Ttoggle \| :T git status --short --branch<CR>
nnoremap <silent> gi :Ttoggle \| :T git diff<CR>

nnoremap <silent> <c-t> :Ttoggle<CR>
tnoremap <silent> <c-t> <C-\><C-n>:Ttoggle<CR>
