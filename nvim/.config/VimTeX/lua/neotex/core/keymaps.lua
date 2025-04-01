-- local builtin = require 'telescope.builtin'

local opts = { noremap = true, silent = true }

-- Shorten function name
-- local keymap = vim.keymap.set

-- set a global mapping for the given mode
-- src: https://neovim.io/doc/user/api.html#nvim_set_keymap()
local keymap = vim.api.nvim_set_keymap

-- local wk = require("which-key")    -- Nếu require which-key như v sẽ gặp error
-- The root for lua importation is: ~/.config/nvim/lua
-- src: https://vi.stackexchange.com/questions/45546/neovim-requirewhich-key-in-keymaps-lua-file-gives-error
-- local wk = require("plugins.which-key")  -- chuẩn

-- Remap <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- mapleader là 1 'internal variable'. Nó không phải là 1 option nhé
-- distinguish leader vs super key which is the window key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--=================== General Keymaps ===================

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)
keymap("v", "p", '"_p', opts)

-- Avoid cutting text pasted over
-- yank and paste over selected text but hold onto the yanked text
keymap("v", "p", '"_dP', opts)

-- Unmappings
keymap("n", "<C-z>", "<nop>", opts) -- suspend the Vim session and sends it to the background
-- keymap("n", "gc", "<nop>", opts)  -- Comment/Uncomment a Selection
-- keymap("n", "gcc", "<nop>", opts) -- Comment/Uncomment a Line

-- Toggle comments. Dùng `;` chứ không dùng `/`
-- keymap('n', "<C-;>", '<Plug>(comment_toggle_linewise_current)', opts)
-- keymap('x', "<C-;>", '<Plug>(comment_toggle_linewise_visual)', opts)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Kill search highlights
keymap("n", "<CR>", "<cmd>noh<CR>", opts)

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Btw, dòng ở dưới này sẽ override dòng phía trên
-- vim.keymap.set('n', '<leader>q', '<cmd>override test<CR>')

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Fix 'Y', 'E'
keymap("n", "Y", "y$", opts) -- Yank (copy) from the current cursor position to the end of the line.
keymap("n", "E", "ge", opts) -- Moves the cursor backward to the end of the previous word.
keymap("v", "Y", "y$", opts)
-- keymap("v", "E", "ge", opts) -- causes errors with luasnip autocmp

-- Center cursor
keymap("n", "m", "zt", opts) -- moves the current line to the top of the window without changing the cursor position.
keymap("v", "m", "zt", opts)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- same keymaps, different syntax
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers, "S" stands for shift
keymap("n", "<TAB>", "", {
  callback = function()
    GotoBuffer(1, 1)
  end,
  desc = "Next buffer by modified time",
})
keymap("n", "<S-TAB>", "", {
  callback = function()
    GotoBuffer(1, -1)
  end,
  desc = "Previous buffer by modified time",
})
keymap("n", "<BS>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-BS>", "<CMD>bprevious<CR>", opts)
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Drag lines (Move text up and down)
-- Alt nhưng máy macOS xài option key
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- x = visual block mode
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<A-j>", ":m'>+<CR>gv", opts)
keymap("v", "<A-k>", ":m-2<CR>gv", opts)
-- Move text up and down, select text first
-- keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
-- keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Press jk fast to exit insert mode
-- Please remapped Caps Lock to Escape on a system-wide level and use that to exit insert mode
-- https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control/
-- keymap("i", "fd", "<ESC>", opts)

-- Horizontal line movments --
keymap("n", "<c-u>", "<c-u>zz", opts)
keymap("n", "<c-d>", "<c-d>zz", opts)

-- Horizontal line movments --
keymap("v", "<S-h>", "g^", opts)
keymap("v", "<S-l>", "g$", opts)
keymap("n", "<S-h>", "g^", opts)
keymap("n", "<S-l>", "g$", opts)

-- ===== START Navigate display lines =====
-- the default j and k motions move across physical lines, not the visible, soft-wrapped screen lines (displayed line)
-- một physical wrapped line có nhiều displayed line
-- https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
-- src: https://stackoverflow.com/questions/13376822/vim-line-numbers-on-display-lines

-- The old day
-- keymap("n", "J", "gj", opts)    -- Shift+j để navigate displayed line
-- keymap("n", "K", "gk", opts)
-- keymap("v", "J", "gj", opts)
-- keymap("v", "K", "gk", opts)

-- better up/down, the LazyVim way
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- ===== END Navigate display lines =====

-- Indentation
-- Use in visual mode, select and use arrow key to indent
keymap("v", "<", "<gv", opts) -- `v` = visual mode
keymap("v", ">", ">gv", opts)
keymap("n", "<", "<S-v><<esc>", opts)
keymap("n", ">", "<S-v>><esc>", opts)
-- keymap("v", "<", "<gv^", opts)
-- keymap("v", ">", ">gv^", opts)

-- save file
keymap("n", "<C-i>", ":update<CR>", opts)