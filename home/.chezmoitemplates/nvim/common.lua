-- https://neovim.io/doc/user/lua.html

-- Undo files
local undodir = vim.fn.glob(vim.fn.stdpath "data" .. "/undo/")
local stat = vim.loop.fs_stat(undodir)
if stat and not stat.type == "directory" then
  vim.fn.mkdir(undodir, "p")
end

-- Force set defaults
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.belloff = "all"
vim.opt.clipboard = ""
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.foldexpr = ""
vim.opt.foldmethod = "manual"
vim.opt.guifont = "monospace:h17"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.magic = true
vim.opt.modelines = 3
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 7
vim.opt.shiftwidth = 2
vim.opt.shortmess = "aoOtTf"
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.sidescrolloff = 7
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.startofline = false
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = undodir
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.whichwrap = "<,>,h,l"
vim.opt.wildignore = "*.o,*~,*.pyc,*.dll,*.pdb,*.nupkg,*.exe,*.jpg,*.png,*.bin,tags,**/target/**,**/node_modules/**,.git/*,.DS_Store"
vim.opt.wrap = false
vim.opt.writebackup = false

-- Bash like keys for the command line
vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("c", "<C-e>", "<end>")
vim.keymap.set("c", "<C-k>", "<C-u>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-p>", "<Up>")

-- 0 goes to first character in line
vim.keymap.set("n", "0", "^")
vim.keymap.set({ "v", "n" }, "#", "<cmd>call VisualSelection('', '')<cr>?<cr>=@/<cr><cr>")

-- which-key particulars
vim.o.timeout = true
vim.o.timeoutlen = 250
