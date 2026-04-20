vim.g.mapleader = " "

-- Center screen after half-page scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen and expand folds when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- DISABLE MOUSE COMPLETELY
vim.keymap.set({ "", "i" }, "<ScrollWheelUp>", "<Nop>")
vim.keymap.set({ "", "i" }, "<ScrollWheelDown>", "<Nop>")
vim.keymap.set({ "", "i" }, "<LeftMouse>", "<Nop>")
vim.keymap.set({ "", "i" }, "<RightMouse>", "<Nop>")

-- Disable arrow keys
vim.keymap.set({ "n", "i", "v", "s", "c" }, "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "s", "c" }, "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "s", "c" }, "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "s", "c" }, "<Right>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "H", ":bprevious<CR>", { silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "L", ":bnext<CR>", { silent = true, desc = "Next Buffer" })

-- Terminal window navigation
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window" })

-- Toggles
local function toggle(option, name)
	local val = not vim.opt[option]:get()
	vim.opt[option] = val
	vim.notify((val and "Enabled " or "Disabled ") .. name)
end

vim.keymap.set("n", "<leader>us", function()
	toggle("spell", "Spelling")
end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>uw", function()
	toggle("wrap", "Wrap")
end, { desc = "Toggle Wrap" })
vim.keymap.set("n", "<leader>ur", function()
	toggle("relativenumber", "Relative Number")
end, { desc = "Toggle Relative Number" })
vim.keymap.set("n", "<leader>ul", function()
	toggle("number", "Line Number")
end, { desc = "Toggle Line Number" })
vim.keymap.set("n", "<leader>ud", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	vim.notify((vim.diagnostic.is_enabled() and "Enabled " or "Disabled ") .. "Diagnostics")
end, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>uh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	vim.notify((vim.lsp.inlay_hint.is_enabled() and "Enabled " or "Disabled ") .. "Inlay Hints")
end, { desc = "Toggle Inlay Hints" })
