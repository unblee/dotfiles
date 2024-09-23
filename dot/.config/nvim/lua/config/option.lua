-- 行番号表示
vim.opt.number = true

-- 前の行のインデント量を継承する
vim.opt.autoindent = true

-- 入力された <Tab> を空白に変換
vim.opt.expandtab = true

-- <Tab>を含むファイルを開く際、<Tab>を何文字の空白にするか
vim.opt.tabstop = 2

-- <Tab>を入力した際、何文字の空白にするか
vim.opt.softtabstop = 2

-- 自動インデントの空白数
vim.opt.shiftwidth = 2

-- 不可視文字を表示(e.g. tab,eol)
vim.opt.list = true
vim.opt.listchars:append({ tab = "→ " })

-- カーソルが何行目の何文字目に置かれているかを表示
vim.opt.ruler = true

-- 常にステータスラインを表示"2"は常に表示という意味
vim.opt.laststatus = 2

-- いつタブページのラベルを表示するかを指定する
-- 0:表示しない
-- 1:2個以上のタブページがあるときのみ表示
-- 2:常に表示
vim.opt.showtabline = 1

-- 対応する括弧やブレース(中括弧)を表示
vim.opt.showmatch = true

-- カーソルが飛ぶ時間が0.1sの何倍か
vim.opt.matchtime = 1

-- 画面の左右の端でスクロールが発生した場合何文字ずつスクロールするか
vim.opt.sidescroll = 1

-- インクリメントサーチをする
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- 検索するとき小文字のときは大文字と小文字を区別せず、大文字で検索するときは区別して検索する
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 検索がファイル末尾まで進んだらファイルの先頭から再び検索する
vim.opt.wrapscan = true

-- wrap で行を折り返した時折り返された行もインデントする
vim.opt.breakindent = true

-- コマンド履歴をいくつ残すか(いくつアンドゥできるか)
vim.opt.history = 10000

-- :helpコマンドで表示されるヘルプウィンドウの高さの最低値
vim.opt.helpheight = 20

-- Backspaceで文字を消せるようにする
vim.opt.backspace = "indent,eol,start"

-- 左右のカーソル移動で行をまたいで移動できるようにする
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"

-- カレント行の上下に必ず表示する行数
vim.opt.scrolloff = 10

-- タイトルを表示
vim.opt.title = true

-- 現在のモードを表示する
vim.opt.showmode = true

-- 編集中でも保存しないで他のファイルを開けるようにする
vim.opt.hidden = true

-- 外部でファイルに変更がされた場合は読みなおす
vim.opt.autoread = true

-- 入力したコマンドをステータスライン上に表示
vim.opt.showcmd = true

-- 補完の際の大文字小文字の区別をしない
vim.opt.infercase = true

-- 新しいウィンドウを下方向に開く
vim.opt.splitbelow = true

-- '<<'や'>>'でインデントする際に'shiftwidth'の倍数に丸める
vim.opt.shiftround = true

-- 補完メニューの高さ
vim.opt.pumheight = 10

-- updatetime(ms)
vim.opt.updatetime = 100

-- undo 履歴
vim.opt.undofile = true
vim.opt.undodir = "/Users/unblee/.cache/vimundofile"

-- <Leader>キー(\)を ; に変更
vim.g.mapleader = ";"

-- don't display the mode information in the statusline
-- vim.opt.noshowmode = true

-- Character to be displayed on the inactive status line
-- vim.opt.fillchars += "stlnc:-"

vim.opt.inccommand = "split"
vim.opt.pumblend = 10

-- swap file
vim.opt.swapfile = false
-- backup file
vim.opt.backup = false

-- spell
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- always show signcolumns
vim.opt.signcolumn = "yes:2"

-- truecolor
vim.opt.termguicolors = true
