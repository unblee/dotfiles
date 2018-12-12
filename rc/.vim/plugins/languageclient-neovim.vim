let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'vue': ['vls'],
    \ }

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
