" 行単位ではなく表示された文字を移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" w!! でスーパユーザ sudo 保存
cnoremap w!! w !sudo tee > /dev/null %

" ヤンクでクリップボードにコピー
" set clipboard+=unnamed,autoselect
vnoremap <Leader>y "+y

" タブ移動
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

nmap <C-w>v <C-w>v<C-w><C-w>
