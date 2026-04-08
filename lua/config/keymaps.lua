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
