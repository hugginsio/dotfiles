-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.autoread = true

-- Move backup, swap, and undo directories
local state = vim.fn.stdpath("state")
for opt, name in pairs({ backupdir = "backup", directory = "swap", undodir = "undo" }) do
  local dir = vim.fs.joinpath(state, name)
  vim.fn.mkdir(dir, "p")
  vim.opt[opt] = dir .. "//"
end

vim.opt.backup = true
vim.opt.undofile = true

-- Bash like keys for the command line
vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("c", "<C-e>", "<end>")
vim.keymap.set("c", "<C-k>", "<C-u>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-p>", "<Up>")

-- 0 goes to first character in line
vim.keymap.set("n", "0", "^")
vim.keymap.set({ "v", "n" }, "#", "<cmd>call VisualSelection('', '')<cr>?<cr>=@/<cr><cr>")
