return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				component_separators = "",
				section_separators = "",
				disabled_filetypes = {
					"neo-tree",
				},
			},
			extensions = {
				"quickfix",
				"lazy",
				"neo-tree",
			},
		},
	},

	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			chunk = {
				enable = true,
				delay = 0,
				use_treesitter = true,
			},
			indent = {
				enable = true,
				use_treesitter = true,
			},
			line_num = {
				enable = true,
				use_treesitter = true,
			},
		},
	},

	{
		"petertriho/nvim-scrollbar",
		config = function()
			local colors = require("tokyonight.colors").setup()

			require("scrollbar").setup({
				excluded_filetypes = {
					"cmp_docs",
					"cmp_menu",
					"noice",
					"prompt",
					"TelescopePrompt",
					"lazy",
					"neo-tree",
					"neo-tree-popup",
				},
				handle = {
					color = colors.bg_highlight,
				},
				marks = {
					Search = { color = colors.orange },
					Error = { color = colors.error },
					Warn = { color = colors.warning },
					Info = { color = colors.info },
					Hint = { color = colors.hint },
					Misc = { color = colors.purple },
				},
				handlers = {
					cursor = true,
					diagnostic = true,
					gitsigns = true, -- Requires gitsigns
					handle = true,
					search = false, -- Requires hlslens
					ale = false, -- Requires ALE
				},
			})
		end,
	},

	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("scrollbar.handlers.search").setup({
				calm_down = true,
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = { "qf" },
	},

	{
		"norcalli/nvim-colorizer.lua",
	},
}
