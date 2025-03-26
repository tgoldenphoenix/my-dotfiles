return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed) 
        ensure_installed = {
          "lua",
          "vim", "vimdoc", "javascript", "html",
          "python"
        },
        -- List of parsers to ignore installing (or "all")
        ignore_install = { "latex" },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,
          highlight = { enable = true },

          -- treesitter indentation suck!
          -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#indentation
          indent = { enable = false },

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = false,
        })
    end
}
