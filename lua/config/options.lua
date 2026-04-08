local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.termguicolors = true
opt.splitright = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindent = true
opt.smartindent = true
opt.autoindent = true
opt.updatetime = 500

-- DISABLE MOUSE COMPLETELY
opt.mouse = ""

vim.cmd("filetype plugin indent on")
