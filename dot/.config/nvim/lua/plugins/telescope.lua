return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			-- require
			local utils = require("telescope.utils")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			-- util func
			local function project_root_path()
				local git_root_path = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1])
				if git_root_path then
					return utils.path_expand(git_root_path)
				else
					return utils.path_expand(utils.buffer_dir())
				end
			end

			-- load extension
			require("telescope").load_extension("fzf")

			-- setup
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
			})

			vim.keymap.set("n", "fp", function()
				builtin.find_files({
					cwd = project_root_path(),
					hidden = true,
					no_ignore = true,
					no_ignore_parent = true,
					find_command = { "fd", "--hidden", "--no-ignore", "--exclude", ".git/", "--exclude", ".DS_Store" },
				})
			end)
			vim.keymap.set("n", "fr", function()
				builtin.live_grep({
					cwd = project_root_path(),
					additional_args = { "--hidden", "--smart-case", "--glob", "!.git/" },
				})
			end)
			vim.keymap.set("n", "ff", function()
				builtin.buffers({
					ignore_current_buffer = true,
					sort_lastused = true,
				})
			end)
		end,
	},

	{
		"prochri/telescope-all-recent.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"kkharji/sqlite.lua",
		},
	},
}
