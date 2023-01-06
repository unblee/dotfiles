" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! CocCurrentFunction()
    return winwidth(0) > 70 ? get(b:, 'coc_current_function', '') : ''
endfunction

let g:lightline = {}

let g:lightline.colorscheme = 'icebergDark'
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.inactive.middle = [ [ "#ABB2BF", "#161821", "145", "233" ] ]
let s:palette.inactive.right = [ [ "#ABB2BF", "#161821", "145", "233" ] ]
let s:palette.inactive.left = [ [ "#ABB2BF", "#161821", "145", "233" ] ]
let s:palette.normal.middle = [ [ "#ABB2BF", "#161821", "145", "233" ] ]
let s:palette.tabline.middle = [ [ "#ABB2BF", "#161821", "145", "233" ] ]

let g:lightline.separator = { 'left': ' ', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline.inactive = {}
let g:lightline.inactive.left = []
let g:lightline.inactive.right = []

let g:lightline.active = {}
let g:lightline.active.left = [
     \   [ 'mode' ], [ 'filename' ], [ 'cocstatus', 'currentfunction' ], [ 'ctrlpmark' ]
     \ ]
let g:lightline.active.right = [
     \ [], [], [ 'fileformat', 'fileencoding', 'filetype' ]
     \ ]

let g:lightline.component_function = {
     \   'filename': 'LightlineFilename',
     \   'fileformat': 'LightlineFileformat',
     \   'filetype': 'LightlineFiletype',
     \   'fileencoding': 'LightlineFileencoding',
     \   'mode': 'LightlineMode',
     \   'ctrlpmark': 'CtrlPMark',
     \   'cocstatus': 'coc#status',
     \   'currentfunction': 'CocCurrentFunction',
     \ }

function! LightlineModified()
  return &ft =~ 'help\|fern' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|fern' && &readonly ? "RO" : ''
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  let path = expand('%:p')
  if path =~ '^term:'
    return ''
  endif
  if path =~ '^' . $GHQ_ROOT . '/'
    let path = path[len($GHQ_ROOT)+1:]
  endif
  if path =~ '^' . $HOME . '/'
    let path = '~/' . path[len($HOME)+1:]
  endif
  return winwidth(0) > 70 ? path == 'ControlP' ? g:lightline.ctrlp_item :
      \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
      \ ('' != path ? path : '[No Name]') .
      \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
      \ : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
       \ &ft == 'fern' ? 'Fern' :
       \ winwidth(0) > 70 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
         \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
     \ 'main': 'CtrlPStatusFunc_1',
     \ 'prog': 'CtrlPStatusFunc_2',
     \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction
