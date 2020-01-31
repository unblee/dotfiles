let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'stable', 'rls'],
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'vue': ['vls'],
      \ }

let g:LanguageClient_rootMarkers = {
      \ 'go': ['.git', 'go.mod'],
      \ }

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
