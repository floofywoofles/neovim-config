local M = {}

M.theme_cache = vim.fn.stdpath("cache") .. "/theme.txt"

function M.save_theme(theme)
    local f = io.open(M.theme_cache, "w")
    if f then
        f:write(theme)
        f:close()
    end
end

function M.load_theme()
    local f = io.open(M.theme_cache, "r")
    if f then
        local theme = f:read("*all"):gsub("%s+", "")
        f:close()
        if theme ~= "" then
            return theme
        end
    end
    return "catppuccin" -- Default fallback
end

return M
