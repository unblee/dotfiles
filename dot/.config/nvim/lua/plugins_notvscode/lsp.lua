return {
	{
		"neovim/nvim-lspconfig",
		config = function() -- lspconfig
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Improve Lua Language Server completion
			-- ref. https://zenn.dev/uga_rosa/articles/afe384341fc2e1

			---@param names string[]
			---@return string[]
			local function get_plugin_paths(names)
				local plugins = require("lazy.core.config").plugins
				local paths = {}
				for _, name in ipairs(names) do
					if plugins[name] then
						table.insert(paths, plugins[name].dir .. "/lua")
					else
						vim.notify("Invalid plugin name: " .. name)
					end
				end
				return paths
			end

			---@param plugins string[]
			---@return string[]
			local function library(plugins)
				local paths = get_plugin_paths(plugins)
				table.insert(paths, vim.fn.stdpath("config") .. "/lua")
				table.insert(paths, vim.env.VIMRUNTIME .. "/lua")
				return paths
			end

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
			-- brew install bash-language-server
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
			-- brew install biome
			lspconfig.biome.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
			-- dockerfile-language-server
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
			-- brew install gopls
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
			-- brew install vscode-langservers-extracted
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
			-- brew install vscode-langservers-extracted
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
			-- brew install lua-language-server
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						runtime = {
							version = "LuaJIT",
							pathStrict = true,
							path = { "?.lua", "?/init.lua" },
						},
						workspace = {
							library = library({ "lazy.nvim" }),
							checkThirdParty = "Disable",
						},
					},
				},
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruby_lsp
			-- gem install ruby-lsp
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff
			-- brew install ruff
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
			-- brew install rust-analyzer
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraformls
			-- brew install terraform-ls
			lspconfig.terraformls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls
			-- brew install typescript-language-server
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls
			-- mise use -g npm:vim-language-server
			lspconfig.vimls.setup({
				capabilities = capabilities,
			})

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
			-- brew install yaml-language-server
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			-- -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#typos_lsp
			-- --
			-- lspconfig.typos_lsp.setup({
			-- capabilities = capabilities
			--   -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
			--   cmd_env = { RUST_LOG = "error" },
			--   init_options = {
			--     -- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
			--     -- Defaults to error.
			--     diagnosticSeverity = "Error",
			--   }
			-- })
		end,
	},

	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	event = "LspAttach",
	-- 	enabled = vim.bo.ft ~= "lazy",
	-- 	config = function()
	-- 		require("lsp_lines").setup({})
	-- 		vim.diagnostic.config({
	-- 			virtual_text = false, -- removes duplication of diagnostic messages due to lsp_lines
	-- 			virtual_lines = true,
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"kosayoda/nvim-lightbulb",
	-- 	config = function()
	-- 		vim.api.nvim_set_hl(0, "LightbulbSign", { fg = "#ffff00" })
	-- 		require("nvim-lightbulb").setup({
	-- 			autocmd = { enabled = true },
	-- 			sign = {
	-- 				text = " ",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"aznhe21/actions-preview.nvim",
		event = "LspAttach",
		config = function()
			local ap = require("actions-preview")
			ap.setup({
				highlight_command = { require("actions-preview.highlight").delta() },
			})
			vim.keymap.set({ "n", "x" }, "gc", ap.code_actions)
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			-- keymap
			vim.keymap.set("n", "gh", "<cmd>:Lspsaga hover_doc<CR>")
			vim.keymap.set("n", "gd", "<cmd>:Lspsaga goto_definition<CR>")
			vim.keymap.set("n", "gD", "<cmd>:Lspsaga peek_definition<CR>")
			vim.keymap.set("n", "gi", "<cmd>:lua vim.lsp.buf.implementation()<CR>")
			vim.keymap.set("n", "gr", "<cmd>:lua vim.lsp.buf.references()<CR>")
			vim.keymap.set("n", "gR", "<cmd>:lua vim.lsp.buf.rename()<CR>")
			vim.keymap.set("n", "gt", "<cmd>:Lspsaga goto_type_definition<CR>")
			vim.keymap.set("n", "gT", "<cmd>:Lspsaga peek_type_definition<CR>")

			vim.api.nvim_set_hl(0, "SagaLightBulb", { fg = "#ffff00" })
			require("lspsaga").setup({
				symbol_in_winbar = { enable = false },
				lightbulb = {
					virtual_text = false,
				},
				ui = {
					code_action = " ",
				},
			})
		end,
	},
}
