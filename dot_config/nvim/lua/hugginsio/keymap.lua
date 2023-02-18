-- keymap

-- leader key
vim.keymap.set("n", " ", "<Nop>")
vim.g.mapleader = " "

-- misc. leader mappings
vim.keymap.set("n", "<Leader>da", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "<Leader>dd", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<Leader>th", ":new<CR>:terminal<CR>")
vim.keymap.set("n", "<Leader>tt", ":terminal<CR>")
vim.keymap.set("n", "<Leader>tv", ":vnew<CR>:terminal<CR>")

-- https://neovim.io/doc/user/nvim_terminal_emulator.html
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("t", "<C-x>", "<C-\\><C-n><C-w>q")

-- buffer controls
vim.keymap.set("n", "<Leader>bb", "<C-^>")
vim.keymap.set("n", "<Leader>bd", ":bd<CR>")
vim.keymap.set("n", "<Leader>bg", ":ls<CR>:buffer<Space>")
vim.keymap.set("n", "<Leader>bh", ":new<CR>")
vim.keymap.set("n", "<Leader>bk", ":bd!<CR>")
vim.keymap.set("n", "<Leader>bl", ":ls<CR>")
vim.keymap.set("n", "<Leader>bn", ":bn<CR>")
vim.keymap.set("n", "<Leader>bp", ":bp<CR>")
vim.keymap.set("n", "<Leader>bv", ":vnew<CR>")
