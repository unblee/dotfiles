" 旧プラグイン一覧メモ

" " colorscheme
" Plug 'cocopon/iceberg.vim'
" Plug 'gkeep/iceberg-dark'
" Plug 'joshdick/onedark.vim'
"
" " status line
" Plug 'itchyny/lightline.vim'
"
" " LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-neco'
" Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
"
" " C++
" Plug 'jackguo380/vim-lsp-cxx-highlight'
"
" " Linter
" " Plug 'dense-analysis/ale'
" " Plug 'maximbaz/lightline-ale'
"
" " golang
" Plug 'mattn/vim-goaddtags'
" Plug 'mattn/vim-goimports'
"
" " markdown
" Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }
"
" " vim
" Plug 'Shougo/neco-vim', { 'for': 'vim' }
"
" " javascript
" Plug 'pangloss/vim-javascript'
"
" " typescript
" Plug 'HerringtonDarkholme/yats.vim'
"
" " react
" Plug 'maxmellon/vim-jsx-pretty'
"
" " styled-jsx
" Plug 'alampros/vim-styled-jsx'
"
" " 現在のカーソル位置のコンテキストによって filetype を切り換える
" " Plug 'Shougo/context_filetype.vim'
" " Plug 'osyo-manga/vim-precious'
"
" " toml
" Plug 'cespare/vim-toml', { 'for': 'toml' }
"
" " " ランチャ
" " Plug 'ctrlpvim/ctrlp.vim'
" " " ctrl matcher
" " Plug 'FelikZ/ctrlp-py-matcher'
"
" " 移動支援
" Plug 'easymotion/vim-easymotion'
"
" " 日本語ヘルプ
" Plug 'vim-jp/vimdoc-ja'
"
" " インデントレベル可視化
" Plug 'Yggdroot/indentLine'
"
" " 行末スペース可視化
" Plug 'ntpeters/vim-better-whitespace'
"
" " コメントIN/OUT切り替え
" Plug 'tyru/caw.vim'
"
" " テキストオブジェクト拡張
" Plug 'kana/vim-textobj-user'
" " b でほとんどのブロックを指定できる
" Plug 'rhysd/vim-textobj-anyblock'
" " I, A で矩形選択をテキストオブジェクトにする
" Plug 'osyo-manga/vim-textobj-blockwise'
" " f<any> で<any>に指定した任意の区切り文字の間を指定できる
" Plug 'thinca/vim-textobj-between'
" " l で行を指定できる
" Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-operator-user'
"
" " テキストを囲うものを編集
" Plug 'rhysd/vim-operator-surround'
"
" " nginx
" Plug 'chr4/nginx.vim', { 'for': 'nginx' }
"
" " yaml
" Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
"
" " systemd unit file
" Plug 'Matt-Deacalion/vim-systemd-syntax'
"
" " editorConfig
" Plug 'editorconfig/editorconfig-vim'
"
" " git sign
" Plug 'airblade/vim-gitgutter'
"
" " 背景透過
" " Plug 'miyakogi/seiya.vim'
"
" " ビジュアル選択した状態でIやAを入力した場合でも
" " 行頭や行末に文字列を挿入してくれるようになる
" Plug 'kana/vim-niceblock'
"
" " undo 履歴の表示
" Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
"
" " ヤンクオペレータの範囲をハイライト
" Plug 'haya14busa/vim-operator-flashy'
"
" " json
" Plug 'elzr/vim-json', { 'for': 'json' }
"
" " html5
" Plug 'othree/html5.vim', { 'for': 'html' }
"
" " window select
" Plug 't9md/vim-choosewin'
"
" " align
" Plug 'junegunn/vim-easy-align'
"
" " J 結合拡張
" Plug 'osyo-manga/vim-jplus'
" Plug 'AndrewRadev/splitjoin.vim'
"
" " カーソル下にある単語をハイライト
" Plug 't9md/vim-quickhl'
"
" " 検索拡張
" Plug 'haya14busa/is.vim'
" Plug 'haya14busa/vim-asterisk'
" " 検索マッチ数表示
" Plug 'osyo-manga/vim-anzu'
"
" " sudo save
" Plug 'lambdalisue/suda.vim'
"
" " fuzzy finder
" if executable('fzf')
"   Plug 'junegunn/fzf'
"   Plug 'junegunn/fzf.vim'
" endif
"
" " window resizer
" " Ctrl + e
" Plug 'simeji/winresizer'
"
" " terraform
" Plug 'hashivim/vim-terraform'
"
" " direnv
" Plug 'direnv/direnv.vim'
"
" " filer
" Plug 'lambdalisue/fern.vim'
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-mapping-project-top.vim'
"
" " git blame
" Plug 'rhysd/git-messenger.vim'
"
" " better '%'
" Plug 'andymass/vim-matchup'
"
" " git branch name
" Plug 'itchyny/vim-gitbranch'
"
" " brackets
" Plug 'jiangmiao/auto-pairs'
"
" " format json
" " Plug 'rhysd/vim-fixjson', {'for': 'json'}
"
" " " highlight
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " updating the parsers on update
"
" " post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
" \ 'do': 'yarn install --frozen-lockfile --production',
" \ 'for': [ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'graphql', 'vue', 'svelte', 'html' ] }
" "\ 'for': [ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html' ] }

" 旧 coc-settings.json メモ
" {
"   "coc.preferences.formatOnSaveFiletypes": [
"     "css",
"     "graphql",
"     "html",
"     "less",
"     "markdown",
"     "rust",
"     "scss",
"     "yaml"
"   ],
"   "diagnostic.enableMessage": "never",
"   "diagnostic.virtualText": true,
"   "diagnostic.virtualTextCurrentLineOnly": false,
"   "diagnostic.errorSign": "🚫 ",
"   "suggest.noselect": false,
"   "go.goplsOptions": {
"     "gofumpt": true,
"     "completeUnimported": true,
"     "buildFlags": [
"       "-tags=wireinject"
"     ]
"   },
"   "rust-analyzer.checkOnSave.command": "clippy",
"   "languageserver": {
"     "golangci-lint-languageserver": {
"       "command": "golangci-lint-langserver",
"       "filetypes": ["go"],
"       "initializationOptions": {
"         "command": [
"           "golangci-lint",
"           "run",
"           "--out-format", "json",
"           "--enable-all",
"           "--disable", "funlen",
"           "--disable", "gochecknoglobals",
"           "--disable", "gochecknoinits",
"           "--disable", "gomnd",
"           "--disable", "lll",
"           "--disable", "maligned",
"           "--disable", "nlreturn",
"           "--disable", "varnamelen",
"           "--disable", "wsl"
"         ]
"       }
"     }
"   }
" }
