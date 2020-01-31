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
runtime plug.rc.vim
runtime! plugins/*.vim
