-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- just toggle it
-- opt.spell = false                   -- turns on spellchecker
-- opt.spelllang = { 'en_us' }        -- sets spelling dictionary

-- vim.opt.spelllang = { "en", "vi_VN" }
-- vim.opt.spell = false

-- vim.opt_local.spell = false

-- root dir now == cwd
-- Why Does Neo Tree Show Different Directories for CWD and Root Dir in a Monorepo?
-- https://github.com/LazyVim/LazyVim/discussions/2150
vim.g.root_spec = { "cwd" }