return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
				rust = { "rustfmt" },
				terraform = { "terraform_fmt" },
				javascript = { "biome" },
				typescript = { "biome" },
			},
			format_after_save = {},
		},
	},

	{
		"cappyzawa/trim.nvim",
		opts = {
			ft_blocklist = {
				"markdown",
				"lazy",
				"TelescopePrompt",
			},
			highlight = true,
		},
	},

	{
		"vidocqh/auto-indent.nvim",
		opts = {
			indentexpr = function(lnum)
				return require("nvim-treesitter.indent").get_indent(lnum)
			end,
		},
	},
}
