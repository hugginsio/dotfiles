-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.autoread = true

-- Undo files
local undodir = vim.fn.glob(vim.fn.stdpath "data" .. "/undo/")
local stat = vim.loop.fs_stat(undodir)
if stat and not stat.type == "directory" then
  vim.fn.mkdir(undodir, "p")
end

-- Bash like keys for the command line
vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("c", "<C-e>", "<end>")
vim.keymap.set("c", "<C-k>", "<C-u>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-p>", "<Up>")

-- 0 goes to first character in line
vim.keymap.set("n", "0", "^")
vim.keymap.set({ "v", "n" }, "#", "<cmd>call VisualSelection('', '')<cr>?<cr>=@/<cr><cr>")
