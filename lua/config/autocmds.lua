vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("TerminalUI", { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.cmd("startinsert")
    end,
})

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
