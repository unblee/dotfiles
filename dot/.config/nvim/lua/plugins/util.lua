return {
	{
		"nvim-tree/nvim-web-devicons",
	},

	{
		"Wansmer/treesj",
		keys = { "<leader>m", "<leader>M" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local treesj = require("treesj")
			treesj.setup({
				use_default_keymaps = false,
				max_join_length = 10000,
			})
			vim.keymap.set("n", "<leader>m", treesj.toggle)
			vim.keymap.set("n", "<leader>M", function()
				treesj.toggle({ split = { recursive = true } })
			end)
		end,
	},

	-- { "kana/vim-textobj-user", lazy = false },
	-- { "kana/vim-textobj-line", lazy = false, dependencies = { "kana/vim-textobj-user" } },
	-- { "haya14busa/vim-operator-flashy", lazy = false, dependencies = { "kana/vim-textobj-user" } },

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
	},

	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		preset = "modern",
	-- 	},
	-- },

	{
		"almo7aya/openingh.nvim",
		cmd = {
			"OpenInGHRepo",
			"OpenInGHFile",
			"OpenInGHFileLines",
		},
	},

	{
		"smoka7/hop.nvim",
		event = "VeryLazy",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
    -- stylua: ignore
		keys = {
			{ "<leader><leader>", mode = { "n", "x", "o" }, function() require("hop").hint_words() end },
			{ "<leader>j", mode = { "n", "x", "o" }, function() require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.AFTER_CURSOR }) end },
			{ "<leader>k", mode = { "n", "x", "o" }, function() require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR }) end },
			{ "<leader>h", mode = { "n", "x", "o" }, function() require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true }) end },
			{ "<leader>l", mode = { "n", "x", "o" }, function() require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }) end },
		},
	},

	{
		"t9md/vim-quickhl",
		event = "VeryLazy",
		keys = {
			{ "m", mode = { "n", "x" }, "<Plug>(quickhl-manual-this)" },
			{ "M", mode = { "n", "x" }, "<Plug>(quickhl-manual-reset)" },
		},
	},
}
