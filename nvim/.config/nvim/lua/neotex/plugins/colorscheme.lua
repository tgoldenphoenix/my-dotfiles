-- GRUVBOX
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("gruvbox").setup({
      overrides = {
        -- THIS BLOCK
        SignColumn = { bg = "#282828" },
        NvimTreeCutHL = { fg = "#fb4934", bg = "#282828" },
        NvimTreeCopiedHL = { fg = "#b8bb26", bg = "#282828" },
        DiagnosticSignError = { fg = "#fb4934", bg = "#282828" },
        DiagnosticSignWarn = { fg = "#fabd2f", bg = "#282828" },
        DiagnosticSignHint = { fg = "#8ec07c", bg = "#282828" },
        DiagnosticSignInfo = { fg = "#d3869b", bg = "#282828" },
        -- OR THIS BLOCK
        -- NvimTreeCutHL = { fg="#fb4934", bg="#3c3836" },
        -- NvimTreeCopiedHL = { fg="#b8bb26", bg="#3c3836" }
        -- END
      }
    })
    vim.cmd("colorscheme gruvbox")
  end,
}

-- -- MONOKAI
-- return {
--   "tanvirtin/monokai.nvim",  -- Monokai theme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("monokai").setup {
--       -- palette = require("monokai").pro,  -- Use Monokai Pro palette
--     }
--   vim.cmd("colorscheme monokai")
--   end
-- }

-- -- KANAGAWA
-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('kanagawa').setup({
--       compile = false,  -- enable compiling the colorscheme
--       undercurl = true, -- enable undercurls
--       commentStyle = { italic = true },
--       functionStyle = {},
--       keywordStyle = { italic = true },
--       statementStyle = { bold = true },
--       typeStyle = {},
--       transparent = false,   -- do not set background color
--       dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--       colors = {
--         -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--       },
--       overrides = function(colors) -- add/modify highlights
--         return {}
--       end,
--       theme = "wave", -- Load "wave" theme when 'background' option is not set
--       background = {
--         -- map the value of 'background' option to a theme
--         dark = "wave", -- try "dragon" !
--         light = "lotus"
--       },
--     })
--     vim.cmd("colorscheme kanagawa") -- setup must be called before loading
--   end,
-- }


-- -- NIGHTFLY
-- return {
--   "bluz71/vim-nightfly-guicolors",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- load the colorscheme here
--     vim.cmd("colorscheme nightfly")
--   end,
-- }


-- return { 
--   { -- You can easily change to a different colorscheme.
--       -- Change the name of the colorscheme plugin below, and then
--       -- change the command in the config to whatever the name of that colorscheme is.
--       --
--       -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--       'folke/tokyonight.nvim',
--       priority = 1000, -- Make sure to load this before all the other start plugins.
--       config = function()
--           ---@diagnostic disable-next-line: missing-fields
--           require('tokyonight').setup {
--               styles = {
--                   comments = { italic = false }, -- Disable italics in comments
--               },
--           }

--           -- Load the colorscheme here.
--           -- Like many other themes, this one has different styles, and you could load
--           -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--           vim.cmd.colorscheme 'tokyonight-night'
--       end,
--   },
  
--   -- error handling in Lua using protected call
--   -- src: https://www.youtube.com/watch?v=RtNPfJKNr_8&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=6
--   -- `..` in string concatenation in Lua
--   -- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--   -- if not status_ok then
--   --   vim.notify('colorscheme "' .. colorscheme .. '" not found!')
--   --   return
--   -- end
-- }

-- OTHER TO TRY
-- "luisiacc/gruvbox-baby"
-- "folke/tokyonight.nvim"
-- "lunarvim/darkplus.nvim"
-- "navarasu/onedark.nvim"
-- "savq/melange"
-- "EdenEast/nightfox.nvim"
