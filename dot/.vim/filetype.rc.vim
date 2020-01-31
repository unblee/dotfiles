augroup filetypedetect
  " Vagrantfile
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
  " Vue.js
  autocmd BufRead,BufNewFile *.vue set filetype=javascript
  " babel.js
  autocmd BufRead,BufNewFile .babelrc set filetype=json
augroup END
