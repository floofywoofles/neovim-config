return {
	-- FZF Lua
	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files" },
			{ "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
			{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
			{ "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
			{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
			{ "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
			{ "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git Status" },
			{ "<leader>sb", "<cmd>FzfLua blines<cr>", desc = "Buffer Lines" },
			{ "<leader>sB", "<cmd>FzfLua lines<cr>", desc = "Grep Open Buffers" },
			{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
			{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Visual selection or word", mode = { "n", "x" } },
			{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
			{ "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Autocmds" },
			{ "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
			{ "<leader>sd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
			{ "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
			{ "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Marks" },
			{ "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
			{ "<leader>t", "<cmd>FzfLua colorschemes<cr>", desc = "Colorschemes" },
			{ "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Goto Definition" },
			{ "gr", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
			{ "gI", "<cmd>FzfLua lsp_implementations<cr>", desc = "Goto Implementation" },
			{ "gy", "<cmd>FzfLua lsp_typedefs<cr>", desc = "Goto T[y]pe Definition" },
			{ "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "LSP Symbols" },
		},
		opts = {},
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("f", "󰈞  Find File", "<cmd>FzfLua files<cr>"),
				dashboard.button("r", "󰄉  Recent Files", "<cmd>FzfLua oldfiles<cr>"),
				dashboard.button("e", "󰙅  Explorer", "<cmd>Neotree toggle<cr>"),
				dashboard.button("g", "󰊢  Lazygit", "<cmd>LazyGit<cr>"),
				dashboard.button("c", "󰒓  Config", "<cmd>e $MYVIMRC<cr>"),
				dashboard.button("q", "󰅚  Quit", "<cmd>qa<cr>"),
			}
			require("alpha").setup(dashboard.opts)
		end,
	},


	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-/>]],
			direction = "float",
			float_opts = {
				border = "curved",
			},
		},
		keys = {
			{ "<leader>ft", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
			{ "<c-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
			{ "<leader>st", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (Horizontal)" },
			{
				"<leader>rs",
				function()
					vim.ui.input({ prompt = "Run Shell Command: " }, function(input)
						if input and input ~= "" then
							vim.cmd("TermExec cmd='" .. input .. "' direction=horizontal")
						end
					end)
				end,
				desc = "Run Shell Command",
			},
		},
	},

	-- Lazygit
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit" },
			{ "<leader>gf", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "Lazygit Current File History" },
			{ "<leader>gl", "<cmd>LazyGitFilter<cr>", desc = "Lazygit Log" },
		},
	},

	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, l, r, opts)
					if not r then
						return
					end
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next Hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Prev Hunk" })

				-- Actions
				map("n", "<leader>gb", gs.blame_line, { desc = "Git Blame Line" })
				map("n", "<leader>gp", gs.preview_hunk, { desc = "Git Preview Hunk" })
			end,
		},
	},

	-- Bufdelete
	{
		"echasnovski/mini.bufremove",
		version = "*",
		keys = {
			{
				"<leader>bd",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete Buffer",
			},
		},
	},

	-- Indent Guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- Word illumination
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({})
			vim.keymap.set("n", "]]", function()
				require("illuminate").goto_next_reference(false)
			end, { desc = "Next Reference" })
			vim.keymap.set("n", "[[", function()
				require("illuminate").goto_prev_reference(false)
			end, { desc = "Prev Reference" })
		end,
	},

	-- Better UI for input and select
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- Bigfile
	{
		"LunarVim/bigfile.nvim",
		opts = {},
	},

	-- Smooth scrolling
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},

	-- Themes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			local theme_utils = require("config.theme_utils")
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					blink_cmp = true,
					treesitter = true,
					render_markdown = true,
					native_lsp = { enabled = true, virtual_text = { errors = { "italic" }, hints = { "italic" } } },
					bufferline = true,
					lualine = true,
					fzf = true,
					notify = true,
					gitsigns = true,
					which_key = true,
					illuminate = true,
					indent_blankline = { enabled = true },
				},
			})
			vim.cmd.colorscheme(theme_utils.load_theme())
		end,
	},
	{ "tiagovla/tokyodark.nvim", opts = {} },
	{ "folke/tokyonight.nvim", lazy = false },
	{ "ellisonleao/gruvbox.nvim", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "rose-pine/neovim", name = "rose-pine", lazy = false },

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					style_preset = require("bufferline").style_preset.default,
					separator_style = "slant",
					always_show_bufferline = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					color_icons = true,
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
					},
				},
			})
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					component_separators = { left = "｜", right = "｜" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "filename", "branch" },
					lualine_c = {
						"diagnostics",
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
						},
					},
					lualine_x = {
						"encoding",
						"fileformat",
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
				},
			})
		end,
	},

	-- Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
