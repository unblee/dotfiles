return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{
				"<space>",
				mode = { "n" },
				function()
					local function project_root_path()
						local git_root_path =
							vim.fn.expand(vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]))
						if git_root_path then
							return git_root_path
						else
							return "./"
						end
					end
					require("neo-tree.command").execute({
						dir = project_root_path(),
						toggle = true,
					})
				end,
			},
		},
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
					never_show = {
						".DS_Store",
						".git",
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				use_libuv_file_watcher = true,
			},
			window = {
				width = 35,
				mappings = {
					["<space>"] = "",
					["l"] = "open",
					["h"] = "close_node",
					["e"] = "open",
				},
			},
		},
	},
}
