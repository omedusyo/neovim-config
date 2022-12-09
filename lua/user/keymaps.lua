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
-- keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Selections
keymap("", "<leader>h", ":nohlsearch<CR>")

-- Save & Quit
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")

-- Sources init.lua
-- TODO: How to do this? The following command doesn't seem to work
keymap("", "<leader>s", ":source " .. myvimrc .. "<CR>")

-- Open init.lua in a new tab
keymap("", "<leader>v", ":tabedit " .. myvimdir .. "<CR>")

-- Tabs
-- keymap("n", "<C-t>", ":tabedit<CR>")
-- keymap("i", "<C-t>", "<ESC>:tabedit<CR>")
keymap("n", "<C-t>", ":tab split<CR>")
keymap("i", "<C-t>", "<ESC>:tab split<CR>")

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
-- -- keymap("n", "<C-n>", ":NvimTreeToggle<CR>")
keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")


-- Telescope Fuzzy Finder
keymap("n", "<C-p>", ":Telescope find_files<CR>")
keymap("n", "<C-f>", ":Telescope live_grep<CR>")
keymap("n", "<leader>b", ":Telescope buffers<CR>")
keymap("n", "<leader>H", ":Telescope help_tags<CR>")


-- Harpoon
keymap("n", "<leader>t", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
keymap("n", "`", ":lua require(\"harpoon.mark\").add_file()<CR>")
-- TODO: Remap `<leader>n` to harpoon the current buffer to `n`
--       Probably can't be done, because this plugin doesn't seem to allow Harpooning the same buffer to multiple indexes.
-- for i = 1, 9 do
--   keymap("n", "<leader>" .. tostring(i), ":lua require(\"harpoon.ui\").nav_file(" .. tostring(i) .. ")<CR>")
-- end

-- The following maps 1, 2, 3, 4, 5, 6, 7 to switch between Harpooned buffers.
-- TODO: You should recover the functionality of `go_to_line(x)`
for i = 1, 7 do
  keymap("n", tostring(i), ":lua require(\"harpoon.ui\").nav_file(" .. tostring(i) .. ")<CR>")
end


-- Tagbar
keymap("n", "<tab>", ":TagbarToggle<CR>")


-- Repeat last macro
-- TODO
-- keymap("n", "<C-.>", "@@")

-- My Elm stuff
-- TODO
-- keymap("n", "<C-l>", ":lua myElmStuff.insertDebug()<CR>")
-- keymap("i", "<C-l>", "<Esc>:lua myElmStuff.insertDebug()<CR>i")

