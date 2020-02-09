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

" カーソルが何行目の何文字目に置かれているかを表示
set ruler

" 常にステータスラインを表示"2"は常に表示という意味
set laststatus=2

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
set hlsearch

" 検索するとき小文字のときは大文字と小文字を区別せず、大文字で検索するときは区別して検索する
set ignorecase
set smartcase

" 検索がファイル末尾まで進んだらファイルの先頭から再び検索する
set wrapscan

" wrap で行を折り返した時折り返された行もインデントする
set breakindent

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
set updatetime=100

" 80文字目で線を表示
set colorcolumn=80

" undo 履歴
set undofile
set undodir=~/.cache/vimundofile

" <Leader>キー(\)を ; に変更
let mapleader = ';'
