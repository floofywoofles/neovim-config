return {
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
}
