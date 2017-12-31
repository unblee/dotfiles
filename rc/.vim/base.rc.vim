" scriptencoding
scriptencoding utf-8

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

" load runtime config
runtime option.rc.vim
runtime keymap.rc.vim
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
runtime filetype.rc.vim
" runtime dein.rc.vim
runtime plug.rc.vim
runtime! plugins/*.vim

" " http://qiita.com/hokorobi/items/484cdc30577614318de5
" augroup vimrc
"     autocmd!
" augroup END
" " grep プログラムに pt を指定
" let &grepprg = 'pt --nogroup --nocolor --column'
" " --column で桁を表示しているので %c も使うパターンを追加
" set grepformat^=%f:%l:%c:%m
" " grep 後に quickfix-window を表示
" autocmd vimrc QuickFixCmdPost *grep* cwindow
" " http://stackoverflow.com/questions/15393301/automatically-sort-quickfix-entries-by-line-text-in-vim
" " pt で grep を実行した後に結果をパス順にしたかったので sort
" autocmd! vimrc QuickFixCmdPost * call s:SortQuickfix('s:QfStrCmp')
" function! s:SortQuickfix(fn)
"   call setqflist(sort(getqflist(), a:fn))
" endfunction
" function! s:QfStrCmp(e1, e2)
"   let [t1, t2] = [bufname(a:e1.bufnr), bufname(a:e2.bufnr)]
"   return t1 <? t2 ? -1 : t1 ==? t2 ? 0 : 1
" endfunction
