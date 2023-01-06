-- go
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.go"},
  command = "setlocal noet ts=4 sw=4 sts=4"
})

-- typescript, typescriptreact, javascript, javascriptreact
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.ts", "*.tsx", "*.js", "*.jsx"},
  command = "setlocal et ts=4 sw=4 sts=4"
})
