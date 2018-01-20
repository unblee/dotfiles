" 行単位ではなく表示された文字を移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" insert mode でも hjkl で移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" w!! でスーパユーザ sudo 保存
cnoremap w!! w !sudo tee > /dev/null %

" ヤンクでクリップボードにコピー
" set clipboard+=unnamed,autoselect
vnoremap <Leader>y "+y

" インクリメント、デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" タブ移動
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
