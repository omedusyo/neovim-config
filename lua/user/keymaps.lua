local myvimrc = "~/.config/nvim/init.lua"
local myvimdir = "~/.config/nvim/lua/user/"

local function keymap(mode, key, command)
  local opts = {
    noremap = true, -- no recurse map
    silent = true,
  }
  return vim.api.nvim_set_keymap(mode, key, command, opts)
end

-- Leader
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Selections
keymap("", "<leader>h", ":nohlsearch<CR>")

-- Save & Quit
keymap("", "<leader>w", ":w<CR>")
keymap("", "<leader>q", ":q<CR>")

-- Sources init.lua
-- TODO: How to do this? The following command doesn't seem to work
keymap("", "<leader>s", ":source " .. myvimrc .. "<CR>")

-- Open init.lua in a new tab
keymap("", "<leader>v", ":tabedit " .. myvimdir .. "<CR>")

-- Tabs
keymap("n", "<C-t>", ":tabedit<CR>")
keymap("i", "<C-t>", "<ESC>:tabedit<CR>")

keymap("n", "<C-h>", ":tabprevious<CR>")
keymap("i", "<C-h>", "<ESC>:tabprevious<CR>")

keymap("n", "<C-l>", ":tabnext<CR>")
keymap("i", "<C-l>", "<ESC>:tabnext<CR>")

-- Splitting panes
keymap("n", "|", ":rightbelow vsplit<CR>")
keymap("n", "_", ":rightbelow split<CR>")

-- Resizing panes
keymap("n", "<Up>", ":resize +2<CR>")
keymap("n", "<Down>", ":resize -2<CR>")
keymap("n", "<Left>", ":vertical resize +2<CR>")
keymap("n", "<Right>", ":vertical resize -2<CR>")

-- Copy & Paste
keymap("", "<leader>y", "\"+y")
keymap("", "<leader>d", "\"+d")
keymap("", "<leader>p", "\"+p")
keymap("", "<leader>p", "\"+p")

keymap("v", "p", '"_dP') -- When pasting something into a visual selection, don't yank the selected thing.

-- Better Indentation
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")


-- Move text up and down in visual mode
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")


-- File Explorer
keymap("n", "<C-n>", ":NvimTreeToggle<CR>")


-- Telescope Fuzzy Finder
keymap("n", "<C-p>", ":Telescope find_files<CR>")
keymap("n", "<C-f>", ":Telescope live_grep<CR>")
keymap("n", "<leader>b", ":Telescope buffers<CR>")
keymap("n", "<leader>H", ":Telescope help_tags<CR>")

-- Terminal in vim
keymap("n", "C-m", ":exe v:count1 . \"ToggleTerm\"<CR>")
keymap("i", "C-m", "<Esc>:exe v:count1 . \"ToggleTerm\"<CR>")

