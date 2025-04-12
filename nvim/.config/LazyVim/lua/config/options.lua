-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ====== SPELLING ======
-- just toggle it
-- opt.spell = false                   -- turns on spellchecker
-- opt.spelllang = { 'en_us' }        -- sets spelling dictionary

-- vim.opt.spelllang = { "en", "vi_VN" }
-- vim.opt.spell = false

-- vim.opt_local.spell = false

-- ====== END SPELLING ======

-- root dir now == cwd
-- Why Does Neo Tree Show Different Directories for CWD and Root Dir in a Monorepo?
-- https://github.com/LazyVim/LazyVim/discussions/2150
vim.g.root_spec = { "cwd" }

-- then you need to set the option below.
vim.g.lazyvim_picker = "telescope"

-- Default LazyVim, no need to set
-- opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- opt.foldmethod = "expr"
-- opt.foldtext = ""

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

-- https://dev.to/cbartlett/word-wrapping-in-vim-4oog
-- true by default
-- <leader>uw to toggle
vim.opt.wrap = true
-- Wraps text at the end of a word. This is what prevents a word from being split in two.
-- vim.opt.linebreak = true -- beta