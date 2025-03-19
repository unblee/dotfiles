return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = "all",
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			endwise = { enable = true },
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({
				check_ts = true,
			})
			npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
		end,
	},

	{
		"windwp/nvim-ts-autotag",
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "<c-_>", "<Plug>(comment_toggle_linewise_current)", mode = "n", desc = "Toggle comment in normal mode" },
			{ "<c-_>", "<Plug>(comment_toggle_linewise_visual)", mode = "v", desc = "Toggle comment in visual mode" },
		},
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {},
	},

	{
		"RRethy/nvim-treesitter-endwise",
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
