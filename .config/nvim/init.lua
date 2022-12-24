-- init

-- misc. global options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ic = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 7
vim.opt.laststatus = 3
vim.opt.signcolumn = "number"
vim.opt.showmode = false

-- open new split panes to right and below

vim.opt.splitright = true
vim.opt.splitbelow = true

-- lua/hugginsio
require("hugginsio")
