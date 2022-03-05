augroup filetypedetect
  " Vagrantfile
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
  " Vue.js
  autocmd BufRead,BufNewFile *.vue set filetype=javascript
  " babel.js
  autocmd BufRead,BufNewFile .babelrc set filetype=json
augroup END

augroup filetypeindent
  autocmd BufRead,BufNewFile *.go setlocal noet ts=4 sw=4 sts=4
  autocmd BufRead,BufNewFile *.ts,*.tsx,*.js,*.jsx setlocal et ts=4 sw=4 sts=4
augroup END
