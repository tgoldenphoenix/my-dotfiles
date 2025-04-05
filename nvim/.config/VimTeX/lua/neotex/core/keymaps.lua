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

-- Clear search and stop snippet on escape
-- <CR> already used to fold
vim.keymap.set({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  -- LazyVim.cmp.actions.snippet_stop()
  -- require("cmp").mapping.abort()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Kill search highlights
-- Use Escape, don't use enter conflict with fold
-- keymap("n", "<CR>", "<cmd>noh<CR>", opts)

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
-- I have a plugin for this already
-- keymap("n", "m", "zt", opts) -- moves the current line to the top of the window without changing the cursor position.
-- keymap("v", "m", "zt", opts)

-- Keybinds to make split navigation easier.
-- I don't need to split window in neovim yet
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
-- keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<A-h>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<A-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers, "S" stands for shift
-- keymap("n", "<TAB>", "", {
--   callback = function()
--     GotoBuffer(1, 1)
--   end,
--   desc = "Next buffer by modified time",
-- })
-- keymap("n", "<S-TAB>", "", {
--   callback = function()
--     GotoBuffer(1, -1)
--   end,
--   desc = "Previous buffer by modified time",
-- })
-- keymap("n", "<BS>", "<CMD>bnext<CR>", opts)
-- keymap("n", "<S-BS>", "<CMD>bprevious<CR>", opts)
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Quickly alternate between the last 2 files
-- LazyVim comes with the default shortcut <leader>bb for this, but I navigate
-- between alternate files way too often, so doing leader<space> is more useful for me
--
-- By default, in LazyVim, With leader<space> you usually find files in the root directory
--
-- I tried disabling leader<space> in telescope.lua and setting it in this file but didn't work
-- So I set the command to alternate between files directly in the `telescope.lua` file
--
-- With `:help registers` you can see the register below
-- Alternate buffer register "#
-- The command to switch is `:e #`
-- `:e` is used to `edit-a-file`, see `help :e`

-- HACK: Alternate between the last 2 tmux sessions or neovim buffers, blazingly fast, with a keymap
-- https://youtu.be/HWs3YEj05K4
--
-- Switch to the alternate buffer lamw25wmal
vim.keymap.set({ "n", "i", "v" }, "<M-BS>", "<cmd>e #<cr>", { desc = "[P]Alternate buffer" })
-- vim.keymap.set({ "n" }, "<leader><BS>", "<cmd>e #<cr>", { desc = "[P]Alternate buffer" })

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

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
-- zz to center the current line in the window
keymap("n", "<c-u>", "<c-u>zz", opts)
keymap("n", "<c-d>", "<c-d>zz", opts)

-- Horizontal line movments --
-- I dont need this????
-- keymap("v", "<S-h>", "g^", opts)
-- keymap("v", "<S-l>", "g$", opts)
-- keymap("n", "<S-h>", "g^", opts)
-- keymap("n", "<S-l>", "g$", opts)

-- ===== START Navigate display lines =====
-- the default j and k motions move across physical lines, not the visible, soft-wrapped screen lines (displayed line)
-- một physical wrapped line có nhiều displayed line
-- https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
-- src: https://stackoverflow.com/questions/13376822/vim-line-numbers-on-display-lines

-- The old way of doing things
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
-- now use <C-s>
-- keymap("n", "<C-i>", ":update<CR>", opts)

-------------------------------------------------------------------------------
--                           LaTeX Folding section
-------------------------------------------------------------------------------

-- folding only tested in /section files
-- I do not need to fold in master.tex yet!

local function fold_headings_of_level(level)

  local choice_tbl =
  {
    [1] = 'chapter',
    [2] = 'section',
  }

  if not choice_tbl[level] then
    -- print('do not support level: ' .. level)
    return
  end

  -- Move to the top of the FILE
  vim.cmd("normal! gg")
  -- Get the total number of lines
  local total_lines = vim.fn.line("$")
  for line = 1, total_lines do
    -- Get the content of the current line
    local line_content = vim.fn.getline(line)
    
    -- '^\\chapter%b{}$'
    -- will match \chapter{...}, \section{...}
    -- %b match a balanced pair in lua
    -- https://www.lua.org/pil/20.2.html
    if line_content:match("^\\" .. choice_tbl[level] .. "%b{}$") then
      print('match heading level: ' .. level)
      -- Move the cursor to the current line
      vim.fn.cursor(line, 1)
      -- Check if the current line has a fold level > 0
      local current_foldlevel = vim.fn.foldlevel(line)
      if current_foldlevel > 0 then
        -- Fold the heading if it matches the level
        if vim.fn.foldclosed(line) == -1 then
          -- print('this line is currently open (not fold)')
          -- print(vim.fn.foldlevel(line)) -- print out 0
          -- foldlevel is calculated using foldexpr
          -- which mean something is wrong with the foldexpr??

          -- print(vim.bo.filetype) -- print out filetype 'markdown' correctly
          vim.cmd("normal! za") -- this line yield error no fold found?
        end
        -- else
        --   vim.notify("No fold at line " .. line, vim.log.levels.WARN)
      end
    end
  end
end

local function fold_latex_headings(levels)
  -- set_foldmethod_expr()  -- he used to called this, now he use auto-cmd
  -- I save the view to know where to jump back after folding
  local saved_view = vim.fn.winsaveview()
  for _, level in ipairs(levels) do
    fold_headings_of_level(level)
  end
  vim.cmd("nohlsearch")
  -- Restore the view to jump to where I was
  vim.fn.winrestview(saved_view)
end

-- \chapter{} has foldlevel 1
-- \section{} has foldlevel 2
vim.keymap.set("n", "zj", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfj", function()
  -- Reloads the file to refresh folds, otheriise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_latex_headings({ 6, 5, 4, 3, 2, 1 })
  -- fold_latex_headings({ 6 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "Fold to \\chapter{}" })

-- Keymap for folding markdown headings of level 2 or above
-- I know, it reads like "madafaka" but "k" for me means "2"
vim.keymap.set("n", "zk", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfk", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_latex_headings({ 6, 5, 4, 3, 2 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "Fold to \\section{}" })

-- Use <CR> to fold when in normal mode instead of `za`
-- You can also try using <tab> (in normal mode)
-- To see help about folds use `:help fold`
-- Use `zi` will yield error
vim.keymap.set("n", "<TAB>", function()
  -- Get the current line number
  local line = vim.fn.line(".")
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.INFO)
  else
    vim.cmd("normal! za")
    vim.cmd("normal! zz") -- center the cursor line on screen
  end
end, { desc = "[P]Toggle fold" })

-- Keymap for unfolding markdown headings of level 2 or above
-- Changed all the markdown folding and unfolding keymaps from <leader>mfj to
-- zj, zk, zl, z; and zu respectively lamw25wmal
vim.keymap.set("n", "zu", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfu", function()
  -- Reloads the file to reflect the changes
  vim.cmd("edit!")
  vim.cmd("normal! zR") -- Unfold all headings
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Unfold all headings level 2 or above" })

-- Debug function
-- or <tab>
-- vim.keymap.set("n", "fv", function()
--   local current_line = vim.fn.line(".")
--   local line_content = vim.fn.getline(current_line)
--   local current_foldlevel = vim.fn.foldlevel(current_line)
  
--   print(string.format('line #%s; foldlevel %s', current_line, current_foldlevel))

-- end, { desc = "[F]olf [V]erbose: echo foldlevel & current line" })

-------------------------------------------------------------------------------
--                           LaTeX Folding section
-------------------------------------------------------------------------------