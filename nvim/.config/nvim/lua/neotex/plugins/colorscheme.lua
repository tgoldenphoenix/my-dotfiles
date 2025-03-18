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
    
    -- VERY IMPORTANT: Make sure to call setup() BEFORE calling the colorscheme command, to use your custom configs
    vim.cmd("colorscheme gruvbox")
  end,
  -- opts = {}
}

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
