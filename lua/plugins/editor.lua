return {
    -- Harpoon2
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon Add" })
            vim.keymap.set("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon Menu" })

            vim.keymap.set("n", "<C-h>", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<C-j>", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<C-k>", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<C-l>", function()
                harpoon:list():select(4)
            end)
        end,
    },

    -- Flash.nvim
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
    },

    -- Comment
    { "numToStr/Comment.nvim", opts = {}, lazy = false },

    -- Autopairs
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = { check_ts = true } },
}
