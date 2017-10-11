" タスクバーを非表示
set guioptions-=T

" フォント設定
if IsWindows()
  set guifont=CicaE:h12:qANTIALIASED
else
  set guifont=CicaE\ 12
endif

 GVIMのメニュー文字化け防止
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" フォントアンチエイリアス
if IsWindows()
  set renderoptions=type:directx,renmode:5
endif
