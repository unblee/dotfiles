return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({})

			local function project_root_path()
				local git_root_path = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1])
				if git_root_path then
					return utils.path_expand(git_root_path)
				else
					return utils.path_expand(utils.buffer_dir())
				end
			end

			vim.keymap.set({ "n", "t" }, "tt", "<cmd>:ToggleTerm dir=git_dir<cr>")

			function Set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<c-[>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua Set_terminal_keymaps()")
		end,
	},
}
