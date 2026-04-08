-- 1. THE 0.11 COMPATIBILITY PATCH
if vim.fn.has("nvim-0.11") == 1 then
    pcall(function()
        vim.treesitter.language.ft_to_lang = function(ft)
            return vim.treesitter.language.get_lang(ft) or ft
        end
    end)
end

vim.loader.enable()

-- Require core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Initialize lazy.nvim
require("config.lazy")
