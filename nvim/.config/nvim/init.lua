-- START testing Lua commands
-- use `:messages` to view all logged messages

-- print('hello from init.lua')
-- vim.notify("bu vu kim phuong")
-- END testing Lua commands

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- mapleader là 1 'internal variable'. Nó không phải là 1 option nhé
-- distinguish leader vs super key which is the window key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false
vim.g.have_nerd_font = true

-- require .lua files in ./lua/
require("vim-options")
require("keymaps")

-- Nếu path là ~/lua/core/keymaps.lua
-- require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--

-- NOTE: Here is where you install your plugins.
require('lazy').setup("plugins", -- The plugins/ directory in ./lua/
{ 
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- gruvbox colorscheme START
vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

local colorscheme = "gruvbox" -- change this variable to your colorscheme's name

-- error handling in Lua using protected call
-- src: https://www.youtube.com/watch?v=RtNPfJKNr_8&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=6
-- `..` in string concatenation in Lua
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify('colorscheme "' .. colorscheme .. '" not found!')
  return
end
-- gruvbox colorscheme END

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- ####### START Luasnip #######

-- Load all snippets from the nvim/LuaSnip directory at startup
-- require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

-- ####### END Luasnip #######