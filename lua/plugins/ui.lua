return {
	-- Dashbord (Alpha-nvim)
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
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
				dashboard.button("f", "󰈞  Find File", ":FzfLua files<CR>"),
				dashboard.button("r", "󰄉  Recent Files", ":FzfLua oldfiles<CR>"),
				dashboard.button("e", "󰙅  Explorer", ":NvimTreeToggle<CR>"),
				dashboard.button("c", "󰒓  Config", ":e $MYVIMRC<CR>"),
				dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
			}
			alpha.setup(dashboard.config)
		end,
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
					cmp = true,
					fzf = true,
					nvimtree = true,
					treesitter = true,
					native_lsp = { enabled = true, virtual_text = { errors = { "italic" }, hints = { "italic" } } },
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
					always_show_bufferline = true,
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
					lualine_c = { "diagnostics" },
					lualine_x = { "encoding", "fileformat", "filetype" },
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
