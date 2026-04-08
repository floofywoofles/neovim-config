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
