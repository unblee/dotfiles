return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			-- settings
			local lint = require("lint")
			lint.linters_by_ft = {
				go = { "golangcilint" },
				rust = { "clippy" },
				javascript = { "biomejs" },
				typescript = { "biomejs" },
				javascriptreact = { "biomejs" },
				typescriptreact = { "biomejs" },
				ruby = { "rubocop" },
				terraform = { "tflint", "tfsec" },
			}

			-- customize linter option

      -- stylua: ignore
			lint.linters.golangcilint.args = {
				"run",
				"--out-format", "json",
				"--show-stats=false",
				"--print-issued-lines=false",
				"--print-linter-name=false",
				-- "--enable-all",
				-- "--disable", "funlen",
				-- "--disable", "gochecknoglobals",
				-- "--disable", "gochecknoinits",
				-- "--disable", "gomnd",
				-- "--disable", "lll",
				-- "--disable", "maligned",
				-- "--disable", "nlreturn",
				-- "--disable", "varnamelen",
				-- "--disable", "wsl",
				function()
					return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
				end,
			}

			-- create autocmd
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
