-- GRUVBOX
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("gruvbox").setup({
        -- for highlight group
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
        },
        -- affected by opacity config in wezterm
        transparent_mode = true,
      })
      
      -- VERY IMPORTANT: Make sure to call setup() BEFORE calling the colorscheme command, to use your custom configs
      vim.cmd("colorscheme gruvbox")
    end,
    -- opts = {}
  },
  
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  }
}