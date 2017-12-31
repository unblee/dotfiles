let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'}
let g:ctrlp_show_hidden = 1
if executable('files')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'files -A %s'
endif

