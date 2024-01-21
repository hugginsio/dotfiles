-- Acknowledgements:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

local function unmap(mode, lhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.del(mode, lhs, opts)
end

map("n", "<leader>l", "<cmd>:Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>r", "<cmd>:Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wc", "<C-W>c", { desc = "Close window", remap = true })
map("n", "<leader>wh", "<C-W>h", { desc = "Go to the left window", remap = true })
map("n", "<leader>wj", "<C-W>j", { desc = "Go to the down window", remap = true })
map("n", "<leader>wk", "<C-W>k", { desc = "Go to the up window", remap = true })
map("n", "<leader>wl", "<C-W>l", { desc = "Go to the right window", remap = true })
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Move to window using the <alt> hjkl keys
map("n", "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <alt> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines using <shift>+<alt>+jk keys
map("n", "<S-A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<S-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<S-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<S-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to other buffer" })

-- tabs
map("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Prev tab" })
map("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New tab" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map( "n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / clear hlsearch / diff update" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- easy open terminal
map("n", "<leader>tb", "<cmd>vsplit<bar>term fish<cr>", { desc = "Open terminal buffer"})
map("n", "<leader>ts", "<cmd>split<bar>term fish<cr>", { desc = "Split terminal right"})
map("n", "<leader>tv", "<cmd>vsplit<bar>term fish<cr>", { desc = "Split terminal below"})
