return {
    -- Nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-tree").setup()
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
        end,
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
        opts = { open_for_directories = true, floating_window_scaling_factor = 0.8 },
    },

    -- Fzf-lua
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")
            local theme_utils = require("config.theme_utils")
            fzf.setup({ winopts = { preview = { default = "builtin" } } })
            vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf Files" })
            vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Fzf Live Grep" })
            vim.keymap.set("n", "<leader>t", function()
                fzf.colorschemes({
                    actions = {
                        ["default"] = function(selected)
                            local theme = selected[1]
                            vim.cmd.colorscheme(theme)
                            theme_utils.save_theme(theme)
                        end,
                    },
                })
            end, { desc = "Theme Switcher" })
        end,
    },
}
