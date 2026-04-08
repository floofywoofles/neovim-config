return {
	-- Neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
				end,
				desc = "File Explorer (Root Dir)",
			},
			{
				"<leader>E",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.api.nvim_buf_get_name(0) })
				end,
				desc = "File Explorer (Buffer Dir)",
			},
		},
		opts = {
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "open_default",
			},
		},
	},

	-- Yazi
	{
		"mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>fe",
                function()
                    require("yazi").yazi()
                end,
                desc = "Yazi (Current File)",
            },
        },
        opts = { open_for_directories = false, floating_window_scaling_factor = 0.8 },
    },
}
