" vim-plugの自動インストール
let s:plug_dir = expand("~/.vim-plug")
let s:plugged_dir = expand(s:plug_dir . "/plugged")
let &runtimepath = s:plug_dir . "," . &runtimepath
if !isdirectory(s:plugged_dir)
  let s:plug_clone_cmd = 'git clone https://github.com/junegunn/vim-plug.git ' . s:plug_dir . "/autoload"
  echo s:plug_clone_cmd
  call system(s:plug_clone_cmd)
  call mkdir(s:plugged_dir, "p")
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" インストールされていないプラグインを自動インストール
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" プラグイン一覧 {{
call plug#begin(s:plugged_dir)

  " colorscheme
  Plug 'joshdick/onedark.vim'

  " status line
  Plug 'itchyny/lightline.vim'

  " completion framework
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " golang
  Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go' }
  Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }

  " markdown
  Plug 'fszymanski/deoplete-emoji', { 'for': 'markdown' }
  Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }

  " 現在のカーソル位置のコンテキストによって filetype を切り換える
  Plug 'Shougo/context_filetype.vim'
  Plug 'osyo-manga/vim-precious'

  " toml
  Plug 'cespare/vim-toml', { 'for': 'toml' }

  " ランチャ
  Plug 'ctrlpvim/ctrlp.vim'
  " ctrl matcher
  Plug 'FelikZ/ctrlp-py-matcher'
  " ctrlp command palette
  Plug 'fisadev/vim-ctrlp-cmdpalette'

  " 移動支援
  Plug 'easymotion/vim-easymotion'

  " f 拡張
  Plug 'rhysd/clever-f.vim'

  " 日本語ヘルプ
  Plug 'vim-jp/vimdoc-ja'

  " インデントレベル可視化
  Plug 'Yggdroot/indentLine'

  " 行末スペース可視化
  Plug 'ntpeters/vim-better-whitespace'

  " コメントIN/OUT切り替え
  Plug 'tyru/caw.vim'

  " 対応する括弧の自動入力
  Plug 'cohama/lexima.vim'

  " テキストオブジェクト拡張
  Plug 'kana/vim-textobj-user'
  " b でほとんどのブロックを指定できる
  Plug 'rhysd/vim-textobj-anyblock'
  " I, A で矩形選択をテキストオブジェクトにする
  Plug 'osyo-manga/vim-textobj-blockwise'
  " f<any> で<any>に指定した任意の区切り文字の間を指定できる
  Plug 'thinca/vim-textobj-between'
  " l で行を指定できる
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-operator-user'

  " テキストを囲うものを編集
  Plug 'rhysd/vim-operator-surround'

  " nginx
  Plug 'chr4/nginx.vim', { 'for': 'nginx' }

  " yaml
  Plug 'stephpy/vim-yaml', { 'for': 'yaml' }

  " systemd unit file
  Plug 'Matt-Deacalion/vim-systemd-syntax'

  " editorConfig
  Plug 'editorconfig/editorconfig-vim'

  " git sign
  Plug 'airblade/vim-gitgutter'

  " dockerfile
  Plug 'moby/moby', { 'rtp': '/contrib/syntax/vim/' }

  " 背景透過
  Plug 'miyakogi/seiya.vim'

  " asynchronous linter
  Plug 'w0rp/ale'

  " ビジュアル選択した状態でIやAを入力した場合でも
  " 行頭や行末に文字列を挿入してくれるようになる
  Plug 'kana/vim-niceblock'

  " undo 履歴の表示
  Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }

  " ヤンクオペレータの範囲をハイライト
  Plug 'haya14busa/vim-operator-flashy'

  " json
  Plug 'elzr/vim-json', { 'for': 'json' }

  " html5
  Plug 'othree/html5.vim', { 'for': 'html' }

  " window select
  Plug 't9md/vim-choosewin'

  " align
  Plug 'junegunn/vim-easy-align'

  " J 結合拡張
  Plug 'osyo-manga/vim-jplus'

  " カーソル下にある単語をハイライト
  Plug 't9md/vim-quickhl'

  " 検索拡張
  Plug 'haya14busa/is.vim'
  Plug 'haya14busa/vim-asterisk'
  " 検索マッチ数表示
  Plug 'osyo-manga/vim-anzu'

  " sudo save
  Plug 'lambdalisue/suda.vim'

  " filer
  Plug 'cocopon/vaffle.vim'

call plug#end()
" }}

" colorsheme
set background=dark
try
    colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry
