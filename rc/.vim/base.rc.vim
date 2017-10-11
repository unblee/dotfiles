" #######################################################
" # initialize
" #######################################################
" {{

" neovim
let s:isNeovim = has("nvim")
function! IsNeoVim() abort
  return s:isNeovim
endfunction

" gui
let s:isGUI = has("gui_running")
function! IsGUI() abort
  return s:isGUI
endfunction

" windows
let s:isWindows = has("win32") || has("win64")
function! IsWindows() abort
  return s:isWindows
endfunction

" rc directory
let s:rc_dir = $DOTFILES . "/rc/.vim"

" <Leader>キー(\)を ; に変更
let mapleader = ';'

" }}

" #######################################################
" # file type detect
" #######################################################
" {{

augroup filetypedetect
  " Vagrantfile
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
  " Vue.js
  autocmd BufRead,BufNewFile *.vue set filetype=javascript
  " babel.js
  autocmd BufRead,BufNewFile .babelrc set filetype=json
augroup END

" }}

" #######################################################
" # settings
" #######################################################
" {{

" scriptencoding
scriptencoding utf-8

" encode
set encoding=utf-8

" fileencode
set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp,euc-jp,default,latin

" fileformats
set fileformats=unix,dos,mac

" 行番号表示
set number

" 前の行のインデント量を継承する
set autoindent

" 入力された <Tab> を空白に変換
set expandtab

" <Tab>を含むファイルを開く際、<Tab>を何文字の空白にするか
set tabstop=2

" <Tab>を入力した際、何文字の空白にするか
set softtabstop=2

" 自動インデントの空白数
set shiftwidth=2

" 不可視文字を表示(e.g. tab,eol)
set list
set listchars=tab:>-

" カーソルが何行目の何文字目に置かれているかを表示
set ruler

" 常にステータスラインを表示"2"は常に表示という意味
set laststatus=2

" コマンドラインの高さ
set cmdheight=2

" いつタブページのラベルを表示するかを指定する
" 0:表示しない
" 1:2個以上のタブページがあるときのみ表示
" 2:常に表示
set showtabline=1

" 対応する括弧やブレース(中括弧)を表示
set showmatch

" カーソルが飛ぶ時間が0.1sの何倍か
set matchtime=1

" 画面の左右の端でスクロールが発生した場合何文字ずつスクロールするか
set sidescroll=1

" インクリメントサーチをする
set incsearch

" 検索するとき小文字のときは大文字と小文字を区別せず、大文字で検索するときは区別して検索する
set ignorecase
set smartcase

" 検索がファイル末尾まで進んだらファイルの先頭から再び検索する
set wrapscan

" wrap で行を折り返した時折り返された行もインデントする
if v:version == 704 && has('patch399')
  set breakindent
endif

" コマンド補完のとき<Tab>で補完一覧、<Tab><Tab>で完全補完
set wildmenu wildmode=list:longest,full

" コマンド履歴をいくつ残すか(いくつアンドゥできるか)
set history=10000

" エラー時の音とビジュアルベルの抑制
set noerrorbells
set novisualbell

" :helpコマンドで表示されるヘルプウィンドウの高さの最低値
set helpheight=20

" Backspaceで文字を消せるようにする
set backspace=indent,eol,start

" 左右のカーソル移動で行をまたいで移動できるようにする
set whichwrap=b,s,h,l,<,>,[,]

" カレント行の上下に必ず表示する行数
set scrolloff=10

" タイトルを表示
set title

" 現在のモードを表示する
set showmode

" 編集中でも保存しないで他のファイルを開けるようにする
set hidden

" 外部でファイルに変更がされた場合は読みなおす
set autoread

" ファイル保存時にバックアップファイルを作らない
set nobackup

" ファイル編集中にスワップファイルを作らない
set noswapfile

" 入力したコマンドをステータスライン上に表示
set showcmd

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" 補完の際の大文字小文字の区別をしない
set infercase

" 新しいウィンドウを下方向に開く
set splitbelow

" '<<'や'>>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround

" ウィンドウの最後の行が出来るだけ表示される
set display+=lastline

" 補完メニューの高さ
set pumheight=10

" updatetime(ms)
set updatetime=1000

" 80文字目で線を表示
set colorcolumn=80

" undo 履歴
set undofile
set undodir=~/.cache/vimundofile

" }}

" #######################################################
" # Key Mapping
" #######################################################
" {{

" <C-w> + HJKL でウィンドウサイズを変更
nnoremap <C-w>H <C-w><<CR>
nnoremap <C-w>J <C-w>-<CR>
nnoremap <C-w>K <C-w>+<CR>
nnoremap <C-w>L <C-w>><CR>

" visual mode でのインデント操作を繰り返し行えるようにする
vnoremap < <gv
vnoremap > >gv

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

" http://qiita.com/hokorobi/items/484cdc30577614318de5
augroup vimrc
    autocmd!
  augroup END
" grep プログラムに pt を指定
let &grepprg = 'pt --nogroup --nocolor --column'
" --column で桁を表示しているので %c も使うパターンを追加
set grepformat^=%f:%l:%c:%m
" grep 後に quickfix-window を表示
autocmd vimrc QuickFixCmdPost *grep* cwindow
" http://stackoverflow.com/questions/15393301/automatically-sort-quickfix-entries-by-line-text-in-vim
" pt で grep を実行した後に結果をパス順にしたかったので sort
autocmd! vimrc QuickFixCmdPost * call s:SortQuickfix('s:QfStrCmp')
function! s:SortQuickfix(fn)
  call setqflist(sort(getqflist(), a:fn))
endfunction
function! s:QfStrCmp(e1, e2)
  let [t1, t2] = [bufname(a:e1.bufnr), bufname(a:e2.bufnr)]
  return t1 <? t2 ? -1 : t1 ==? t2 ? 0 : 1
endfunction

" }}

" #######################################################
" # dein.vim settings
" #######################################################
" {{

" dein自体を自動インストールする
let s:dein_dir = expand("~/.cache/dein")
let s:dein_repo_dir = expand(s:dein_dir . "/repos/github.com/Shougo/dein.vim")
if !isdirectory(s:dein_repo_dir)
  call mkdir(s:dein_repo_dir, "p")
  call system('git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir)
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
" let s:toml_file = expand("~/dotfiles/rc/.vim/plugins.toml")
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:rc_dir . "/base.plugin.toml")
  if IsNeoVim()
    call dein#load_toml(s:rc_dir . "/neovim.plugin.toml")
  else
    call dein#load_toml(s:rc_dir . "/vim.plugin.toml")
  endif
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" プラグインとインデント設定を有効化
filetype plugin indent on
" syntax 有効化
syntax enable

" }}

" colorsheme
set background=dark
try
    colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" #######################################################
" # load settings specific to each editor
" #######################################################
" {{

" neovim
if IsNeoVim()
  runtime neovim.rc.vim
else
  " vim
  runtime vim.rc.vim
  " gvim
  if IsGUI()
    runtime gui.rc.vim
  endif
endif

" }}
