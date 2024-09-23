vim.diagnostic.config({
	severity_sort = true, -- ref. https://zenn.dev/vim_jp/articles/c62b397647e3c9
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})
