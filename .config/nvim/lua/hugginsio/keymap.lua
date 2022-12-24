-- keymap

-- leader key
vim.g.mapleader = " "
vim.keymap.set("n", " ", "<Nop>")

-- misc. leader mappings
vim.keymap.set("n", "<leader>dd", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>da", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "<silent> <leader>tt", ":terminal<CR>")
vim.keymap.set("n", "<silent> <leader>tv", ":vnew<CR>:terminal<CR>")
vim.keymap.set("n", "<silent> <leader>th", ":new<CR>:terminal<CR>")

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
vim.keymap.set("n", "<silent> <leader>bb", "<C-^>")
vim.keymap.set("n", "<silent> <leader>bn", ":bn<CR>")
vim.keymap.set("n", "<silent> <leader>bp", ":bp<CR>")
vim.keymap.set("n", "<silent> <leader>bd", ":bd<CR>")
vim.keymap.set("n", "<silent> <leader>bk", ":bd!<CR>")
vim.keymap.set("n", "<silent> <leader>bl", ":ls<CR>")
vim.keymap.set("n", "<silent> <leader>bg", ":ls<CR>:buffer<Space>")
vim.keymap.set("n", "<silent> <leader>bh", ":new<CR>")
vim.keymap.set("n", "<silent> <leader>bv", ":vnew<CR>")
