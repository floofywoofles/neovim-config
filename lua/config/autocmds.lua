-- SHOW DOCUMENTATION ON HOVER
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        for _, winid in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(winid).relative ~= "" then
                return
            end
        end
        vim.lsp.buf.hover()
    end,
})

-- SAVE THEME ON CHANGE
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local theme = vim.g.colors_name
        if theme then
            require("config.theme_utils").save_theme(theme)
        end
    end,
})

-- OPEN SNACKS PICKER ON DIRECTORY
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))
        if stats and stats.type == "directory" then
            local bufnr = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
            vim.schedule(function()
                Snacks.picker.smart()
            end)
        end
    end,
})
