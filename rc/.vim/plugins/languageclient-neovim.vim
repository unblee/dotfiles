let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
