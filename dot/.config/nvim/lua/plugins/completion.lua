return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "ray-x/cmp-sql", ft = "sql" },
			{ "saadparwaiz1/cmp_luasnip" },
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			local colors = require("tokyonight.colors").setup()
			vim.api.nvim_set_hl(0, "CmpWindowCompNormal", { bg = colors.bg_highlight, blend = 0 })
			vim.api.nvim_set_hl(0, "CmpWindowCompCursorLine", { bg = colors.comment, fg = colors.fg, blend = 0 })
			vim.api.nvim_set_hl(0, "CmpWindowDocNormal", { bg = colors.bg_highlight, blend = 0 })
			vim.api.nvim_set_hl(0, "CmpWindowDocFloadBorder", { bg = colors.bg_highlight, blend = 0 })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.blue })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })

			cmp.setup({
				enabled = function()
					-- disable completion in comments
					-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#disabling-completion-in-certain-contexts-such-as-comments
					local context = require("cmp.config.context")
					local at_comments = context.in_treesitter_capture("comment") or context.in_syntax_group("Comment")
					if at_comments then
						return false
					end

					-- disable completion in prompt (e.g. TelescopePrompt)
					local buftype = vim.bo.buftype
					if buftype == "prompt" then
						return false
					end

					-- disable completion in floating window
					local is_floating = vim.api.nvim_win_get_config(0).relative ~= ""
					if is_floating then
						return false
					end

					return true
				end,
				experimental = { ghost_text = true },
				window = {
					completion = {
						winhighlight = "Normal:CmpWindowCompNormal,FloatBorder:None,CursorLine:CmpWindowCompCursorLine,Search:None",
					},
					documentation = {
						winhighlight = "Normal:CmpWindowDocNormal,FloatBorder:CmpWindowDocFloadBorder,Search:None",
						border = "solid",
					},
				},
				snippet = {
					-- REQUIRED - must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<Down>"] = {
						i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					},
					["<Up>"] = {
						i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					},
					["<C-n>"] = {
						i = function()
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
							else
								cmp.complete()
							end
						end,
					},
					["<C-p>"] = {
						i = function()
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
							else
								cmp.complete()
							end
						end,
					},
					["<CR>"] = function(fallback)
						if cmp.visible() then
							if cmp.get_selected_entry() then
								cmp.confirm()
							else
								fallback()
							end
						else
							fallback()
						end
					end,
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							if cmp.get_selected_entry() then
								cmp.confirm()
							else
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
								cmp.confirm()
							end
						else
							fallback()
						end
					end,
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "sql" },
					{ name = "buffer" },
					{ name = "spell" },
					{ name = "path" },
					{ name = "nvim_lua" },
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({
							mode = "symbol_text",
							maxwidth = function()
								return math.floor(0.45 * vim.o.columns)
							end,
							ellipsis_char = "...",
							show_labelDetails = true,
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = (strings[1] or "")
						kind.menu = "(" .. (strings[2] or "") .. ")"
						return kind
					end,
				},
				performance = {
					max_view_entries = 100,
					fetching_timeout = 100,
				},
			})
			-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#add-parentheses-after-selecting-function-or-method-item
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
