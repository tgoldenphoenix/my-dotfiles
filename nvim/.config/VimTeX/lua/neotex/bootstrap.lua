-- BOOTSTRAP LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--  To check the current status of your plugins, run
--    :Lazy
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins you can run
--    :Lazy update

-- ===== old way of setup lazy =====
-- require("lazy").setup({
--   { import = "neotex.plugins" },    -- main plugins directory
--   { import = "neotex.plugins.lsp" } -- lsp plugins directory
-- }, {
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   install = {
--     colorscheme = { "gruvbox" },
--   },
--   -- automatically check for plugin updates
--   checker = {
--     enabled = true,
--     notify = false,
--   }
--   -- ,
--   -- change_detection = {
--   --   notify = false,
--   -- },
-- })

require("lazy").setup({
  spec = {
    { import = "neotex.plugins" },    -- main plugins directory
    -- { import = "neotex.plugins.lsp" }, -- lsp plugins directory
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = {
    colorscheme = { "gruvbox" },
  },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
  }
  -- ,
  -- change_detection = {
  --   notify = false,
  -- },
})
